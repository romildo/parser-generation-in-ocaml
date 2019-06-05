let _ =
  let lbuf = Lexing.from_channel stdin in
  Parser.program Lexer.scan lbuf
