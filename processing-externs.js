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
 * @fileoverview Externs for the Processing.js.
 *
 * @externs
 */

/**
 * @param {Element} canvas
 * @param {!Object} source
 * @constructor
 */
var Processing = function(canvas, source) {};

/**
 * @param {string} source
 * @constructor
 */
Processing.Sketch = function(source) {};

/**
 * @param {Processing} processing
 */
Processing.Sketch.prototype.attach = function(processing) {};

/**
 * @param {string} source
 * @return {!Processing.Sketch}
 */
Processing.compile = function(source) {};

Processing.prototype.loop = function() {};
Processing.prototype.noLoop = function() {};
Processing.prototype.setup = function() {};
Processing.prototype.exit = function() {};

/**
 * @type {number}
 */
Processing.prototype.width = 0;

/**
 * @type {number}
 */
Processing.prototype.height = 0;
