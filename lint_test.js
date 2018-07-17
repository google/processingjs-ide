require("google-closure-library");
var assert = require('assert');
var fs = require('fs');
var chai = require('chai');
chai.use(require('chai-match'));
var expect = chai.expect;

var toplevel = require('grammars/toplevel/toplevel.pegjs.js');
var toplevelGrammar = toplevel.toplevelGrammar;

require('lint-module/lint.js');
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
  });
});
