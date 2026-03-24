%token LAMBDA DOT
%token <string> IDENT
%token LPAREN RPAREN
%token EOF

%start <Lambda.expr> main
%start <Lambda.expr> expr
%type <Lambda.expr> atomexpr
%type <Lambda.expr> appexpr
%type <Lambda.expr> appexprwlams

%%

main:
| e = expr EOF
        { e }

atomexpr:
| i = IDENT
        { Var i }
| LPAREN e = expr RPAREN
        { e }

appexpr:
| e = atomexpr
        { e }
| e1 = appexpr e2 = atomexpr
        { App (e1, e2) }

appexprwlams:
| e = appexpr
        { e }
| e1 = appexpr LAMBDA x = IDENT DOT e = expr
        { App (e1, Lambda (x, e)) }

expr:
| e = appexprwlams
        { e }
| LAMBDA x = IDENT DOT e = expr
        { Lambda (x, e) }
