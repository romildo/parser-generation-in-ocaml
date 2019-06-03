%{
    let memory = Hashtbl.create 8
%}
   

%token <float>  TNum
%token <string> TId
%token          TLParen TRParen
%token          TAtr
%token          TSum TMinus TProd TDiv
%token          TPV
%token          TEOF

%right          TAtr
%left           TSum TMinus
%left           TProd TDiv

%type <unit> program;

%start program;

%%

program:
  seq TEOF         	{ }
;

seq:
  seq exp TPV           { print_float $2; print_newline () }
|                       { }
;

exp:
  TId TAtr exp		{ Hashtbl.replace memory $1 $3; $3 }
| exp TSum exp		{ $1 +. $3 }
| exp TMinus exp	{ $1 -. $3 }
| exp TProd exp		{ $1 *. $3 }
| exp TDiv exp		{ $1 /. $3 }
| TNum			{ $1 }
| TId			{ try Hashtbl.find memory $1 with Not_found -> 0. }
| TLParen exp TRParen	{ $2 }
;

%%









  
