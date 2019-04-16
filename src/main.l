
%{
#include <stdlib.h>
#include <string.h>

void yyerror(char *);

#include "y.tab.h"

%}


%%

["] {
  return ASPAS;
}


[{] {
  return CHAVEABRE;
}

[}] {
  return CHAVEFECHA;
}

[,] {
  return COMMA;
}

[[] {
  return ABREBRA;
}

[]] {
  return FECHABRA;
}

[a-z]+[0-9]*([ ]*[a-z]*[0-9]*)*(\n)* {
  return NOME;
}

[:] {
  return COLON;
}

[-]?[0-9]+[.]*[0-9]* {
  return NUMBER;
}

. ;

[\n] ;

 

%%

int yywrap() {
  return 1;
}
