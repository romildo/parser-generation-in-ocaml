let spaces = [ ' ' '\t' '\n' ]+
let num    = [ '0' - '9' ]+

rule lex = parse
 | spaces   { lex lexbuf }
 | num as s { Parser.NUM (int_of_string s) }
 | "+"      { Parser.PLUS }
 | "*"      { Parser.TIMES }
 | eof      { Parser.EOF }
 | _ as c   { Printf.eprintf "Unexpected char '%c'\n" c; lex lexbuf }
