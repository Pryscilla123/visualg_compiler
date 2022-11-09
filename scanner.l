%option noyywrap nodefault 
%option yylineno case-insensitive

%{
#include <stdio.h>
#include <stdlib.h>
%}


%%

"algoritmo"     {printf("PALAVRA RESERVADA: %s\n", yytext);}
"inicio"        {printf("PALAVRA RESERVADA: %s\n", yytext);}
"fimalgoritmo"  {printf("PALAVRA RESERVADA: %s\n", yytext);}
"var"           {printf("PALAVRA RESERVADA: %s\n", yytext);}
"inteiro"       {printf("PALAVRA RESERVADA: %s\n", yytext);}
"vetor"         {printf("PALAVRA RESERVADA: %s\n", yytext);}
"de"            {printf("PALAVRA RESERVADA: %s\n", yytext);}
"caractere"     {printf("PALAVRA RESERVADA: %s\n", yytext);}
"logico"        {printf("PALAVRA RESERVADA: %s\n ", yytext);}
"aleatorio"     {printf("PALAVRA RESERVADA: %s\n", yytext);}
"arquivo"       {printf("PALAVRA RESERVADA: %s\n", yytext);}
"asc"           {printf("PALAVRA RESERVADA: %s\n", yytext);}
"ate"           {printf("PALAVRA RESERVADA: %s\n", yytext);}
"caracpnum"     {printf("PALAVRA RESERVADA: %s\n", yytext);}
"caso"          {printf("PALAVRA RESERVADA: %s\n", yytext);}
"compr"         {printf("PALAVRA RESERVADA: %s\n", yytext);}
"copia"         {printf("PALAVRA RESERVADA: %s\n", yytext);}
"cronometro"    {printf("PALAVRA RESERVADA: %s\n", yytext);}
"debug"         {printf("PALAVRA RESERVADA: %s\n", yytext);}
"e"             {printf("PALAVRA RESERVADA: %s\n", yytext);}
"eco"           {printf("PALAVRA RESERVADA: %s\n", yytext);}
"enquanto"      {printf("PALAVRA RESERVADA: %s\n", yytext);}
"entao"         {printf("PALAVRA RESERVADA: %s\n", yytext);}
"escolha"       {printf("PALAVRA RESERVADA: %s\n", yytext);}
"escreval"      {printf("PALAVRA RESERVADA: %s\n", yytext);}
"faca"          {printf("PALAVRA RESERVADA: %s\n", yytext);}
"falso"         {printf("PALAVRA RESERVADA: %s\n", yytext);}
"fimenquanto"   {printf("PALAVRA RESERVADA: %s\n", yytext);}
"fimescolha"    {printf("PALAVRA RESERVADA: %s\n", yytext);}
"fimfuncao"     {printf("PALAVRA RESERVADA: %s\n", yytext);}
"fimpara"       {printf("PALAVRA RESERVADA: %s\n", yytext);}
"fimprocedimento" {printf("PALAVRA RESERVADA: %s\n", yytext);}
"fimrepita"     {printf("PALAVRA RESERVADA: %s\n", yytext);}
"fimse"         {printf("PALAVRA RESERVADA: %s\n", yytext);}
"funcao"        {printf("PALAVRA RESERVADA: %s\n", yytext);}
"int"           {printf("PALAVRA RESERVADA: %s\n", yytext);}
"interrompa"    {printf("PALAVRA RESERVADA: %s\n", yytext);}
"leia"          {printf("PALAVRA RESERVADA: %s\n", yytext);}
"limpatela"     {printf("PALAVRA RESERVADA: %s\n", yytext);}
"maiusc"        {printf("PALAVRA RESERVADA: %s\n", yytext);}
"minusc"        {printf("PALAVRA RESERVADA: %s\n", yytext);}
"mudacor"       {printf("PALAVRA RESERVADA: %s\n", yytext);}
"nao"           {printf("PALAVRA RESERVADA: %s\n", yytext);}
"numpcarac"     {printf("PALAVRA RESERVADA: %s\n", yytext);}
"ou"            {printf("PALAVRA RESERVADA: %s\n", yytext);}
"outrocaso"     {printf("PALAVRA RESERVADA: %s\n", yytext);}
"para"          {printf("PALAVRA RESERVADA: %s\n", yytext);}
"passo"         {printf("PALAVRA RESERVADA: %s\n", yytext);}
"pausa"         {printf("PALAVRA RESERVADA: %s\n", yytext);}
"pos"           {printf("PALAVRA RESERVADA: %s\n", yytext);}
"real"          {printf("PALAVRA RESERVADA: %s\n", yytext);}
"procedimento"  {printf("PALAVRA RESERVADA: %s\n", yytext);}
"repita"        {printf("PALAVRA RESERVADA: %s\n", yytext);}
"retorne"       {printf("PALAVRA RESERVADA: %s\n", yytext);}
"se"            {printf("PALAVRA RESERVADA: %s\n", yytext);}
"senao"         {printf("PALAVRA RESERVADA: %s\n", yytext);}
"timer"         {printf("PALAVRA RESERVADA: %s\n", yytext);}
"verdadeiro"    {printf("PALAVRA RESERVADA: %s\n", yytext);}
"xou"           {printf("PALAVRA RESERVADA: %s\n", yytext);}
"dos"           {printf("PALAVRA RESERVADA: %s\n", yytext);}

