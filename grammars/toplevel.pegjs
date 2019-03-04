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

{
  // Introduce a few helper functions in the initializer block.

  // Converts the parser location to format expected by CodeMirror lint.
  // TODO(salikh): Remove?
  function addPos(obj) {
    if (!obj) return obj;
    if ("location" in obj) {
      const loc = obj["location"];
      if (!loc) return obj;
      if ("start" in loc) {
        obj["from"] = {
          line: loc["start"]["line"],
          ch: loc["start"]["column"]-1
        }
      }
      if ("end" in loc) {
        obj["to"] = {
          line: loc["end"]["line"],
          ch: loc["end"]["column"]-1
        }
      }
    }
    return obj;
  }

  // Creates an error message (red wavy underline) attached to a code location
  // in format that linter can use directly.
  function err(message, loc) {
    return {
      "kind": "message",
      "severity": "error",
      "message": message,
      "location": loc
    };
  }

  // Creates a warning message (yellow wavy underline) attached to a code
  // location in a linter-friendly format.
  function warn(message, loc) {
    return {
      "kind": "message",
      "severity": "warning",
      "message": message,
      "location": loc
    };
  }

  function appendChild(obj, child) {
    if (!child) return obj;
    if (!obj.hasOwnProperty("children")) {
      obj["children"] = [];
    }
    obj["children"].push(child);
    return obj;
  }
}

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
ClassDecl = Visibility "class" _ name:identifier _ TypeParameters? ("extends" _ TypeList)? ("implements" _ TypeList)? b:ClassBody
  {
    return {"kind": "class", "name": name, "location": location(),
            "children": b};
  }
Visibility = "public" _
  / "private" _
  / _
ClassBody = "{" _ x:ClassBodyDecl* _ "}" _ { return x; }
ClassBodyDecl
  = ";" _ { return null; }
  / "static" _ b:Block { return b; }
  / Modifier* b:ClassMemberDecl { return b; }

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

FieldDecl = t:TypeType v:VariableDeclarators semi:Semi
  { return appendChild({"kind": "field", "vars": v, "type": t}, semi); }

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

Block = "{" _ bb:BlockStatement* _ "}" _ { return bb; }
BlockStatement = t:TypeDeclaration _ { return t; }
  / s:Statement _ { return s; }
  / x:VarDecl _ { return x; }

Statement = x:Block _ { return {kind: "block", children: x}; }
  / "if" _ "(" _ e:Expression ")" _ a:Statement b:("else" _ s:Statement { return s; })?
    { return {"kind": "if", "children": [e, a].concat(b)}; }
  / "for" _ "(" _ f:ForControl ")" _ s:Statement
    { return {"kind": "for", "children": [f, s]}; }
  / "while" _ "(" _ e:Expression ")" _ s:Statement
    { return {"kind": "while", "children": [e, s]}; }
  / "do" _ s:Statement "while" _ "(" _ e:Expression ")" _ semi:Semi
    { return appendChild({"kind": "dowhile", "children": [s, e],
              "location": location()}, semi); }
  / "try" _ Block (CatchClause+ FinallyBlock? / FinallyBlock)
  / "switch" _ "(" _ e:Expression ")" _ SwitchBlock
  / "return" _ e:Expression _ semi:Semi? _
    { return {"kind": "return", "children": [e], "semi": semi,
              "location": location()}; }
  / "break" _ i:identifier _ semi:Semi? _
    { return {"kind": "break", "semi": semi,
              "location": location()}; }
  / "continue" _ i:identifier _
    { return {"kind": "continue", "semi": semi,
              "location": location()}; }
  / i:identifier _ ":" _ s:Statement 
    { return s; }
  / e:expression semi:Semi _ 
    { return appendChild({"kind": "expression", "children": [e],
              "location": location()}, semi); }
  / ";" _

CatchClause = "catch" _ "(" _ VariableModifier* CatchType identifier _ ")" _ b:Block
CatchType = QualifiedName ("|" _ QualifiedName)*
FinallyBlock = "finally" _ b:Block 
VariableModifier = "final" _

