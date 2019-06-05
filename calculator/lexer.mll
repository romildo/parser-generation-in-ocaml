{
  module P = Parser

  exception Unexpected_character of char
}

let space  = [ ' ' '\t' '\n' ]
let digit  = [ '0' - '9' ]
let letter = [ 'a' - 'z' 'A' - 'Z' ]
let num    = digit+ ("." digit*)? | (digit* ".")? digit+
let id     = letter (letter | digit | '_')*
  
rule scan = parse
| space    { scan lexbuf }
| num as x { P.NUM (float_of_string x) }
| id as x  { P.ID x }
| "("      { P.LPAREN }
| ")"      { P.RPAREN }
| ";"      { P.SEMICOLON }
| ":="     { P.ASSIGN }
| "+"      { P.SUM }
| "-"      { P.MINUS }
| "*"      { P.PROD }
| "/"      { P.DIV }
| eof      { P.EOF }
| _ as x   { raise (Unexpected_character x) }
