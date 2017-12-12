(function(func) {
	func(CodeMirror);
})(function(CodeMirror) {
  var bogus = [ "Dangerous comment" ];

  var warnings = [ [ "Expected '{'",
                     "Statement body should be inside '{ }' braces." ] ];

  var errors = [ "Missing semicolon", "Extra comma", "Missing property name",
                 "Unmatched ", " and instead saw", " is not defined",
                 "Unclosed string", "Stopping, unable to continue" ];

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
