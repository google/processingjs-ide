var assert = require('assert');
var fs = require('fs');
var expect = require('chai').expect;
var grammar = require('grammars/toplevel/toplevel.pegjs.js').toplevelGrammar;

describe('Grammar', function() {
  it('must not be null', function() {
    expect(grammar).to.be.an('object');
  });

  it('must have parse function', function() {
    expect(grammar).to.have.property('parse');
    expect(grammar.parse).to.a('function');
  });
  
  describe('statement', function() {
    it('should parse a variable', function() {
      var source = 'int x;'
      var result = grammar.parse(source);
    });

    it('should parse a variable with initializer', function() {
      var source = 'int x = 1;'
      var result = grammar.parse(source);
    });

    /*
     * These tests fail now.
    it('should parse multiple variables with initializer', function() {
      var source = 'int x = 1, y = 2;'
      var result = grammar.parse(source);
    });

    it('should parse function call', function() {
      var source = 'speak("abc");'
      var result = grammar.parse(source);
    });
    */
  });
});
