// A quick and dirty grammar for parsing top-level declarations
// in a Processing sketch: variables and functions.
// NOTE: This is more a proof of concept rather than the real grammar.
// Compile with
//   ../node_modules/pegjs/bin/pegjs --format globals --export-var toplevelGrammar toplevel.pegjs

Source = _ decl:Decl* { return decl; }
Decl = x:FuncDecl _ { return x; } / x:VarDecl _ { return x; } / c:CommentLine _ { return c; } / e:ErrorLine _ { return e; }
ErrorLine = _ ( [^\n]* ) "\n" { return {"kind": "error", "location": location() }; }
VarDecl = type:Type vars:(name:Identifier __ value:Assign?)* semi:Semi        
	{
    	return { "kind": "var", "type": type, "vars": vars, "semi": semi,
                 "location": location() };
    }
FuncDecl = type:Type name:Identifier Args "{" _ BraceMatched "}"_   
	{
    	return { "kind": "func", "type": type,
          "name": name, "location": location() };
    }

Assign = "=" _ expr:Expr __ { return null; }
        / "=" __ [^\n\r;]* { return null; }

Args = "(" [^)]* ")" _ { return null; }

Expr = left:Term tail:(_ op:AddOp _ right:Term)*  { return null; }
Term = left:Factor tail:(_ op:MulOp _ right:Term)*  { return null; }
Factor = "(" _ expr:Expr ")" {return expr;}
        / name:Identifier { return {"kind": "identifier", "name": name}; }
    / value:Literal { return{"kind": "literal", "value": value}; }
Identifier = [a-zA-Z_][a-zA-Z_0-9]* { return text(); }
Literal = String  / Number / Character
String = '"' ( !'"' . / "\\\"" )* '"' { return {"string": text}; }
Character = "'" ( !"'" . ) "'" { return {"char": text}; }
Number = [+-]?[0-9]+("."[0-9]*)? { return parseFloat(text); }

Type = name:Identifier _ { return name; }

LogOp = op:([|&^~] / "&&" / "||") _ { return op; }
AddOp = op:([+-] / "<<" / ">>") _ { return op; }
MulOp = op:[*/%] _ { return op; }

CommentLine = Comment
BraceMatched =  AnyUnbraced ("{" _ BraceMatched "}" _ AnyUnbraced /
                             "(" _ BraceMatched ")" _ AnyUnbraced /
                             "[" _ BraceMatched "]" _ AnyUnbraced)*  
  
  { return null; }
Comment = "/*" ( !"*/" . )* "*/" / "//" ( ![\n\r] . )* NL?  { return null; }
AnyUnbraced = ( Comment / ![{}()\[\]] . )*            { return null; }

Semi = ";" 						{ return true; }
       / NL              		{ return false; }
_ = [ \t\r\n]*                  { return null; }
__ = [ \t]*     				{ return null; }
NL = [\r]?[\n]                  { return null; }
