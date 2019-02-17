#include <stdio.h>

int e[]= {1,2,3,4,5,6,7,8,9,10};


void foo(int c, int d){
    e[d] += c;
}

int main(int argc, char** args){
    int a = 1;
    int b = 2;
    foo(3, 4);
    foo(3, 4);
    for(int i = 0; i < 10; i++){
        printf("%d\n", e[i]);
    }
    return 0;
}
