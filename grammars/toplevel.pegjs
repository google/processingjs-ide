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

// This is a very lenient grammar that tries to parse the pieces it can
// and reports the rest with red wavy underlines.

Source = _ x:LenientDecl* { return x; }
StrictSource = _ x:Decl* { return x; }
LenientDecl = x:Decl { return x; }
  / e:ErrorLine _ { return e; }
Decl = x:ClassDecl _ { return x; }
  / x:FuncDecl _ { return x; }
  / x:VarDecl _ { return x; }
  / x:Statement _ { return x; }
  / c:CommentLine _ { return c; }
  

ErrorLine
  = _ ( [^\n]* ) NL { return {kind: "error", location: location() }; }
  / _ ( [^\n]+ ) { return {kind: "error", location: location() }; }
ClassDecl = Visibility "class" _ name:identifier _ TypeParameters? ("extends" _ TypeList)? ("implements" _ TypeList)? ClassBody
  {
    return {kind: "class", "name": name, location: location() };
  }
Visibility = "public" _
  / "private" _
  / _
ClassBody = "{" _ x:ClassBodyDecl* _ "}" _ { return x; }
ClassBodyDecl
  = ";" _
  / "static" _ Block
  / Modifier* ClassMemberDecl

ClassMemberDecl = MethodDecl
  / FieldDecl
  / ClassDecl
  / ConstructorDecl

ConstructorDecl =
  identifier _ ThrowsClause? FormalParameters Block

MethodDecl = ("void" _ / TypeType) name:identifier _ FormalParameters
  body:(b:Block {return b;} / ";" _ {return [];})
  { return {"name": name, "kind": "method", "children": body}; }
FormalParameters = "(" _ FormalParameterList? ")" _
FormalParameterList
  = FormalParameter ("," _ FormalParameter)* ("," _ LastFormalParameter)?
  / LastFormalParameter
FormalParameter =  VariableModifier* TypeType VariableDeclaratorId
LastFormalParameter = VariableModifier* TypeType "..." _ VariableDeclaratorId

FieldDecl = t:TypeType v:VariableDeclarators s:Semi
  { return {"kind": "field", "vars": v, "type": t, "semi": s}; }

ThrowsClause = "throws" _ QualifiedNameList
QualifiedNameList = QualifiedName (_ "," _ QualifiedName)*

TypeDeclaration = ClassDecl / InterfaceDecl
InterfaceDecl = "interface" _ identifier _ TypeParameters? ("extends" _ TypeList)? InterfaceBody
// TODO(salikh)
InterfaceBody = BraceMatched

Modifier =
  s:("public"
  / "protected"
  / "private"
  / "static"
  / "abstract"
  / "final"
  / "strictfp") _ {return s; }

Block = "{" _ b:BlockStatement* _ "}" _
  { return b; }
BlockStatement = t:TypeDeclaration { return t; }
  / s:Statement { return s; }
  / x:VarDecl _ { return x; }

Statement = x:Block _ { return x; }
  / "if" _ "(" _ e:Expression ")" _ a:Statement ("else" _ b:Statement)?
  / "for" _ "(" _ f:ForControl ")" _ s:Statement
  / "while" _ "(" _ e:Expression ")" _ s:Statement
  / "do" _ s:Statement "while" _ "(" _ e:Expression ")" _ semi:Semi
  / "try" _ Block (CatchClause+ FinallyBlock? / FinallyBlock)
  / "switch" _ "(" _ e:Expression ")" _ SwitchBlock
  / "return" _ e:Expression _ semi:Semi _
  / "break" _ i:identifier _ semi:Semi _
  / "continue" _ i:identifier _
  / i:identifier _ ":" _ s:Statement
  / e:Expression semi:Semi _
  / ";" _

CatchClause = "catch" _ "(" _ VariableModifier* CatchType identifier _ ")" _ b:Block
CatchType = QualifiedName ("|" _ QualifiedName)*
FinallyBlock = "finally" _ b:Block 
VariableModifier = "final" _

ForControl = ForInit? _ ";" _ e:Expression? _ ";" _ ForUpdate?
ForInit = VarDeclaration
  / ExpressionList
ForUpdate = ExpressionList
ExpressionList = Expression (_ "," _ Expression)*

// TODO(salikh)
SwitchBlock = BraceMatched

VarDecl = v:VarDeclaration semi:Semi?
  {
    if (semi) {
      v["semi"] = semi
    } else {
      v["semi"] = false
    }
    return v;
  }
