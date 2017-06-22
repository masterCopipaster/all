#include <stdio.h>
#include <string.h>
#include "processor.h"
#include "stack.h"

#define ST_LEN 10000
#define REG_NUM 1000
#define RET_ST_LEN 10000


int main(int argc, char* argv[]){
    if( argc > 1 ){
        FILE* sourcefile = fopen(argv[1], "rb");
        if(sourcefile != NULL){
            CPU pr = createCPU(ST_LEN, REG_NUM, RET_ST_LEN);
            //printf("creating stone\n");
            long mem_len = 100;
            fscanf(sourcefile, "%d\n", &mem_len);
            pr.mem_begin = (char*)calloc(mem_len, sizeof(char));
            fread(pr.mem_begin, sizeof(char), mem_len, sourcefile);
            RUN(&pr);
            prdump(&pr);
        }
    }
    printf("press enter to exit");
    scanf("%*[^\n]") ;
    scanf("%*[^\n]") ;
    getchar();
    getchar();
    return(0);
}
