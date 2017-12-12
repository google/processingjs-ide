/*
Copyright 2017 Google LLC

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

// Expose just one global variable 'ide'.
var ide = (function() {

var ide = {
  processing: null,
  codemirror: null,
  helpDiv: null,
  canvasDiv: null,
  processingCanvas: null,
  referenceDict: {},
};

function startSketch() {
  var processingCode = ide.codemirror.getValue();
  //window.console.log(processingCode);
  var sketch = Processing.compile(processingCode);
  // window.console.log(sketch.sourceCode);
  // TODO(salikh): Do not create a new processing instance?
  // if (!ide.processing) {
  //   var processingInit = eval(sketch.sourceCode);
  //   processingInit(ide.processing);
  // } else {
  ide.processing = new Processing(ide.processingCanvas, sketch);
  // }
  switchSketchState(true);
  ide.canvasDiv.style.display = "block";
}

function stopSketch() {
  switchSketchState(false);
  ide.canvasDiv.style.display = "none";
}

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

function showHelpSection(refkey) {
  if (refkey.startsWith('#')) refkey = refkey.substr(1);
  var doc = ide.referenceDict[refkey];
  if (doc) {
    var rep;
    if (ide.helpDiv.children.length > 0) {
      ide.helpDiv.replaceChild(doc, ide.helpDiv.children[0]);
    } else {
      ide.helpDiv.appendChild(doc);
    }
  } else {
    var keyword = refkey.substr(4);
    ide.helpDiv.innerHTML = '<div>No help on <code>' + keyword + '</code>.</div>'
  }
}

function showHelp() {
  cursor = ide.codemirror.getCursor();
  line = ide.codemirror.getLine(cursor.line);
  // Find the identifier under cursor.
  var match = /^([a-zA-Z0-9_]*)/.exec(line.substr(cursor.ch));
  match = /([a-zA-Z_][a-zA-Z0-9_]*)([^a-zA-Z_]*)$/.exec(line.substr(0, cursor.ch) + match[1]);
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

function showDoc(ev) {
  var elt = ev.target;
  var hash = elt.getAttribute('href');
  showHelpSection(hash);
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

function setup() {
  computeReferenceDict();
  document.getElementById("start_sketch").onclick = startSketch;
  document.getElementById("stop_sketch").onclick = stopSketch;
  document.getElementById("show_help").onclick = showHelp;
  var textarea = document.getElementById("editor_area");
  var codemirror_options = {
    value: textarea.value,
    mode: "clike",
    lint: CodeMirror.lint.processingjs,
  };
  // Instantiate CodeMirror.
  ide.codemirror = CodeMirror.fromTextArea(textarea, codemirror_options);
  ide.canvasDiv = document.getElementById("canvas");
  ide.helpDiv = document.getElementById("help");
  ide.suggestionsDiv = document.getElementById("suggestions");
  ide.processingCanvas = document.getElementById("processing_canvas");
}

window.addEventListener("load", function() {
  //window.console.log("page loaded");
  setup();
});

return ide;
})();
