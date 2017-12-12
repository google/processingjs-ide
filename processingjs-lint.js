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

(function(func) {
	func(CodeMirror);
})(function(CodeMirror) {
  function validator(text, options) {
    //window.console.log("processing-lint", options);
    try {
      var result = toplevelGrammar.parse(text);
    } catch(e) {
      ide.suggestionsDiv.innerHTML = '<div class="error">Lint failed: ' + e + '</div>';
      return;
    }
    var errors = [];
    var seen = {};
    for (var i = 0; i < result.length; i++) {
      var block = result[i];
      if (block.kind == 'error') {
	var start = block.location.start;
	var end = block.location.end;
	errors.push({
	  message: "Unparseable",
	  severity: "error",
	  from: CodeMirror.Pos(start.line-1, start.column-1),
	  to: CodeMirror.Pos(end.line-1, end.column-1),
	})
      } else {
	if (seen[block.name]) {
	  window.console.log("seen", block)
	  var start = block.location.start;
	  var end = block.location.end;
	  errors.push({
	    message: "Duplicated definition of " + block.name,
	    severity: "error",
	    from: CodeMirror.Pos(start.line-1, start.column-1),
	    to: CodeMirror.Pos(end.line-1, end.column-1),
	  })
	}
	seen[block.name] = true;
	if (block.kind == 'var' && !block.semi) {
	  var start = block.location.start;
	  var end = block.location.end;
	  errors.push({
	    message: "Missing semicolon ';'",
	    severity: "error",
	    from: CodeMirror.Pos(start.line-1, start.column-1),
	    to: CodeMirror.Pos(end.line-1, end.column-1),
	  });
	}
      }
    }
    return errors;
  }

  CodeMirror.registerHelper("lint", "processingjs", validator);
});
