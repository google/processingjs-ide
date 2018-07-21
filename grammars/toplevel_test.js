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

var assert = require('assert');
var fs = require('fs');
var chai = require('chai');
var expect = chai.expect;
var grammar = require('grammars/toplevel/toplevel.pegjs.js').toplevelGrammar;

function has_error(result) {
  for (var i = 0; i < result.length; i++) {
    if (result[i].hasOwnProperty("kind") &&
        result[i].kind == "error") {
      return true;
    }
  }
  return false;
}

chai.Assertion.addMethod('no_error', function () {
  var result = this._obj;
  var num_errors = 0;
  if (result.length === undefined) {
    num_errors = -1;
  } else {
    for (var i = 0; i < result.length; i++) {
      if (result[i].hasOwnProperty("kind") &&
	  result[i].kind == "error") {
	num_errors++;
      }
    }
  }
  this.assert(num_errors == 0,
    // Error message.
    "expected #{this} to have no errors but got #{act} errors (-1 means result was not array-like)",
    // Negated condition error message.
    "expected #{this} to have errors",
    // Expected value.
    0,
    // Actual value.
    num_errors);
})

describe('Grammar', function() {
  it('must not be null', function() {
    expect(grammar).to.be.an('object');
  });

  it('must have parse function', function() {
    expect(grammar).to.have.property('parse');
    expect(grammar.parse).to.a('function');
  });
  
  describe('Source', function() {
    it('should parse a variable', function() {
      var source = 'int x;'
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });

    it('should parse a variable with initializer', function() {
      var source = 'int x = 1;'
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });

    it('should parse multiple variables with initializer', function() {
      var source = 'int x = 1, y = 2;'
      var result = grammar.parse(source);
    });

    it('accepts an empty class', function() {
      var source = 'class X {}'
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });

    it('accepts an empty class with a newline', function() {
      var source = 'class X {}\n'
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });

    it('accepts an parametrized class', function() {
      var source = 'class X<T extends java.lang.String> {}\n'
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });

    it('parses array initializer with many newlines', function() {
      var source = 'String[] x = {\n\n"a", \n "b",\n "c"};'
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });

    /* TODO(salikh): fails.
    it('parses array initializer without separator', function() {
      var source = 'int[] x = {0, 1}';
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });
    */

    it('parses array initializer without newlines', function() {
      var source = 'int[] x = {0, 1};';
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });

    it('parses array initializer with newline before end brace', function() {
      var source = 'int[] x = {0, 1\n};'
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });

    it('parses array initializer with newlines and tabs', function() {
      var source = 'String[] x = {\t\t\n\n"a", \n "b",\n "c"};\n'
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });

    it('accepts an function call', function() {
      var source = 'speak("Hello");'
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });

    it('accepts an function call with missing semicolon', function() {
      var source = 'speak("Hello")\n'
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });

    it('accepts an function call with Japanese literal', function() {
      var source = 'speak("こんにちは");'
      var result = grammar.parse(source);
    });

    it('accepts a new array expression', function() {
      var source = 'boolean[] b = new boolean[5];'
      var result = grammar.parse(source);
      expect(result).to.have.no_error();
    });
  });

  describe('ClassBody', function() {
    it('parses empty braces', function() {
      var source = '{}'
      var result = grammar.parse(source, {startRule: "ClassBody"});
    });
  });

  describe('ClassDecl', function() {
    var startRule = 'ClassDecl';
    it('parses empty class', function() {
      var source = 'class X {}'
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses class with a field', function() {
      var source = 'class X { int x; }'
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses class with a method declaration', function() {
      var source = 'class X { int f(); }'
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses class with a method definition', function() {
      var source = 'class X { int f() { return 0; } }'
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses class with a nested class', function() {
      var source = 'class X { class Y {} }'
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses class with a constructor', function() {
      var source = 'class X { X() {} }'
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses class with a method', function() {
      var source = 'class X { boolean hit(Wall w) {return y - r;} }'
      var result = grammar.parse(source, {"startRule": startRule});
    });
  });

  describe('Block', function() {
    var startRule = 'Block';
    it('parses a block with return', function() {
      var source = '{ return y- r; }';
      var result = grammar.parse(source, {"startRule": startRule});
    });
  });

  describe('ClassBodyDecl', function() {
    var startRule = 'ClassBodyDecl';
    it('parses a method definition', function() {
      var source = 'int f() { return 0; }';
      var result = grammar.parse(source, {"startRule": startRule});
    });
  });

  describe('MethodDecl', function() {
    var startRule = 'MethodDecl';
    it('parses a method declaration', function() {
      var source = 'int f();';
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses a method definition', function() {
      var source = 'int f() { return 0; }';
      var result = grammar.parse(source, {"startRule": startRule});
    });
  });

  describe('FormalParameters', function() {
    var startRule = 'FormalParameters';
    it('parses an empty list', function() {
      var source = '()';
      var result = grammar.parse(source, {"startRule": startRule});
    });
  });

  describe('Decl', function() {
    var startRule = 'Decl';
    it('parses empty class', function() {
      var source = 'class X {}';
      var result = grammar.parse(source, {"startRule": startRule});
    });

    it('parses array initializer with newlines', function() {
      var source = 'String[] x = {\n"a", \n "b",\n "c"};';
      var result = grammar.parse(source, {"startRule": startRule});
    });

    it('parses a void function', function() {
      var source = 'void f() {}';
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses an int function', function() {
      var source = 'int f() { return 0; }';
      var result = grammar.parse(source, {"startRule": startRule});
    });

    it('parses an generic type var decl', function() {
      var source = 'ArrayList<Wall> walls;';
      var result = grammar.parse(source, {"startRule": startRule});
    });
  });

  describe('VarDecl', function() {
    it('parses a var declaration', function() {
      var source = 'String x;'
      var result = grammar.parse(source, {startRule: "VarDecl"});
    });
    it('parses array declaration', function() {
      var source = 'String[] x;'
      var result = grammar.parse(source, {startRule: "VarDecl"});
    });
    it('parses array declaration with brackets on var', function() {
      var source = 'String x[];'
      var result = grammar.parse(source, {startRule: "VarDecl"});
    });

    it('parses empty array initializer', function() {
      var source = 'String[] x = {};'
      var result = grammar.parse(source, {startRule: "VarDecl"});
    });

    it('parses array initializer', function() {
      var source = 'String x[] = {"abc"};'
      var result = grammar.parse(source, {startRule: "VarDecl"});
    });

    it('parses array initializer', function() {
      var source = 'String[] x = {"a", "b", "c"};'
      var result = grammar.parse(source, {startRule: "VarDecl"});
    });

    it('parses array initializer with newlines', function() {
      var source = 'String[] x = {\n"a", \n "b",\n "c"};'
      var result = grammar.parse(source, {startRule: "VarDecl"});
    });

    it('does not parses mismatched brace array initializer', function() {
      var source = 'String x[] = {"a", "b", "c"'
      expect(function() {
	var result = grammar.parse(source, {startRule: "VarDecl"});
      }).to.throw(/Expected.*"}"/);
    });

    it('parses multival declaration', function() {
      var source = 'String x, y;'
      var result = grammar.parse(source, {startRule: "VarDecl"});
    });

    it('parses multival declaration with init values', function() {
      var source = 'String x = "a", y = "b";'
      var result = grammar.parse(source, {startRule: "VarDecl"});
    });

    it('parses array declaration', function() {
      var source = 'boolean[] shown = new boolean[9];'
      var result = grammar.parse(source, {startRule: "VarDecl"});
    });

    it('parses variable declaration with missing semicolon', function() {
      var source = 'int x = 1\n'
      var result = grammar.parse(source, {startRule: "VarDecl"});
    });

    it('parses variable declaration with missing semicolon and NL', function() {
      var source = 'int x = 1'
      var result = grammar.parse(source, {startRule: "VarDecl"});
    });
  });

  describe('Statement', function() {
    it('parses function call', function() {
      var source = 'f();'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses array assignment', function() {
      var source = 'a[1] = 2;'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses semicolon', function() {
      var source = ';'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses empty braces', function() {
      var source = '{}'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses empty braces with comment', function() {
      var source = '{\n//abc\n }'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses for loop', function() {
      var source = 'for (i = 0; i < 10; i += 1) {}'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses for loop with var decl', function() {
      var source = 'for (int i = 0; i < 10; i += 1) {}'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses for loop with var increment', function() {
      var source = 'for (int i = 0; i < 10; i++) {}'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses for loop with body', function() {
      var source = 'for (int i = 0; i < 10; ++i) {\nspeak(str(i));\n}'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses for loop with body and comment', function() {
      var source = 'for (int i = 0; i < 10; i++) {\n // comment\nspeak(str(i));\n}\n'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses for loop with body and comment and fullwidth space', function() {
      var source = 'for (int i = 0; i < 10; i++) {\n　// comment\nspeak(str(i));\n}\n'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses assignment', function() {
      var source = 'x = 1;'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses var assignment', function() {
      var source = 'x = init_x;'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses assignment with a function call', function() {
      var source = 'x = f();'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses assignment with a new expression', function() {
      var source = 'x = new Object();'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses generic type instantiation', function() {
      var source = 'walls = new ArrayList<Wall>();'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses decrement', function() {
      var source = 'v--;'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses add-assignment', function() {
      var source = 'y += v;'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses return', function() {
      var source = 'return y - r < w.y;'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses if', function() {
      var source = 'if (w.x > x + r || w.x < x - r) return false;'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
    it('parses return with space', function() {
      var source = 'return y- r;'
      var result = grammar.parse(source, {startRule: "Statement"});
    });
  });

  describe('VariableDeclarators', function() {
    it('parses one var', function() {
      var source = 'x'
      var result = grammar.parse(source, {startRule: "VariableDeclarators"});
    });
    it('parses var list', function() {
      var source = 'x, y, z'
      var result = grammar.parse(source, {startRule: "VariableDeclarators"});
    });
    it('parses var with init', function() {
      var source = 'x = 1'
      var result = grammar.parse(source, {startRule: "VariableDeclarators"});
    });
    it('parses var list with inits', function() {
      var source = 'x = 1, y = 2, z = 3'
      var result = grammar.parse(source, {startRule: "VariableDeclarators"});
    });
  });

  describe('ArrayInitializer', function() {
    it('parses empty braces', function() {
      var source = '{}'
      var result = grammar.parse(source, {startRule: "ArrayInitializer"});
    });
    it('parses empty braces with newline', function() {
      var source = '{\n}'
      var result = grammar.parse(source, {startRule: "ArrayInitializer"});
    });
    it('parses values', function() {
      var source = '{1,2,3}'
      var result = grammar.parse(source, {startRule: "ArrayInitializer"});
    });
    it('parses values with final newline', function() {
      var source = '{1,2,3\n}'
      var result = grammar.parse(source, {startRule: "ArrayInitializer"});
    });
    it('parses values with middle newline', function() {
      var source = '{1,\n2,3}'
      var result = grammar.parse(source, {startRule: "ArrayInitializer"});
    });
  });

  describe('Expression', function() {
    it('parses function call', function() {
      var source = 'f()'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses variable', function() {
      var source = 'x'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses array access', function() {
      var source = 'a[0]'
      var result = grammar.parse(source, {startRule: "Expression"});
    });

    it('parses array access with an index expression', function() {
      var source = 'a[i+1]'
      var result = grammar.parse(source, {startRule: "Expression"});
    });

    it('parses empty array intializer', function() {
      var source = '{}'
      var result = grammar.parse(source, {startRule: "Expression"});
    });

    it('parses array intializer', function() {
      var source = '{"first", "second"}'
      var result = grammar.parse(source, {startRule: "Expression"});
    });

    it('parses new array expression', function() {
      var source = 'new String[3]'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses assignment', function() {
      var source = 'x = y'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses add-assignment', function() {
      var source = 'x += 1'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses addition', function() {
      var source = 'x + 1'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses subtraction', function() {
      var source = 'x - 1'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses multiplication', function() {
      var source = 'x * 1'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses division', function() {
      var source = 'x / 1'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses modulo', function() {
      var source = 'x % 1'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses less', function() {
      var source = 'x < 1'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses less or equal', function() {
      var source = 'x <= 1'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses greater', function() {
      var source = 'x > 1'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses greater or equal', function() {
      var source = 'x >= 1'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses equal', function() {
      var source = 'x == 1'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses not equal', function() {
      var source = 'x != 1'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses chained call', function() {
      var source = 'walls.get(i).draw()'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
    it('parses condition', function() {
      var source = 'y - r < w.y'
      var result = grammar.parse(source, {startRule: "Expression"});
    });
  });

  describe('op', function() {
    var startRule = 'op';
    it('parses not equal', function() {
      var source = '!='
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses equal', function() {
      var source = '=='
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses assign', function() {
      var source = '='
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses divide', function() {
      var source = '/'
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses divide-assign', function() {
      var source = '/='
      var result = grammar.parse(source, {"startRule": startRule});
    });
  });

  describe('Term', function() {
    var startRule = 'Term';
    it('parses variable', function() {
      var source = 'x'
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses int literal', function() {
      var source = '1'
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses float literal', function() {
      var source = '1.1'
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses empty array initializer', function() {
      var source = '{}'
      var result = grammar.parse(source, {"startRule": startRule});
    });

    it('parses array initializer', function() {
      var source = '{"abc"}'
      var result = grammar.parse(source, {"startRule": startRule});
    });

    it('parses array initializer', function() {
      var source = '{"a", "b", "c"}'
      var result = grammar.parse(source, {"startRule": startRule});
    });

    it('parses array initializer with newlines', function() {
      var source = '{\n"a",\n "b",\n "c"}'
      var result = grammar.parse(source, {"startRule": startRule});
    });

    it('parses array initializer with newlines', function() {
      var source = '{\n"a", \n "b",\n "c"}'
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('does not parses mismatched brace array initializer', function() {
      var source = '{"a", "b", "c"'
      expect(function() {
	var result = grammar.parse(source, {"startRule": startRule});
      }).to.throw(/Expected.*"}"/);
    });
    it('parses new expression', function() {
      var source = 'new Object()'
      var result = grammar.parse(source, {"startRule": startRule});
    });
  });

  describe('QualifiedName', function() {
    it('parses function call', function() {
      var source = 'f'
      var result = grammar.parse(source, {startRule: "QualifiedName"});
    });
  });

  describe('Creator', function() {
    var startRule = 'Creator';
    it('parses int array construction', function() {
      var source = 'int[3]'
      var result = grammar.parse(source, {"startRule": startRule});
    });
    it('parses Object construction', function() {
      var source = 'Object()'
      var result = grammar.parse(source, {"startRule": startRule});
    });
  });

  describe('CreatedName', function() {
    var startRule = 'CreatedName';
    it('parses Object', function() {
      var source = 'Object'
      var result = grammar.parse(source, {"startRule": startRule});
    });
  });

  describe('ClassCreatorRest', function() {
    var startRule = 'ClassCreatorRest';
    it('parses parens', function() {
      var source = '()'
      var result = grammar.parse(source, {"startRule": startRule});
    });
  });

  describe('StrictSource', function() {
    var dir = 'grammars/toplevel_test_modules/node_modules/grammars/examples/examples';
    it('parses all file examples', function() {
      var names = fs.readdirSync(dir);
      for (var i = 0; i < names.length; i++) {
	var name = names[i];
	if (name[0] == '_') continue;
	if (!name.endsWith('.pde')) continue;
	var source = fs.readFileSync(dir + '/' + name).toString();
	console.log(name, source);
	var result = grammar.parse(source, {startRule: "StrictSource"});
      }
    });
  });
});
