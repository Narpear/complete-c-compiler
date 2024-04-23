%{ 
#define YYSTYPE char*
#include <unistd.h>
#include "y.tab.h"
#include <stdio.h>
extern void yyerror(const char *);
%}

digit [0-9]
letter [a-zA-Z]
id {letter}({letter}|{digit})*
digits {digit}+
opFraction (\.{digits})?
opExponent ([Ee][\+\-]?{digits})?
number {digits}{opFraction}{opExponent}

%option yylineno
%%

\/\/(.*)        ; /* Ignore comments */
[\t\n]          ; /* Ignore whitespace */
"<="            {return LTEQ;}
">="            {return GTEQ;}
"=="            {return EQQ;}
"!="            {return NEQ;}
"{"             {return OC;}
"}"             {return CC;}
"("             {return *yytext;}
")"             {return *yytext;}
"."             {return *yytext;}
","             {return *yytext;}
"*"             {return *yytext;}
"+"             {return *yytext;}
";"             {return *yytext;}
"-"             {return *yytext;}
"/"             {return *yytext;}
"="             {return *yytext;}
">"             {return GT;}
"<"             {return LT;}
{number}        {yylval = strdup(yytext); return T_NUM;}
"if"            {return T_IF;}
"else"          {return T_ELSE;}
"do"            {return T_DO;}
"while"         {return T_WHILE;}
{id}            {yylval = strdup(yytext); return T_ID;}
.               {}

%%