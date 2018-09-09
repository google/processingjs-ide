/**
 * @license
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

goog.require('processingjs.lint');

/**
 * @type {!Object}
 */
var ide = (/** @type {function(): !Object} */ (function() {
  var ide = {
    /** @type {?Processing} */
    processing: null,
    /** @type {?CodeMirror} */
    codemirror: null,
    /** @type {?Element} */
    helpDiv: null,
    /** @type {?Element} */
    canvasDiv: null,
    /** @type {?Element} */
    canvas: null,
    /** @type {?HTMLCanvasElement} */
    processingCanvas: null,
    /** @type {?HTMLTextAreaElement} */
    textarea: null,
    /** @type {!Object<string, !Element>} */
    referenceDict: {},
    /** @type {number} */
    prevHeight: 0,
    /** @type {number} */
    prevWidth: 0,
    // The last saved sketch state.
    /** @type {string} */
    saved: "",
    // The cache for TTS blobs.
    /** @type {!Object<string, !Blob>} */
    ttsCache: new Object(),
  };

  /**
   * @return{!Object<string, string>}
   */
  function parseFragment() {
    var params = {};
    var parts = window.location.hash.substring(1).split('&');
    for (var i = 0; i < parts.length; i++) {
      var part = parts[i];
      if (part == '') continue;
      var pieces = part.split('=');
      if (pieces.length != 2) {
        window.console.error('Invalid fragment parameter: ' + part);
        continue;
      }
      params[pieces[0]] = decodeURIComponent(pieces[1]);
    }
    return params;
  }

  /**
   * Update the fragment hash with a new key-value pair.
   * If value is null, removes that part from the fragment hash.
   * @param {string} key
   * @param {?string} value
   */
  function updateFragment(key, value) {
    var params = parseFragment();
    if (value == null) {
      delete params[key];
    } else {
      params[key] = value;
    }
    var hash = "";
    for (key in params) {
      if (hash.length > 0) {
        hash = hash + '&';
      }
      hash = hash + encodeURIComponent(key) + '=' + encodeURIComponent(params[key]);
    }
    window.location.hash = hash;
  }

  function startSketch() {
    var /** string */ processingCode = ide.codemirror.getValue();
    // window.console.log(processingCode);
    try {
      // Try compilation and report an error if any.
      Processing.compile(processingCode);
    } catch(/** @type{!Error} */e) {
      window.console.error(e);
      ide.canvasDiv.innerHTML = 'Error: ' + e;
      return;
    }
    // Isolate the running Processing sketch in an iframe.
    var iframe = /** @type {!HTMLIFrameElement} */(document.createElement("iframe"));
    // Find out the links to processing.js library from the current
    // page.
    /** @type {string} */
    var processing_js;
    try {
      processing_js = /** @type {string} */ ($("script[src*='processing.']")[0].src);
    } catch(e) {
      processing_js = '/static/processing.min.js';
    }
    /** @type{string} */
    var style_css;
    try {
      style_css = $("link[href*='style']")[0].href.replace('style.css', 'inner.css');
    } catch(e) {
      style_css = '/static/inner.css';
    }
    // Create the iframe HTML.
    var iframeHtml = '<!DOCTYPE html>\n' +
      '<link rel="stylesheet" type="text/css" href="'+ style_css + '">'+
      '<script src="' + processing_js + '"></script>' + 
      '<script type="application/processing" data-processing-target="pjs">' + processingCode + '</script>'+
      '<canvas id="pjs"></canvas>';

    // Delete all existing children. This will drop the previous
    // iframe.
    $(ide.canvasDiv).empty();
    ide.canvasDiv.appendChild(iframe);
    var contentWindow = /** @type {!Window} */(iframe.contentWindow);
    contentWindow.document.open();
    contentWindow.document.write(iframeHtml);
    contentWindow.document.close();
    // Share the TTS cache.
    contentWindow['ttsCache'] = ide.ttsCache;
    window.setTimeout(function() {
      // Assume there is only one instance running in the iframe.
      /** @type {!Processing} */
      var inst;
      try {
        /** @suppress {missingProperties} */
        inst = /** @type {!Processing} */(contentWindow.Processing['instances'][0]);
      } catch(/** @type {!Error} */e) {
        window.console.log('Could not find Processing in <iframe>');
      }
      ide.processing = inst;
      iframe.style.height = '' + (inst.height) + 'px';
      iframe.style.width = '' + (inst.width) + 'px';
      ide.prevWidth = inst.width;
      ide.prevHeight = inst.height;
    }, 1000);
    // Detect the size inside of the sketch.
    var m = processingCode.match(/[\r\n \t]size[ \t]*\([ \t]*([0-9]+)[ \t]*,[ \t]*([0-9]+)[ \t]*\)/);
    if (m) {
      iframe.style.height = '' + m[2] + 'px';
      iframe.style.width = '' + m[1] + 'px';
    } else if (ide.prevHeight > 0) {
      // Otherwise default to the previously detected size.
      iframe.style.height = '' + (ide.prevHeight) + 'px';
      iframe.style.width = '' + (ide.prevWidth) + 'px';
    }
    ide.canvasDiv.style.overflow = 'visible';
  }

  function stopSketch() {
    switchSketchState(false);
    ide.canvasDiv.style.overflow = 'hidden';
    //ide.processingCanvas.style.width = '100%';
    //ide.processingCanvas.style.height = '100%';
  }

  /**
   * @param {boolean} on
   */
  function switchSketchState(on) {
    if (!ide.processing) {
      window.console.error('No processing instance');
      return;
    }
    if (on) {
      ide.processing.loop();
    } else {
      ide.processing.noLoop();
    }
  }

  /**
   * @param {string} refkey
   */
  function showHelpSection(refkey) {
    if (refkey.startsWith('#')) refkey = refkey.substr(1);
    /** @type {?Element} */
    var doc = ide.referenceDict[refkey];
    if (doc) {
      // Empty the help div.
      while (ide.helpDiv.lastChild) {
        ide.helpDiv.removeChild(ide.helpDiv.lastChild);
      }
      ide.helpDiv.appendChild(doc);
      updateFragment('help', refkey.substr(4));
      // TODO(salikh): Extract the iframe creation code into a function.
      $(doc).find('code.language-prerender, code.language-render').
          each(function(i, code) {
        //console.log(code);
        var pre = code.parentNode;
        if ($(code).hasClass('language-prerender')) {
          $(pre).addClass('prerender');
        } else {
          $(pre).addClass('render');
        }
        var source = /** @type {string} */($(code).text());
        //code[0].style.border = 'solid 2px red';
        $(pre).find('iframe').remove();
        // Add a fresh iframe.
        var iframe = /** @type {!HTMLIFrameElement} */(document.createElement("iframe"));
        // Find out the links to processing.js library from the current
        // page.
        /** @type {string} */
        var processing_js;
        try {
          processing_js = /** @type {string} */ ($("script[src*='processing.']")[0].src);
        } catch(e) {
          processing_js = '/static/processing.min.js';
        }
        /** @type{string} */
        var style_css;
        try {
          style_css = $("link[href*='style']")[0].href.replace('style.css', 'inner.css');
        } catch(e) {
          style_css = '/static/inner.css';
        }
        // Create the iframe HTML.
        var iframeHtml = '<!DOCTYPE html>\n' +
          '<link rel="stylesheet" type="text/css" href="'+ style_css + '">'+
          '<script src="' + processing_js + '"></script>' + 
          '<script type="application/processing" data-processing-target="pjs">' + source + '</script>'+
          '<canvas id="pjs"></canvas>';
        pre.appendChild(iframe);
        if ($(code).hasClass('language-render')) {
          // Hide the code for code blocks marked with 'render'.
          $(code).hide();
        }
        var contentWindow = /** @type {!Window} */(iframe.contentWindow);
        contentWindow.document.open();
        contentWindow.document.write(iframeHtml);
        contentWindow.document.close();
        var m = source.match(/[\r\n \t]*size[ \t]*\([ \t]*([0-9]+)[ \t]*,[ \t]*([0-9]+)[ \t]*\)/);
        if (m) {
          iframe.style.height = '' + m[2] + 'px';
          iframe.style.width = '' + m[1] + 'px';
          $(pre).css('min-height', '' + (parseInt(m[2], 10) + 16) + 'px');
        } else {
          iframe.style.height = '100px';
          iframe.style.width = '100px';
          $(pre).css('min-height', '116px');
        }
        console.log("created a prerender iframe");
      });
    } else {
      var keyword = refkey.substr(4);
      ide.helpDiv.innerHTML =
          ('<div>No help on <code>' + keyword + '</code>.' +
     '<p>Put the cursor on a function name and press [Help] button</div>');
    }
    // Scroll to top.
    $('#help_section').scrollTop(0);
  }

  function showHelp() {
    var cursor = ide.codemirror.getCursor();
    var line = ide.codemirror.getLine(cursor.line);
    // Find the identifier under cursor.
    var match = /^([a-zA-Z0-9_]*)/.exec(line.substr(cursor.ch));
    match = /([a-zA-Z_][a-zA-Z0-9_]*)([^a-zA-Z_]*)$/.exec(
        line.substr(0, cursor.ch) + match[1]);
    if (!match) {
      // Retry with the complete line.
      match = /([a-zA-Z_][a-zA-Z0-9_]*)/.exec(line);
    }
    if (!match) {
      // Help invoked on empty line?
      window.console.log('no help');
      return;
    }
    var keyword = match[1];
    showHelpSection('ref-' + keyword);
  }


  // Saves the sketch automatically if there were any changes.
  function autosaveSketch() {
    /** @type {string} */
    var source = ide.codemirror.getValue();
    if (ide.saved != source) {
      saveSketch();
      ide.saved = source;
    }
  }

  function saveSketch() {
    var /** string */processingCode = ide.codemirror.getValue();
    var params = parseFragment();
    ide.textarea.value = processingCode;
    var data = $(ide.textarea).serializeArray();
    var id = params['sketch'];
    // Note the saved state.
    if (id) {
      //window.console.log("Saving /sketch/" + id);
      $.post('/sketch/' + id, data, function(data, status, xhr) {
        if (status == 'success') {
          //ide.helpDiv.innerHTML = '<div class="error">Saved OK</div>';
          window.console.log("Saved /sketch/" + id);
        } else {
          //ide.helpDiv.innerHTML = '<div class="error">Saved error: ' + status + '</div>';
          window.console.error(status);
        }
      });
    } else {
      //window.console.log("Saving new sketch");
      $.post('/sketch', data, function(data, status, xhr) {
        var id = data;
        if (status == 'success') {
          //ide.helpDiv.innerHTML = '<div class="error">Saved OK</div>';
          window.console.log("Saved /sketch/" + id);
          updateFragment('sketch', id);
        } else {
          //ide.helpDiv.innerHTML = '<div class="error">Saved error: ' + status + '</div>';
          window.console.error(status);
        }
      });
    }
  }


  /**
   * @param {!Event} ev
   * @return {boolean}
   */
  function showDoc(ev) {
    var elt = /** @type {!Element} */ (ev.target);
    var hash = elt.getAttribute('href');
    showHelpSection(hash);
    updateFragment('help', hash.substr(5));
    return false;
  }

  /**
   * @param {!Event} ev
   */
  function helpTop(ev) {
    ev.preventDefault();
    showHelpSection('ref-help');
  }

  /**
   * @param {!Event} ev
   */
  function helpIndex(ev) {
    ev.preventDefault();
    showHelpSection('ref-index');
  }

  function computeReferenceDict() {
    $('div.section').each(function(index, elt) {
      ide.referenceDict[elt.id] = elt;
    });
    $('a').each(function(index, elt) {
      var href = elt.getAttribute('href');
      if (href.startsWith('#ref-')) {
        $(elt).click(showDoc);
      }
    });
    // Add the [Load] buttons to code snippets.
    $('pre').each(function(index, elt) {
      var code = $(elt).find('code.language-example, code.language-prerender, code.language-hidden');
      if (code.length == 1) {
        var source = /** @type {string} */(code.text());
        var button = document.createElement("button");
        $(button).text('読み込む');
        $(button).click(function(ev) {
          ev.preventDefault();
          ide.codemirror.setValue(source);
          // Avoid autosaving unless there were changes.
          ide.saved = ide.codemirror.getValue();
          // Forget the previous sketch id.
          updateFragment('sketch', null);
        });
        $(elt).prepend($('<br>'));
        $(elt).prepend(button);
      }
      if ($(code).hasClass('language-hidden')) {
        // Add show button to the parent <pre>.
        $(code).hide();
        var $loadButton = $(elt).find('button');
        $loadButton.hide();
        var button = document.createElement('button');
        $(button).text('表示');
        $(button).click(function(ev) {
          $(button).hide();
          $(code).show();
          $loadButton.show();
        });
        $(elt).prepend(button);
      }
    });
  }

  function setup() {
    computeReferenceDict();
    document.getElementById('start_sketch_button')
      .addEventListener('click',  startSketch);
    document.getElementById('stop_sketch_button')
      .addEventListener('click', stopSketch);
    document.getElementById('show_help_button')
      .addEventListener('click', showHelp);
    document.getElementById('help_top_button')
      .addEventListener('click', helpTop);
    document.getElementById('help_index_button')
      .addEventListener('click', helpIndex);
    ide.textarea = /** @type {!HTMLTextAreaElement} */ (
        document.getElementById('editor_textarea'));
    var validator = function(text, options) {
      return processingjs.lint.validator(text, options, toplevelGrammar.parse);
    };
    var keywords = [
"ALT","ARROW","BACKSPACE","CENTER","CODED","CONTROL","CROSS","DELETE","DOWN","ENTER","ESC","HALF_PI","HAND","HashMap","LEFT","MOVE","PFont","PI","PImage","PROJECT","QUARTER_PI","RETURN","RIGHT","ROUND","SHIFT","SQUARE","String","TAB","TEXT","TWO_PI","UP","WAIT","abs","add","alert","alpha","append","arc","background","binary","boolean","break","brightness","byte","case","ceil","char","class","color","concat","continue","copy","cos","createImage","cursor","default","dist","do","double","draw","drawGround","ellipse","else","entrySet","exit","false","fill","final","float","floor","for","frameRate","get","getKey","getValue","green","hasNext","hit","hue","if","image","imageMode","int","iterator","key","keyCode","keyCodes","keyPressed","keyReleased","keyTyped","line","loadFont","loadImage","loop","millis","mouseButton","mouseClicked","mouseDragged","mouseMoved","mouseOut","mouseOver","mousePressed","mouseReleased","mouseX","mouseY","new","next","noLoop","pixels","pmouseX","pmouseY","printNumbers","put","random","rect","red","remove","return","round","saturation","setup","short","shuffle","sin","size","smooth","speak","sqrt","str","stroke","strokeCap","strokeWeight","switch","tan","text","textFont","textSize","this","toString","triangle","true","update","void","while"];
    var codemirror_options = {
      'value': ide.textarea.value,
      'mode': {
        'name': 'clike',
        'keywords': keywords.reduce(function(x, k) {
          x[k] = true;
          return x;
        }, new Object()),
      },
      'lint': validator,
      'extraKeys': {
        'F1': showHelp,
      },
      'theme': 'eclipse',
      'lineNumbers': true,
    };
    // Parse and act on the fragment address.
    var params = new Object();
    params['help'] = 'help'; // default page to show.
    if (window.location.hash) {
      params = parseFragment();
      //window.console.log(params);
      if (params['sketch'] || params['load']) {
        var id = params['sketch'];
        if (!id) {
          id = params['load'];
          // Drop the sketch id from the fragment.
          updateFragment('load', null);
        }
        $.ajax('/sketch/' + id, {
          success:
          /**
           * @param {string} data
           */
          function(data) {
            window.console.log("Loaded /sketch/" + id);
            // Reset the saved state.
            ide.textarea.value = data;
            ide.codemirror.setValue(data);
            ide.saved = ide.codemirror.getValue();
          },
          error:
          /**
           * @param {!Object} jqXHR
           * @param {?Object} status
           * @param {?Object} err
           */
          function(jqXHR, status, err) {
            window.console.error(status, err);
          },
        });
      }
      // TODO(salikh): Parse 'help' key from the fragment
      // and show the appropriate help page.
    }
    // Instantiate CodeMirror.
    ide.codemirror = CodeMirror.fromTextArea(ide.textarea, codemirror_options);
    ide.codemirror.setOption("extraKeys", { Tab: showHelp });
    ide.canvasDiv = document.getElementById('canvas_div');
    ide.helpDiv = document.getElementById('help_div');
    ide.processingCanvas = /** @type{HTMLCanvasElement!} */(document.getElementById('processing_canvas'));
    if (params['help']) {
      showHelpSection('ref-' + params['help']);
    }
  }

  window.addEventListener('load', function() {
    // window.console.log("page loaded");
    setup();
  });

  // Autosave every 3 seconds.
  window.setInterval(autosaveSketch, 3000);

  return ide;
}))();
