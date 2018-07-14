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
 * @param {string} text
 * @param {?Object} options
 * @param {!function(string):!Array<!Object>} parse
 * @return {!Object}
 */
processingjs.lint.validator = function(text, options, parse) {
  try {
    var result = parse(text);
  } catch(e) {
    console.error(e);
    return [];
  }
  var errors = [];
  var seen = {};
  for (var i = 0; i < result.length; i++) {
    var block = result[i];
    if (!block || !block.hasOwnProperty('kind')) continue;
    if (block['kind'] == 'error') {
      var start = block['location']['start'];
      var end = block['location']['end'];
      errors.push({
	"message": "Unparseable",
	"severity": "error",
	"from": new Pos(start['line']-1, start['column']-1),
	"to": new Pos(end['line']-1, end['column']-1),
      });
    } else if (block['name']) {
      // Check the named top level blocks for non-duplication.
      if (seen[block['name']]) {
	if (block.location) {
	  var start = block['location']['start'];
	  var end = block['location']['end'];
	  errors.push({
	    "message": "Duplicated definition of " + block['name'],
	    "severity": "error",
	    "from": new Pos(start['line']-1, start['column']-1),
	    "to": new Pos(end['line']-1, end['column']-1),
	  });
	}
      }
      seen[block['name']] = true;
      if (block['kind'] == 'var' && !block['semi']) {
	var start = block['location']['start'];
	var end = block['location']['end'];
	errors.push({
	  "message": "Missing semicolon ';'",
	  "severity": "error",
	  "from": new Pos(start['line']-1, start['column']-1),
	  "to": new Pos(end['line']-1, end['column']-1),
	});
      }
    }
  }
  return errors;
};
