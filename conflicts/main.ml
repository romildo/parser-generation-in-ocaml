let _ =
  let lexbuf = Lexing.from_channel stdin in
  Parser.program Lexer.lex lexbuf
