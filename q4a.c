#include <stdio.h>

int * e;


void foo(int c, int d){
    e[d] += c;
}

void main(int argc, char** args){
    int a = 1;
    int b = 2;
    foo(3, 4);
    foo(3, 4);
    for(int i = 0; i < 10; i++){
        printf("%d\n", e[i]);
    }
}