VarDeclaration
  = mod:VariableModifier* type:TypeType vars:VariableDeclarators
    {
      return {"kind": "var", "type": type, "vars": vars,
	"location": location() };
    }
  / type:TypeType name:identifier (_ "[" _ "]")* __ value:Assign?
    {
      return {"kind": "var", "type": type, "name": name,
	"value": value, "location": location() };
    }

VariableDeclarators = 
  VariableDeclarator (_ "," _ VariableDeclarator)*
VariableDeclarator =
  VariableDeclaratorId (_ "=" _ VariableInitializer)?
VariableDeclaratorId = identifier (__ "[" _ "]")* __


FuncDecl = type:TypeType name:identifier _ Args block:Block   
	{
    	return { "kind": "func", "type": type,
	  "children": block,
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
TypeArguments = "<" _ TypeArgument ("," _ TypeArgument)* ">" __
TypeArgument = TypeType / "?" _ (("extends" / "super") _ TypeType)?
PrimitiveType = ("boolean" / "byte" / "char" / "double" / "float"
		/ "int" / "long" / "short") _


QualifiedName = a:identifier b:(_ "." _ c:identifier {return "." + c;})* __
  { return a + b.join(""); }



Expression
  = l:Term r:(_ ExprRest*)
    { r['children'] = [l].concat(r); }
  / t:Term
    { return t; }

Term
  = "(" _ e:Expression ")" __ { return e; }
  / "{" _ e:ExpressionList? _ "}" __
    { return {"kind": "initializer", "children": e}; }
  / o:[~!+-] e:Expression
    { return {"kind": "op", "op": o, "children": [e]}; }
  / o:("++"/"--") e:Expression
    { return {"kind": "op", "op": o, "children": [e]}; }
  / "new" _ x:Creator
    { x["kind"] = "new"; return x; }
  / n:QualifiedName { return {"kind": "name", "name": n}; }
  / v:literal __ { return{"kind": "literal", "value": v}; }

ExprRest
  = o:op _ e:Expression
    { return {"kind": "op", "op": o, "children": [e]}; }
  / "[" _ e:Expression _ "]" __
    { return {"kind": "index", "children": [e]}; }
  / "(" _ ee:ExpressionList? _ ")" __
    { return {"kind": "call", "children": ee}; }
  / o:("++"/"--") __
    { return {"kind": "op", "op": o, "children": []}; }
  / "." _ n:identifier __
    { return {"kind": "access", "name": n}; }

ArrayInitializer = "{" (_ VariableInitializer (_ "," _ VariableInitializer)* (_ ",")? )? _ "}" __
VariableInitializer = ArrayInitializer / Expression

Creator = n:CreatedName e:(ArrayCreatorRest / ClassCreatorRest)
  { return {"name": n}; }
CreatedName
  = identifier TypeArgumentsOrDiamond? (_ '.' identifier TypeArgumentsOrDiamond)*
  / PrimitiveType
ClassCreatorRest = Arguments
ArrayCreatorRest
  = "[" _ "]" (_ "[" _ "]" )* _ ArrayInitializer
  / "[" _ Expression _ "]" (_ "[" _ Expression _ "]")* (_ "[" _ "]")*

Arguments = "(" _ e:ExpressionList? ")" __
  { return e; }

TypeArgumentsOrDiamond
  = _ '<' _ '>' __
  / _ TypeArguments


identifier = [a-zA-Z_][a-zA-Z_0-9]* { return text(); }
literal = string  / number / character
string = '"' ( !'"' . / "\\\"" )* '"' { return {"string": text}; }
character = "'" ( !"'" . ) "'" { return {"char": text}; }
number = [+-]?[0-9]+("."[0-9]*)? { return parseFloat(text); }


op = o:([+*/&%|^<>!=-] "="  / "&&" / "||" / "<<" "<"? / ">>" ">"? / [=+*%/<>^&|-])
  { return o; }

CommentLine = Comment
BraceMatched =  AnyUnbraced ("{" _ BraceMatched "}" _ AnyUnbraced /
                             "(" _ BraceMatched ")" _ AnyUnbraced /
                             "[" _ BraceMatched "]" _ AnyUnbraced)*  
  
  { return null; }
Comment = "/*" ( !"*/" . )* "*/" / "//" ( ![\n\r] . )* NL?  { return null; }
AnyUnbraced = ( Comment / ![{}()\[\]] . )*            { return null; }

Semi = ";" _ 						{ return true; }
       / NL _              		{ return false; }
_ = ( Comment / [ 　\t\r\n]+)*            { return null; }
__ = ( Comment / [ 　\t]+)*     				{ return null; }
NL = [\r]?[\n]                  { return null; }
