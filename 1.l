%{
/* This is the code by Anthony Prajwal P
 * To count the number of chars, words, spaces, lines in the given input file i.e input.txt
 */
%}

%{
#include <stdio.h>
int chars = 0;
int words = 0;
int spaces = 0;
int lines = 0;
%}

%%
[^ \n\t]+	{words++; chars+=yyleng;}
\n		{lines++;}
" "		{spaces++;}
\t		{spaces++;}
%%

int main(){
	yyin = fopen("input.txt", "r");
	yylex();
	printf("The Count is:\nChars:%d\nWords:%d\nSpaces:%d\nLines:%d\n",chars, words, spaces, lines);
	return 0;
}
