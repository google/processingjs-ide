var assert = require('assert');
var chai = require('chai');
chai.use(require('chai-match'));
var expect = chai.expect;
var fs = require('fs');
require("google-closure-library");

// TODO(salikh): Figure out the way to import dependent modules without this
// hack.
module.paths.push(process.cwd());
var toplevel = require('grammars/toplevel.pegjs.js');
var toplevelGrammar = toplevel.toplevelGrammar;

require('lint.js');
goog.require('processingjs.lint');

describe('validator', function() {
  it('must exist and be a function', function() {
    expect(processingjs.lint).to.have.property('validator');
    expect(processingjs.lint.validator).to.be.a('function');
    expect(processingjs.lint).to.have.property('lint');
    expect(processingjs.lint.lint).to.be.a('function');
  });

  it('must produce some output', function() {
    var result = processingjs.lint.validator('int x = 1;', null, toplevelGrammar.parse);
    expect(result).to.have.length(0);
  });
});

describe('lint', function() {
  it('must exist and be a function', function() {
    expect(processingjs.lint).to.have.property('lint');
    expect(processingjs.lint.lint).to.be.a('function');
  });

  it('must produce some output', function() {
    var parse_result = toplevelGrammar.parse('int x = 1;');
    var result = processingjs.lint.lint(parse_result);
    expect(result).to.have.length(0);
  });

  describe('missing semicolon', function() {
    it('in var decl', function() {
      var parse_result = toplevelGrammar.parse('int x = 1\n');
      var result = processingjs.lint.lint(parse_result);
      expect(result).to.have.length(1);
      expect(result[0]).to.have.property('severity');
      expect(result[0]['severity']).to.equal('error');
      expect(result[0]).to.have.property('message');
      expect(result[0]['message']).to.match(/missing semicolon/i);
      expect(result[0]).to.have.property('from');
      expect(result[0]['from']).to.have.property('line');
      // Line count is 0-based.
      expect(result[0]['from']['line']).to.equal(0);
    });

    it('in var decl at eof', function() {
      var parse_result = toplevelGrammar.parse('int x = 1');
      var result = processingjs.lint.lint(parse_result);
      expect(result).to.have.length(1);
      expect(result[0]).to.have.property('severity');
      expect(result[0]['severity']).to.equal('error');
      expect(result[0]).to.have.property('message');
      expect(result[0]['message']).to.match(/missing semicolon/i);
      expect(result[0]).to.have.property('from');
      expect(result[0]['from']).to.have.property('line');
      // Line count is 0-based.
      expect(result[0]['from']['line']).to.equal(0);
    });

    it('in var decl inside function', function() {
      var parse_result = toplevelGrammar.parse('void f() {\n  int x = 1\n}');
      var result = processingjs.lint.lint(parse_result);
      expect(result).to.have.length(1);
      expect(result[0]).to.have.property('severity');
      expect(result[0]['severity']).to.equal('error');
      expect(result[0]).to.have.property('message');
      expect(result[0]['message']).to.match(/missing semicolon/i);
      expect(result[0]).to.have.property('from');
      expect(result[0]['from']).to.have.property('line');
      // Line count is 0-based.
      expect(result[0]['from']['line']).to.equal(1);
    });

    it('in var decl inside class method', function() {
      var parse_result = toplevelGrammar.parse(
	'class X {\nvoid f() {\n  int x = 1\n}\n}');
      var result = processingjs.lint.lint(parse_result);
      expect(result).to.have.length(1);
      expect(result[0]).to.have.property('severity');
      expect(result[0]['severity']).to.equal('error');
      expect(result[0]).to.have.property('message');
      expect(result[0]['message']).to.match(/missing semicolon/i);
      expect(result[0]).to.have.property('from');
      expect(result[0]['from']).to.have.property('line');
      // Line count is 0-based.
      expect(result[0]['from']['line']).to.equal(2);
    });

    it('in method call', function() {
      var parse_result = toplevelGrammar.parse('line(1,1,10,10)\n');
      var result = processingjs.lint.lint(parse_result);
      expect(result).to.have.length(1);
      expect(result[0]).to.have.property('severity');
      expect(result[0]['severity']).to.equal('error');
      expect(result[0]).to.have.property('message');
      expect(result[0]['message']).to.match(/missing semicolon/i);
      expect(result[0]).to.have.property('from');
      expect(result[0]['from']).to.have.property('line');
      // Line count is 0-based.
      expect(result[0]['from']['line']).to.equal(0);
    });
  });

  function expect_a_message(result, severity, regex, lineno) {
    expect(result).to.have.property('length');
    expect(result).to.have.length(1);
    expect(result[0]).to.have.property('severity');
    expect(result[0]['severity']).to.equal(severity);
    expect(result[0]).to.have.property('message');
    expect(result[0]['message']).to.match(regex);
    expect(result[0]).to.have.property('from');
    expect(result[0]['from']).to.have.property('line');
    expect(result[0]['from']['line']).to.equal(lineno);
  }

  describe('full-width characters', function() {
    describe('semicolon', function() {
      it('in var decl', function() {
	var parse_result = toplevelGrammar.parse('int x = 1；\n');
	var result = processingjs.lint.lint(parse_result);
	// Line number is 0-based.
	expect_a_message(result, 'error', /full-width semicolon/i, 0);
      });

      it('in var decl', function() {
	var parse_result = toplevelGrammar.parse('\n\nint x = 1；');
	var result = processingjs.lint.lint(parse_result);
	// Line number is 0-based.
	expect_a_message(result, 'error', /full-width semicolon/i, 2);
      });

      it('in fun call', function() {
	var parse_result = toplevelGrammar.parse('f()；\n');
	var result = processingjs.lint.lint(parse_result);
	// Line number is 0-based.
	expect_a_message(result, 'error', /full-width semicolon/i, 0);
      });

      it('in for loop1', function() {
	var parse_result = toplevelGrammar.parse('for(i = 0； i < 3; i++) {}\n');
	var result = processingjs.lint.lint(parse_result);
	// Line number is 0-based.
	expect_a_message(result, 'error', /full-width semicolon/i, 0);
      });

      it('in for loop2', function() {
	var parse_result = toplevelGrammar.parse('for(i = 0; i < 3； i++) {}\n');
	var result = processingjs.lint.lint(parse_result);
	// Line number is 0-based.
	expect_a_message(result, 'error', /full-width semicolon/i, 0);
      });

    });

    describe('brace', function() {
      it('in fun decl', function() {
	var parse_result = toplevelGrammar.parse('void f() ｛\n int x = 0;\n}');
	var result = processingjs.lint.lint(parse_result);
	// Line number is 0-based.
	expect_a_message(result, 'error', /full-width brace/i, 0);
      });

      it('in fun decl2', function() {
	var parse_result = toplevelGrammar.parse('void f() {\n int x = 0;\n｝');
	var result = processingjs.lint.lint(parse_result);
	// Line number is 0-based.
	expect_a_message(result, 'error', /full-width brace/i, 2);
      });
    });

    describe('double quote', function() {
      it('in literal start', function() {
	var parse_result = toplevelGrammar.parse('”abc";');
	var result = processingjs.lint.lint(parse_result);
	// Line number is 0-based.
	expect_a_message(result, 'error', /full-width quote/i, 0);
      });
      it('in literal end', function() {
	var parse_result = toplevelGrammar.parse('"abc”;');
	var result = processingjs.lint.lint(parse_result);
	// Line number is 0-based.
	expect_a_message(result, 'error', /full-width quote/i, 0);
      });
    });

    describe('single quote', function() {
      it('in literal start', function() {
	const parse_result = toplevelGrammar.parse("’a';");
	const result = processingjs.lint.lint(parse_result);
	// Line number is 0-based.
	expect_a_message(result, 'error', /full-width quote/i, 0);
      });
      it('in literal end', function() {
	const parse_result = toplevelGrammar.parse("'a’;");
	const result = processingjs.lint.lint(parse_result);
	// Line number is 0-based.
	expect_a_message(result, 'error', /full-width quote/i, 0);
      });
      it('in function call', function() {
	const parse_result = toplevelGrammar.parse("f(’a');");
	const result = processingjs.lint.lint(parse_result);
	// Line number is 0-based.
	expect_a_message(result, 'error', /full-width quote/i, 0);
      });
    });
  });
});
