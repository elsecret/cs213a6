#include <stdio.h>

int x[] = {1,2,3,-1,-2,0,184,340057058};
int y[] = {0,0,0,0,0,0,0,0};

int f(int arg){
    int local = arg;
    int temp = 0x8000000;
    int return_value;
    while (local != 0){
        local = temp & local;
        if (local != 0){
            return_value++;
        }
        local << 1;
    }
    return return_value;
}

int main(int argc, char** args){
    int i = 8;
    while (i != 0){
        i--;
        y[i] = f(x[i]);
    }

    for (int i = 0; i < 8; i++){
        printf("%d\n", x[i]);
    }
    for (int i = 0; i < 8; i++){
        printf("%d\n", y[i]);
    }
    return 0;
}