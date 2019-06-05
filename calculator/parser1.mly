%{
    let memory = Hashtbl.create 8
%}
   

%token <float>  TNum
%token <string> TId
%token          TLParen TRParen
%token          TSum TMinus TProd TDiv
%token          TEOF

%type <float> program;

%start program;

%%

program:
  exp TEOF           { $1 }
;
  
exp:
  exp TSum term      { $1 +. $3 }
| exp TMinus term    { $1 -. $3 }
| term               { $1 }
;

term:
  term TProd factor  { $1 *. $3 }
| term TDiv factor   { $1 /. $3 }
| factor             { $1 }
;

factor:
  TNum               { $1 }
| TId                { try Hashtbl.find memory $1 with Not_found -> 0. }
| TLParen exp TRParen{ $2 }
;

%%









  
