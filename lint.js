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

goog.provide('processingjs.lint');

/**
 * @constructor
 * @param {number} line -- 0-based line number.
 * @param {number} ch -- 0-based byte (?) count in the line.
 * @struct
 */
var Pos = function(line, ch) {
  this['line'] = line;
  this['ch'] = ch;
};

/**
 * Converts an array of parse results (AST) into array of linter messages.
 * May throw errors.
 * @param {!Array<!Object>} result
 * @return {!Array<!Object>}
 */
processingjs.lint.lint = function(result) {
  var errors = [];
  // The map of names that has been seen (on the top parse level of the
  // provided parse result).
  var seen = {};
  for (var i = 0; i < result.length; i++) {
    var block = result[i];
    if (!block || !block.hasOwnProperty('kind')) continue;
    // Recursively collect error messages for children.
    if (block.hasOwnProperty('children')) {
      var children = block['children'];
      var errs = processingjs.lint.lint(children);
      errors = errors.concat(errs);
    }
    if (block['kind'] == 'error') {
      var start = block['location']['start'];
      var end = block['location']['end'];
      var err = {
	"message": "Unparseable",
	"severity": "error",
	"from": new Pos(start['line']-1, start['column']-1),
	"to": new Pos(end['line']-1, end['column']-1),
      };
      errors.push(err);
    } else if (block['name']) {
      // Check the named top level blocks for non-duplication.
      if (seen[block['name']]) {
	if (block.location) {
	  var start = block['location']['start'];
	  var end = block['location']['end'];
	  var err = {
	    "message": "Duplicated definition of " + block['name'],
	    "severity": "error",
	    "from": new Pos(start['line']-1, start['column']-1),
	    "to": new Pos(end['line']-1, end['column']-1),
	  };
	  errors.push(err);
	}
      }
      seen[block['name']] = true;
    }
    // Detect missing semicolons.
    if (block.hasOwnProperty('semi') && !block['semi']) {
      var start = block['location']['start'];
      var end = block['location']['end'];
      var err = {
	"message": "Missing semicolon ';'",
	"severity": "error",
	"from": new Pos(start['line']-1, start['column']-1),
	"to": new Pos(end['line']-1, end['column']-1),
      };
      errors.push(err);
    }
  }
  return errors;
};

/**
 * The validator function that takes a source text, parse function
 * and produces an array of messages usable for Codemirror wave underlines
 * (lint plugin).
 *
 * @param {string} text
 * @param {?Object} options
 * @param {!function(string):!Array<!Object>} parse
 * @return {!Object}
 */
processingjs.lint.validator = function(text, options, parse) {
  try {
    var result = parse(text);
    return processingjs.lint.lint(result);
  } catch(e) {
    console.error(e);
    return [];
  }
};
