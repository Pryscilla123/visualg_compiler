%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char s);

#define YYERROR_VERBOSE

void yyerror(char s);
int yylex();
extern int yylineno;
extern FILE *yyin;
extern void yylex_destroy();

%}

/*Tokens*/

%token ALGORITMO 
%token INICIO 
%token FIMALGORITMO 
%token VAR 
%token INTEIRO  
%token VETOR 
%token DE 
%token CARACTERE 
%token LOGICO 
%token ALEATORIO
%token ARQUIVO
%token ATE
%token CASO
%token CRONOMETRO
%token DEBUG
%token E
%token ECO
%token ENQUANTO
%token ENTAO
%token ESCOLHA
%token FACA
%token FALSO
%token FIMENQUANTO
%token FIMESCOLHA
%token FIMFUNCAO
%token FIMPARA
%token FIMPROCEDIMENTO
%token FIMREPITA
%token FIMSE
%token FUNCAO
%token INTERROMPA
%token LIMPATELA
%token MUDACOR
%token NAO
%token OU
%token OUTROCASO
%token PARA
%token PASSO
%token PAUSA
%token REAL
%token PROCEDIMENTO
%token REPITA
%token RETORNE
%token SE
%token SENAO
%token TIMER
%token VERDADEIRO
%token XOR
%token DOS

%token NUMBER_REAL
%token NUMBER_INT
%token LITERAL
%token NAME
%token FUNC
%token DP

%nonassoc CMP
%right ATRIBUIR
%left '+' '-'
%left '*' '/' MOD DIV

%start algoritmo

%%

repeticaoenquanto: ENQUANTO condicao FACA conteudo FIMENQUANTO;

repeticaopara: PARA NAME DE NUMBER_INT ATE NUMBER_INT FACA conteudo FIMPARA;

dcsimplescomposto: /* Nothing */
                 | ENTAO conteudo dcsimplescomposto
                 | SENAO conteudo
                 ;

desviocondicional: SE condicao dcsimplescomposto FIMSE;

condicao: NAME CMP NAME; 
        | NAME CMP number
        | NAME CMP LITERAL
        | NAME CMP VERDADEIRO
        | NAME CMP FALSO
        ;

varrecebe: NAME ATRIBUIR exp;

number: NUMBER_INT
      | NUMBER_REAL
      ;

exp: number
   | VERDADEIRO
   | FALSO
   | LITERAL
   | NAME
   | exp '+' exp
   | exp '-' exp
   | exp '*' exp
   | exp '/' exp
   | exp MOD exp
   | exp DIV exp
   ;

conteudo: /* Nothing */
        | varrecebe conteudo
        | desviocondicional conteudo
        | repeticaopara conteudo
        | repeticaoenquanto conteudo
        ;

blocoprograma: conteudo;

conteudoblocovar: /* Nothing */
                | declaracaovariaveis conteudoblocovar
                | declaracaovetor conteudoblocovar
                | declaracaomatriz conteudoblocovar
                ;

declaracaomatriz: NAME ':' VETOR '[' NUMBER_INT DP NUMBER_INT ',' NUMBER_INT DP NUMBER_INT ']' DE REAL
                | NAME ':' VETOR '[' NUMBER_INT DP NUMBER_INT ',' NUMBER_INT DP NUMBER_INT ']' DE INTEIRO
                ;

declaracaovetor: NAME ':' VETOR '[' NUMBER_INT DP NUMBER_INT ']' DE REAL
               | NAME ':' VETOR '[' NUMBER_INT DP NUMBER_INT ']' DE INTEIRO
               ;

declaracaovariaveis: variaveis ':' REAL
                   | variaveis ':' INTEIRO
                   | variaveis ':' LOGICO
                   | variaveis ':' CARACTERE
                   ;

variaveis: NAME
          | NAME ',' variaveis
          ;

blocovar: VAR conteudoblocovar { printf("bloco var reconhecido\n"); };

conteudo: blocovar INICIO blocoprograma { printf("conteudo reconhecido\n");} ;

algoritmo: ALGORITMO LITERAL conteudo FIMALGORITMO { printf("Programa reconhecido\n"); };

%%

int main(int argc, char **argv){
    yyin = fopen(argv[1], "r");

    if(!yyin) {
        return (1);
    }
    printf("teste\n");
    yyparse();
    printf("Arquivo reconhecido com sucesso\n");
    fclose(yyin);
}

void yyerror(char s){
    printf("%s\n", s);
    printf("linha %d\n", yylineno);
}