"+"             {printf("OPERADOR ARITMETICO: %s\n", yytext);}
"-"             {printf("OPERADOR ARITMETICO: %s\n", yytext);}
"*"             {printf("OPERADOR ARITMETICO: %s\n", yytext);}
"/"|"DIV"       {printf("OPERADOR ARITMETICO: %s\n", yytext);}
"MOD"|"%"       {printf("OPERADOR ARITMETICO: %s\n", yytext);}
"^"             {printf("OPERADOR ARITMETICO: %s\n", yytext);}

"<="            {printf("OPERADOR RELACIONAL: %s\n", yytext);}
">="            {printf("OPERADOR RELACIONAL: %s\n", yytext);}
"="             {printf("OPERADOR RELACIONAL: %s\n", yytext);}
"<"             {printf("OPERADOR RELACIONAL: %s\n", yytext);}
">"             {printf("OPERADOR RELACIONAL: %s\n", yytext);}
"<>"            {printf("OPERADOR RELACIONAL: %s\n", yytext);}

"["           {printf("SIMBOLO ESPECIAL: %s\n", yytext);}
"]"           {printf("SIMBOLO ESPECIAL: %s\n", yytext);}
".."           {printf("SIMBOLO ESPECIAL: %s\n", yytext);}
"<-"           {printf("SIMBOLO ESPECIAL: %s\n", yytext);}
","           {printf("SIMBOLO ESPECIAL: %s\n", yytext);}
":="           {printf("SIMBOLO ESPECIAL: %s\n", yytext);}
":"            {printf("SIMBOLO ESPECIAL: %s\n", yytext);}
"("            {printf("SIMBOLO ESPECIAL: %s\n", yytext);}
")"            {printf("SIMBOLO ESPECIAL: %s\n", yytext);}
";"            {printf("SIMBOLO ESPECIAL: %s\n", yytext);}

\"([^\\\"]|\\.)*\"    {printf("LITERAL: %s\n", yytext);}

[a-zA-Z]+([0-9]*|[a-zA-Z_-]*)       {printf("IDENTIFICADOR: %s\n", yytext);}

(\-?)[0-9]+	{printf("INTEIRO: %s\n", yytext);}
(\-)?[0-9]+(\.)[0-9]+ {printf("REAL: %s\n", yytext);}


[ ]* { /* ignore white space */ }

\/.*  { /* ignore white space */ }

\n { /* ignore white space */ }

[ \t]   { /* ignore white space */ }

\{.*     { /* ignore white space */ }

.       { printf("Mystery character: %c\n", yytext[0]); }

%%

int main(int argc, char **argv) {

  if(argc < 2) { /* just read stdin */
    yylex();
  } else {

    int i = 0;

    for(i = 1; i < argc; i++) {

      FILE *f = fopen(argv[i], "r");
    
      if(!f) {
        perror(argv[1]);
        return (1);
      }

      yyrestart(f);
      yylex();
      fclose(f);
    }
  }

  return 0;
}