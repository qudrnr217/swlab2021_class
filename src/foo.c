#include <stdio.h>
#include "funcs.h"

int foo(int flag)
{
	if(flag){
		
		printf("hello foo\n");
	}else{
		printf("good bye~\n");
	}

	return 0;
}
