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

/**
 * @fileoverview Makeshift externs for Codemirror.
 * TODO(salikh): Integrate the real Codemirror externs from Codemirror repo.
 *
 * @externs
 */

/**
 * @param {!Element} elt
 * @param {Object} options
 * @constructor
 */
var CodeMirror = function(elt, options) {};

/**
 * @param {HTMLTextAreaElement} textarea
 * @param {Object} options
 * @return {!CodeMirror}
 */
CodeMirror.fromTextArea = function(textarea, options) {};

/**
 * @param {number} line
 * @param {number} ch
 * @constructor
 */
CodeMirror.Pos = function(line, ch) {};

/**
 * @type {number}
 */
CodeMirror.Pos.prototype.line;

/**
 * @type {number}
 */
CodeMirror.Pos.prototype.ch;

/**
 * @return {string}
 */
CodeMirror.prototype.getValue = function() {};

/**
 * @return {!CodeMirror.Pos}
 */
CodeMirror.prototype.getCursor = function() {};

/**
 * @param {number} lineno
 * @return {string}
 */
CodeMirror.prototype.getLine = function(lineno) {};

/**
 * @param {string} value
 */
CodeMirror.prototype.setValue = function(value) {};

/**
 * @param {string} key
 * @param {?Object} value
 */
CodeMirror.prototype.setOption = function(key, value) {};

/**
 * @param {{top: number, left: number}} pos
 * @param {string} mode
 * @return {!CodeMirror.Pos}
 */
CodeMirror.prototype.coordsChar = function(pos, mode) {};

CodeMirror.lint = {
  /**
   * @type {Object}
   */
  processingjs: {},
};
