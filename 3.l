%{
/* This is the code by Anthony Prajwal P
 * To Recognize the valid Arthmetic Expression and recognize the valid identifiers and operators present.
 */
%}


%{
#include <stdio.h>
int a = 0, s = 0, m = 0, d = 0, ob = 0, cb = 0;
int fa = 0, fs = 0, fm = 0, fd = 0;
int n1 = 0, n2 = 0;
%}

id	[a-zA-Z][a-zA-Z0-9_]*

%%
{id}	{n1++; printf("%s is a identifier\n",yytext);}
[+]	{n2++; a++; fa = 1;}
[-]	{n2++; s++; fs = 1;}
[*]	{n2++; m++; fm = 1;}
[/]	{n2++; d++; fd = 1;}
[(]	{ob++;}
[)]	{cb++;}
%%

int main(){
	printf("Enter the expression: ");
	yylex();
	if((n1 - n2) == 1 && (ob - cb) == 0){
		printf("Valid Expression\n");
		printf("Add: %d, Sub: %d, Mul: %d, Div: %d\n",a,s,m,d);
		printf("The operators used are: \n");
		if(fa)	printf("+\n");
		if(fs)  printf("-\n");
		if(fm)  printf("*\n");
		if(fd)  printf("/\n");
		return 0;
	}
	else 
		printf("Invaid Expression\n");
		return 0;
}

int yywrap(){
	return 1;
}
