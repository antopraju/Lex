%{
/* This is the code by Anthony Prajwal P
 * To count the number of Comment lines in a given C program.The input is taken from data.c file.
 */
%}


%{
#include <stdio.h>
int count = 0;
%}

%x	C

%%
"/*"[.]*"*/"	{count++;}
"/*"		{BEGIN C;}
<C>"*/"		{BEGIN 0; count++;}
<C>.		{;}
<C>\n		{;}
\/\/.*		{count++;}
%%

int main(){
	yyin = fopen("data.c", "r");
	yylex();
	printf("The number of comments are: %d\n",count);
	return 0;
}

int yywrap(){
	return 1;
}	
