%token <int> NUM
%token PLUS TIMES
%token EOF

%left PLUS
%left TIMES

%start <unit> program

%%

program: exp EOF   {}

exp: NUM           {}
   | exp PLUS exp  {}
   | exp TIMES exp {}
