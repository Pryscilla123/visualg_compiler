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

procparametro: /* Nothing */
             | '(' declaracaovariaveis ')'
             ;

proc: PROCEDIMENTO NAME procparametro conteudomain FIMPROCEDIMENTO;

funcparametro: /* Nothing */
             | '(' declaracaovariaveis ')'
             ;

func: FUNCAO NAME funcparametro ':' tipovm conteudomain FIMFUNCAO;

selecaocomposta: /* Nothing */
               | CASO listaexp conteudo selecaocomposta
               | OUTROCASO listaexp conteudo
               ;

selecao: ESCOLHA NAME selecaocomposta FIMESCOLHA;

repeticaoenquanto: ENQUANTO condicao FACA conteudo FIMENQUANTO;

repeticaopara: PARA NAME DE NUMBER_INT ATE NUMBER_INT FACA conteudo FIMPARA;

dcsimplescomposto: /* Nothing */
                 | ENTAO conteudo dcsimplescomposto
                 | SENAO conteudo
                 ;

desviocondicional: SE condicao dcsimplescomposto FIMSE;

condicao: NAME CMP NAME
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

listaexp: exp
        | exp ',' listaexp
        ;

conteudo: /* Nothing */
        | varrecebe conteudo
        | desviocondicional conteudo
        | repeticaopara conteudo
        | repeticaoenquanto conteudo
        | selecao conteudo
        | NAME
        | NAME '(' variaveis ')'
        ;

conteudoblocovar: /* Nothing */
                | declaracaovariaveis conteudoblocovar
                | declaracaovetor conteudoblocovar
                ;

tipovm: REAL
      | INTEIRO
      | LOGICO
      | CARACTERE
      | VETOR
      ;

declaracaomv: NUMBER_INT DP NUMBER_INT
            | NUMBER_INT DP NUMBER_INT ',' declaracaomv
            ;

declaracaovetor: declaracaovariaveis '[' declaracaomv ']' DE tipovm;


declaracaovariaveis: variaveis ':' tipovm;

variaveis: NAME
          | NAME ',' variaveis
          ;


blocofuncproc: /* Nothing */
             | func blocofuncproc
             | proc blocofuncproc
             ;


blocovar: VAR conteudoblocovar { printf("bloco var reconhecido\n"); };

conteudomain: blocovar blocofuncproc INICIO conteudo { printf("conteudo reconhecido\n");} ;

algoritmo: ALGORITMO LITERAL conteudomain FIMALGORITMO { printf("Programa reconhecido\n"); };

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