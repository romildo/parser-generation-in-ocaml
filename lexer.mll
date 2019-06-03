{
  open Parser

  exception Unexpected_character of char
}

let digit = [ '0' - '9' ]
let letra = [ 'a' - 'z' 'A' - 'Z' ]
  
rule scan = parse
| [ ' ' '\t' '\n' ]					{ scan lexbuf }
| digit+ ("." digit*)? | (digit* ".")? digit+ as x	{ TNum (float_of_string x) }
| letra (letra | digit | '_')* as x			{ TId x }
| "("							{ TLParen }
| ")"							{ TRParen }
| ";"							{ TPV }
| ":="							{ TAtr }
| "+"							{ TSum }
| "-"							{ TMinus }
| "*"							{ TProd }
| "/"							{ TDiv }
| eof							{ TEOF }
| _ as x						{ raise (Unexpected_character x) }
