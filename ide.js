/*
Copyright 2018 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

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
    var /** !Processing.Sketch */sketch = Processing.compile(processingCode);
    // window.console.log(sketch.sourceCode);
    // TODO(salikh): Do not create a new processing instance?
    if (ide.processing == null) {
      ide.processing = new Processing(ide.processingCanvas, sketch);
    } else {
      sketch.attach(ide.processing);
      if (typeof ide.processing.setup == "function") {
        ide.processing.setup();
      }
    }
    switchSketchState(true);
    ide.canvasDiv.style.overflow = 'visible';
    ide.processingCanvas.style.width = '' + ide.processingCanvas.width + 'px';
    ide.processingCanvas.style.height = '' + ide.processingCanvas.height + 'px';
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
      if (ide.helpDiv.children.length > 0) {
        ide.helpDiv.replaceChild(doc, ide.helpDiv.children[0]);
      } else {
        ide.helpDiv.appendChild(doc);
      }
      updateFragment('help', refkey.substr(4));
    } else {
      var keyword = refkey.substr(4);
      ide.helpDiv.innerHTML =
          ('<div>No help on <code>' + keyword + '</code>.' +
     '<p>Put the cursor on a function name and press [Help] button</div>');
    }
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

  /**
   * @param {!Event} ev
   */
  function saveSketch(ev) {
    ev.preventDefault();
    var /** string */processingCode = ide.codemirror.getValue();
    var params = parseFragment();
    ide.textarea.value = processingCode;
    window.console.log(ide.textarea);
    var data = $(ide.textarea).serializeArray();
    var id = params['sketch'];
    if (id) {
      window.console.log("Saving /sketch/" + id, data);
      $.post('/sketch/' + id, data, function(data, status, xhr) {
        if (status == 'success') {
          ide.helpDiv.innerHTML = '<div class="error">Saved OK</div>';
          window.console.log("Saved /sketch/" + id);
        } else {
          ide.helpDiv.innerHTML = '<div class="error">Saved error: ' + status + '</div>';
          window.console.log(status);
        }
      });
    } else {
      window.console.log("Saving new sketch", data);
      $.post('/sketch', data, function(data, status, xhr) {
        var id = data;
        if (status == 'success') {
          ide.helpDiv.innerHTML = '<div class="error">Saved OK</div>';
          window.console.log("Saved /sketch/" + id);
          updateFragment('sketch', id);
        } else {
          ide.helpDiv.innerHTML = '<div class="error">Saved error: ' + status + '</div>';
          window.console.log(status);
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
  }

  function keypress(ev) {
    //window.console.log(ev);
  }

  function setup() {
    computeReferenceDict();
    document.getElementById('start_sketch_button')
      .addEventListener('click',  startSketch);
    document.getElementById('stop_sketch_button')
      .addEventListener('click', stopSketch);
    document.getElementById('show_help_button')
      .addEventListener('click', showHelp);
    document.getElementById('save_sketch_button')
      .addEventListener('click', saveSketch);
    ide.textarea = /** @type {!HTMLTextAreaElement} */ (
        document.getElementById('editor_textarea'));
    var codemirror_options = {
      value: ide.textarea.value,
      mode: 'clike',
      lint: CodeMirror.lint.processingjs,
    };
    // Parse and act on the fragment address.
    if (window.location.hash) {
      var params = parseFragment();
      window.console.log(params);
      if (params['sketch']) {
        var id = params['sketch'];
        $.ajax('/sketch/' + id, {
          success:
          /**
           * @param {string} data
           */
          function(data) {
            window.console.log("Loaded /sketch/" + id);
            ide.textarea.value = data;
            ide.codemirror.setValue(data);
          },
          error:
          /**
           * @param {!Object} jqXHR
           * @param {?Object} status
           * @param {?Object} err
           */
          function(jqXHR, status, err) {
            window.console.log(status, err);
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
    $(ide.textarea).keypress(keypress);
  }

  window.addEventListener('load', function() {
    // window.console.log("page loaded");
    setup();
  });

  return ide;
}))();
