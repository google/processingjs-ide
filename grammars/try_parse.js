// Default input.
let input = 'void func() { int x = 1; }';
let start = 'Source';
let expr = null;

if (process.argv.length > 4) {
	expr = process.argv[4];
}
if (process.argv.length > 3) {
	start = process.argv[3];
}
if (process.argv.length > 2) {
	input = process.argv[2];
}

require("google-closure-library");
module.paths.push(process.cwd());
const toplevel = require('./toplevel.pegjs.js');
const toplevelGrammar = toplevel.toplevelGrammar;

function evalInContext(expr) {
	return eval(expr);
}

console.log("input: ", input)
try {
	const parse_result = toplevelGrammar.parse(input, {startRule: start});
	if (expr) {
		console.log(evalInContext.call(parse_result, expr));
	} else {
		console.log(parse_result);
	}
} catch (e) {
	console.log("error: ", e)
}
