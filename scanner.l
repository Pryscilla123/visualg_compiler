%option noyywrap nodefault
%option yylineno case-insensitive

%{
#include <stdio.h>
#include <stdlib.h>

#include "scanner.tab.h"

%}


%%

"algoritmo"     { return ALGORITMO; }
"inicio"        { return INICIO; }
"fimalgoritmo"  { return FIMALGORITMO; }
"var"           {  return VAR; }
"inteiro"       { return INTEIRO; }
"vetor"         { return VETOR; }
"de"            { return DE; }
"caractere"     { return CARACTERE; }
"logico"        { return LOGICO; }
"aleatorio"     { return ALEATORIO; }
"arquivo"       { return ARQUIVO; }
"ate"           { return ATE; }
"caso"          { return CASO; }
"cronometro"    { return CRONOMETRO; }
"debug"         { return DEBUG; }
"e"             { return E; }
"eco"           { return ECO; }
"enquanto"      { return ENQUANTO; }
"entao"         { return ENTAO; }
"escolha"       { return ESCOLHA; }
"faca"          { return FACA; }
"falso"         { return FALSO; }
"fimenquanto"   { return FIMENQUANTO; }
"fimescolha"    { return FIMESCOLHA; }
"fimfuncao"     { return FIMFUNCAO; }
"fimpara"       { return FIMPARA; }
"fimprocedimento" { return FIMPROCEDIMENTO; }
"fimrepita"     { return FIMREPITA; }
"fimse"         { return FIMSE; }
"funcao"        { return FUNCAO; }
"interrompa"    { return INTERROMPA; }
"limpatela"     { return LIMPATELA; }
"mudacor"       { return MUDACOR; }
"nao"           { return NAO; }
"ou"            { return OU; }
"outrocaso"     { return OUTROCASO; }
"para"          { return PARA; }
"passo"         { return PASSO; }
"pausa"         { return PAUSA; }
"real"          { return REAL; }
"procedimento"  { return PROCEDIMENTO; }
"repita"        { return REPITA; }
"retorne"       { return RETORNE; }
"se"            { return SE; }
"senao"         { return SENAO; }
"timer"         { return TIMER; }
"verdadeiro"    { return VERDADEIRO; }
"xou"           { return XOR; }
"dos"           { return DOS; }
"div"           { return DIV;}
"mod"           { return MOD; }

"escreval"      { return FUNC; }
"escreva"       { return FUNC; }
"leia"          { return FUNC; }
"rand"          { return FUNC; }
"randi"         { return FUNC; }
"abs"           { return FUNC; }
"arccos"        { return FUNC; }
"arcsen"        { return FUNC; }
"arctan"        { return FUNC; }
"cos"           { return FUNC; }
"cotan"         { return FUNC; }
"exp"           { return FUNC; }
"grauprad"      { return FUNC; }
"log"           { return FUNC; }
"logn"          { return FUNC; }
"sen"           { return FUNC; }
"tan"           { return FUNC; }
"asc"           { return FUNC; }
"numpcarac"     { return FUNC; }
"caracpnum"     { return FUNC; }
"maiusc"        { return FUNC; }
"minusc"        { return FUNC; }
"pos"           { return FUNC; }
"compr"         { return FUNC; }
"copia"         { return FUNC; }
"carac"         { return FUNC; }
"int"           { return FUNC; }
"raizq"         { return FUNC; }

"+"            { return yytext[0]; }
"-"            { return yytext[0]; }
"*"            { return yytext[0]; }
"/"            { return yytext[0]; }
"%"            { return yytext[0]; }
"^"            { return yytext[0]; }
"["            { return yytext[0]; }
"]"            { return yytext[0]; }
","            { return yytext[0]; }
":"            { return yytext[0]; }
"("            { return yytext[0]; }
")"            { return yytext[0]; }
";"            { return yytext[0]; }

":="           { return ATRIBUIR; }
".."           { return DP; }
"<-"           { return ATRIBUIR; }


"<="            { return CMP; }
">="            { return CMP; }
"="             { return CMP; }
"<"             { return CMP; }
">"             { return CMP; }
"<>"            { return CMP; }

\"([^\\\"]|\\.)*\"    { return LITERAL; }

[a-zA-Z]+([0-9]*|[a-zA-Z_-]*)       { return NAME; }

(\-?)[0-9]+	{ return NUMBER_INT; }
(\-)?[0-9]+(\.)[0-9]+ { return NUMBER_REAL; }


\/.*  { /* ignore white space */ }

[ \t]   { /* ignore white space */ }

\{.*     { /* ignore white space */ }

"\n" { /*return EOL;*/ }

.       { printf("Mystery character: %c\n", yytext[0]); }

%%