ForControl = a:ForInit? _ ";" _ e:Expression? _ ";" _ u:ForUpdate?
  { return {"kind": "for-control", "children": [a,e,u]}; }
ForInit = VarDeclaration
  / ExpressionList
ForUpdate = ExpressionList
ExpressionList = a:Expression b:(_ "," _ e:Expression { return e; })*
  { return [a].concat(b); }

// TODO(salikh)
SwitchBlock = BraceMatched

VarDecl = v:VarDeclaration semi:Semi
  { return appendChild(v, semi); }
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
VariableDeclarator = variableDeclarator __
variableDeclarator = variableDeclaratorId (_ "=" _ VariableInitializer)?
VariableDeclaratorId = variableDeclaratorId __
variableDeclaratorId = identifier (__ "[" _ "]")*


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


QualifiedName = qualifiedName __
qualifiedName = a:identifier b:(_ "." _ c:identifier {return "." + c;})*
  { return a + b.join(""); }



Expression = x:expression _ {return x;}
expression
  = l:term r:(_ exprRest)+
    { return {kind:"expr", children: [l].concat(r.children), location: location()}; }
  / t:term
    { return t; }

Term = x:term __ {return x;}
term
  = "(" _ e:Expression ")" { return e; }
  / "{" _ e:ExpressionList? _ "}" 
    { return {"kind": "initializer", "children": e}; }
  / o:[~!+-] _ e:expression
    { return {"kind": "op", "op": o, "children": [e]}; }
  / o:("++"/"--") _ e:expression
    { return {"kind": "op", "op": o, "children": [e]}; }
  / "new" _ x:Creator
    { x["kind"] = "new"; return x; }
  / n:qualifiedName { return {"kind": "name", "name": n}; }
  / v:literal { return{"kind": "literal", "value": v}; }

ExprRest = exprRest __
exprRest
  = o:op _ e:expression
    { return {"kind": "op", "op": o, "children": [e]}; }
  / "[" _ e:expression _ "]"
    { return {"kind": "index", "children": [e]}; }
  / "(" _ ee:ExpressionList? _ ")"
    { return {"kind": "call", "children": ee}; }
  / o:("++"/"--") __
    { return {"kind": "op", "op": o, "children": []}; }
  / "." _ n:identifier __
    { return {"kind": "access", "name": n}; }

ArrayInitializer = "{" (_ VariableInitializer (_ "," _ VariableInitializer)* (_ ",")? )? _ "}" __
VariableInitializer = variableInitializer __
variableInitializer = ArrayInitializer / expression

Creator = creator __
creator = n:CreatedName e:(ArrayCreatorRest / ClassCreatorRest)
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
number = [+-]?[0-9]+("."[0-9]*)? { return parseFloat(text()); }


op = o:([+*/&%|^<>!=-] "="  / "&&" / "||" / "<<" "<"? / ">>" ">"? / [=+*%/<>^&|-])
  { return o; }

CommentLine = Comment
BraceMatched =  AnyUnbraced ("{" _ BraceMatched "}" _ AnyUnbraced /
                             "(" _ BraceMatched ")" _ AnyUnbraced /
                             "[" _ BraceMatched "]" _ AnyUnbraced)*  
  
  { return null; }
Comment = "/*" ( !"*/" . )* "*/" / "//" ( ![\n\r] . )* NL?  { return null; }
AnyUnbraced = ( Comment / ![{}()\[\]] . )*            { return null; }

FullWidthSemi = "；" { return location(); }
Location = &. { return location(); }
EOF = !. { return location(); }

Semi = __ ";" _                                            { return null; }
       / __ loc:FullWidthSemi _ { return err("Full-width semicolon", loc); }
       / __ loc:NL _            { return err("Missing semicolon (NL)", loc); }
       / __ loc:EOF             { return err("Missing semicolon (EOF)", loc); }
_ = ( Comment / [ 　\t\r\n]+)*            { return null; }
__ = ( Comment / [ 　\t]+)*                                     { return null; }
NL = [\r]?[\n]                  { return location(); }
