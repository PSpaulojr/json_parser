%{

#include <stdio.h>
#include <stdlib.h>

void yyerror(char *c);
int yylex(void);

int valido = 0;

%}

%left COMMA

%token CHAVEABRE NOME COLON NUMBER CHAVEFECHA ASPAS COMMA ABREBRA FECHABRA


%%
OBJETO:
    CHAVEABRE PAIR CHAVEFECHA{
      valido = 1; 
    }

PAIR:
    STRING COLON VALUE;
    | PAIR COMMA PAIR;

STRING:
    ASPAS STRINGINT ASPAS;

STRINGINT:
    NOME;
    |
    ;

ARRAY:
    ABREBRA VALUESEQ FECHABRA;

VALUESEQ:
    VALUE;
    |VALUESEQ COMMA VALUESEQ;

VALUE:
    NUMBER;
    | ARRAY;
    | OBJETO;
    | STRING;
    |ABREBRA FECHABRA ;



%%

void yyerror(char *s) {
  valido = 0;
  printf("INVALIDO\n");
  }

int main() {
  yyparse();
  if(valido){
    printf("VALIDO\n");
  }
    return 0;
}
