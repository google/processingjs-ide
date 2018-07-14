require("google-closure-library");
var assert = require('assert');
var fs = require('fs');
var chai = require('chai');
var expect = chai.expect;

var toplevel = require('grammars/toplevel/toplevel.pegjs.js');
var toplevelGrammar = toplevel.toplevelGrammar;

require('lint-module/lint.js');
goog.require('processingjs.lint');

describe('validator', function() {
  it('must exist and be a function', function() {
    expect(processingjs.lint).to.have.property('validator');
    expect(processingjs.lint.validator).to.be.a('function');
  });

  it('must produce some output', function() {
    console.log(processingjs.lint.validator('int x = 1;', null, toplevelGrammar.parse));
  });

  describe('missing semicolon', function() {
    it('in var decl', function() {
      console.log(processingjs.lint.validator('int x = 1\n', null, toplevelGrammar.parse));
    });

    it('in var decl at eof', function() {
      console.log(processingjs.lint.validator('int x = 1', null, toplevelGrammar.parse));
    });
  });
});
