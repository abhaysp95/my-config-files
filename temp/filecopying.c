/** Name -> Abhay Shanker Pathak
Date -> 2020-03-15
Description -> Copy file with simple getchar() and putchar()
Email -> abhaysp9955@gmail.com
Github -> https://github.com/CoolAbhayS
Last Edit -> 2020-03-15 */

#include<stdio.h>

typedef int nchar;

// main function <<<
int main(int argc, char *argv[])
{
	nchar c;
	c = getchar();
	while (c != EOF)
	{
		putchar(c);
		c = getchar();
	}
	return 0;
}
