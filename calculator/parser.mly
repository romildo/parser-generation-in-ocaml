%{
    let memory = Hashtbl.create 8
%}
   

%token <float>  TNum
%token <string> TId
%token          TLParen TRParen
%token          TAssign
%token          TSum TMinus TProd TDiv
%token          TSemicolon
%token          TEOF

%right TAssign
%left  TSum TMinus
%left  TProd TDiv

%start <unit> program;

%%

let program :=
 | seq; TEOF

let seq :=
 | s=seq; e=exp; TSemicolon;  { print_float e; print_newline () }
 |                            { }

let exp :=
 | v=TId; TAssign; e=exp;   { Hashtbl.replace memory v e; e }
 | x=exp; TSum; y=exp;      { x +. y }
 | x=exp; TMinus; y=exp;    { x -. y }
 | x=exp; TProd; y=exp;     { x *. y }
 | x=exp; TDiv; y=exp;      { x /. y }
 | x=TNum;                  { x }
 | v=TId;                   { try Hashtbl.find memory v with Not_found -> 0. }
 | TLParen; e=exp; TRParen; { e }

%%
