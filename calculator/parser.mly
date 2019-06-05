%{
    let memory = Hashtbl.create 8
%}

%token <float>  NUM
%token <string> ID
%token          LPAREN RPAREN
%token          ASSIGN
%token          SUM MINUS PROD DIV
%token          SEMICOLON
%token          EOF

%right ASSIGN
%left  SUM MINUS
%left  PROD DIV

%start <unit> program;

%%

program:
 | seq EOF              { }

seq:
 | seq e=exp SEMICOLON  { Printf.printf "= %f\n%!" e }
 |                      { }

exp:
 | v=ID ASSIGN e=exp    { Hashtbl.replace memory v e; e }
 | x=exp SUM y=exp      { x +. y }
 | x=exp MINUS y=exp    { x -. y }
 | x=exp PROD y=exp     { x *. y }
 | x=exp DIV y=exp      { x /. y }
 | x=NUM                { x }
 | v=ID                 { try Hashtbl.find memory v with Not_found -> 0. }
 | LPAREN e=exp RPAREN  { e }
