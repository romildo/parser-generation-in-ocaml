{
  module P = Parser

  exception Unexpected_character of char
}

let space = [ ' ' '\t' '\n' ]
let digit = [ '0' - '9' ]
let letter = [ 'a' - 'z' 'A' - 'Z' ]
let num = digit+ ("." digit*)? | (digit* ".")? digit+
let id = letter (letter | digit | '_')*
  
rule scan = parse
| space    { scan lexbuf }
| num as x { P.TNum (float_of_string x) }
| id as x  { P.TId x }
| "("      { P.TLParen }
| ")"      { P.TRParen }
| ";"      { P.TSemicolon }
| ":="     { P.TAssign }
| "+"      { P.TSum }
| "-"      { P.TMinus }
| "*"      { P.TProd }
| "/"      { P.TDiv }
| eof      { P.TEOF }
| _ as x   { raise (Unexpected_character x) }
