// This is a very lenient grammar that tries to parse the pieces it can
// and reports the rest with red wavy underlines.

Source = _ decl:Decl* { return decl; }
Decl = x:ClassDecl _ { return x; }
  / x:FuncDecl _ { return x; }
  / x:VarDecl _ { return x; }
  / x:Statement _ { return x; }
  / c:CommentLine _ { return c; }
  / e:ErrorLine _ { return e; }

ErrorLine
  = _ ( [^\n]* ) NL { return {"kind": "error", "location": location() }; }
  / _ ( [^\n]+ ) { return {"kind": "error", "location": location() }; }
ClassDecl = Visibility "class" _ identifier _ TypeParameters? ("extends" _ TypeList)? ("implements" _ TypeList)? ClassBody
Visibility = "public" _
  / "private" _
  / _
// TODO(salikh)
ClassBody = BraceMatched
TypeDeclaration = ClassDecl / InterfaceDecl
InterfaceDecl = "interface" _ identifier _ TypeParameters? ("extends" _ TypeList)? InterfaceBody
// TODO(salikh)
InterfaceBody = BraceMatched


Block = "{" _ BlockStatement* "}" _
BlockStatement = t:TypeDeclaration { return t; }
  / x:VarDecl _ { return x; }
  / s:Statement { return s; }

Statement = x:Block _ { return x; }
  / "if" _ "(" _ e:Expression ")" _ a:Statement ("else" _ b:Statement)?
  / "for" _ "(" _ f:ForControl ")" _ s:Statement
  / "while" _ "(" _ e:Expression ")" _ s:Statement
  / "do" _ s:Statement "while" _ "(" _ e:Expression ")" _ semi:Semi
  / "try" _ Block (CatchClause+ FinallyBlock? / FinallyBlock)
  / "switch" _ "(" _ e:Expression ")" _ SwitchBlock
  / "return" _ e:Expression
  / "break" _ i:identifier _
  / "continue" _ i:identifier _
  / i:identifier _ ":" _ s:Statement
  / e:Expression semi:Semi _
  / ";" _

CatchClause = "catch" _ "(" _ VariableModifier* CatchType identifier _ ")" _ b:Block
CatchType = QualifiedName ("|" _ QualifiedName)*
FinallyBlock = "finally" _ b:Block 
VariableModifier = "final" _

ForControl = ForInit? ";" _ e:Expression? ";" _ ForUpdate?
  / TypeType 
ForInit = VarDecl
  ExpressionList
ForUpdate = ExpressionList
ExpressionList = Expression ("," _ Expression)*

// TODO(salikh)
SwitchBlock = BraceMatched

VarDecl = type:TypeType name:identifier _ ("[" _ "]" _)* __ value:Assign? semi:Semi        
  {
    return {"kind": "var", "type": type, "name": name, "semi": semi,
      "value": value, "location": location() };
  }
FuncDecl = type:TypeType name:identifier _ Args "{" _ BraceMatched "}"_   
	{
    	return { "kind": "func", "type": type,
          "name": name, "location": location() };
    }

Assign = "=" _ expr:Expression __ { return null; }

Args = "(" [^)]* ")" _ { return null; }

TypeList = TypeType ("," _ TypeType)*
TypeParameters = "<" _ TypeParameter ("," _ TypeParameter)* ">" _
TypeParameter = identifier _ ("extends" _ TypeBound)?
TypeBound = TypeType ("&" _ TypeType)*
TypeType = PrimitiveType ("[" _ "]" _)*
  / ClassType ("[" _ "]" _)*
ClassType = identifier _ TypeArguments? ("." _ identifier _ TypeArguments?)*
TypeArguments = "<" _ TypeArgument ("," _ TypeArgument)* ">" _
TypeArgument = TypeType / "?" _ (("extends" / "super") _ TypeType)?
PrimitiveType = ("boolean" / "byte" / "char" / "double" / "float"
		/ "int" / "long" / "short") _


QualifiedName = a:identifier _ b:("." _ c:identifier _ {return "." + c;})*
  { return a + b.join(""); }

Expression
  = left:Term tail:(_ op:AddOp _ right:Term)*  { return null; }
Term
  = left:Factor tail:(_ op:MulOp _ right:Term)*  { return null; }
Factor
  = "(" _ expr:Expression ")" _ {return expr;}
  / n:QualifiedName "(" _ ee:ExpressionList? ")" _
  / n:QualifiedName "[" _ e:Expression "]" _
  / n:QualifiedName { return {"kind": "identifier", "name": n}; }
  / value:literal _ { return{"kind": "literal", "value": value}; }
  / "{" _ ExpressionList? "}" _
identifier = [a-zA-Z_][a-zA-Z_0-9]* { return text(); }
literal = string  / number / character
string = '"' ( !'"' . / "\\\"" )* '"' { return {"string": text}; }
character = "'" ( !"'" . ) "'" { return {"char": text}; }
number = [+-]?[0-9]+("."[0-9]*)? { return parseFloat(text); }

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
