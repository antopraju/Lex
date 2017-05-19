%{
/* This is the code by Anthony Prajwal P
 * To recognize and count the number of valid arthmetic identifers in a given input file i.e id.txt
 */
%}


%{
#include <stdio.h>
int count = 0;
%}

id	[a-zA-Z_][a-zA-Z0-9_]*

%%
{id}	{count++; printf("%s\n",yytext);}
.*	{;}
\n	{;}	
%%

int main(){
	yyin = fopen("id.txt", "r");
	yylex();
	printf("The number of identifiers are: %d\n",count);
	return 0;
}

int yywrap(){
	return 1;
}
