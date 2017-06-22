#include <stdio.h>
#include <string.h>
#include <assert.h>
#include "command_sys.h"
#include "processor.h"

#define MAX_PROG_LEN 10000
#define MAX_COMM_LEN 10

//typedef DATATYPE processor_datatype ;


void compile(FILE* sourcefile, void** tofirst, void** tolast, int* length);
void makecast(FILE* sourcefile, void** mem_ind, int* label_ind, int* label_num, int* labels);

int main(int argc, char* argv[]){

    FILE* sourcefile;
    if( argc > 1 ){
        sourcefile = fopen(argv[1], "r");
        if(sourcefile == NULL){
            fprintf(stderr, "no such file %s , using stdin\n", argv[1]);
            sourcefile = stdin;
        }
    }
    else{
        sourcefile = stdin;
    }



    void* prog_mem, *mem_ind;
    int length = 0;

    compile(sourcefile, &prog_mem, &mem_ind, &length);


    if ( argc > 1){
        char resname[100] = {};
        strcpy(resname, argv[1]);
        char* point = strrchr(resname, '.');
        if(!point)
        {
            point = resname + strlen(resname);
        }
        sprintf(point, ".myexe");

        FILE* targetfile = fopen(resname,"wb");
        fprintf(targetfile, "%d\n", length);

        for( char* i = (char*) prog_mem; i < mem_ind+1; i++ ){
            fputc(*i, targetfile);
        }
    }

    else{
        CPU pr = createCPU(100, 10, 1000);
        pr.mem_begin = (char*)prog_mem;
        RUN(&pr);
    }
    return(0);
}



void compile(FILE* sourcefile, void** tofirst, void** tolast, int* length){
    int label_num = 0;   // номер команды
    int label_ind = 0;   // индекс относительно начала массива с программой
    //int labels[MAX_PROG_LEN];  // labels index array
    int* labels = (int*)calloc(MAX_PROG_LEN, sizeof(int));  //массив индексов vеток
    void* prog_mem = calloc(MAX_PROG_LEN, sizeof(processor_datatype));   // программная память
    void* mem_ind = prog_mem;
    // first cast
    makecast(sourcefile, &mem_ind, &label_ind, &label_num, labels);
    //printf("%d\n", label_num);
    //second cast

    if(label_num > 0){
        //printf("second cast\n");
        label_num = 0;   // номер команды
        label_ind = 0;
        void* mem_ind = prog_mem;
        rewind(sourcefile);
        makecast(sourcefile, &mem_ind, &label_ind, &label_num, labels);
    }
    *tofirst = prog_mem;
    *tolast = mem_ind;
    *length = label_ind;
}

void makecast(FILE* sourcefile, void** mem_ind, int* label_ind, int* label_num, int* labels){
    char command_code = -1;
    int res = 1;
    int label;
    char comm_str[MAX_COMM_LEN];
    processor_datatype arg;
    int cha,chb;
    while(res > 0){
        res = fscanf( sourcefile, "%s", comm_str);

        if( !strcmp(comm_str, "push")){
            command_code = push;
            fscanf( sourcefile, DATATYPE_SIGN, &arg);

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *((processor_datatype*)*mem_ind) = arg;
            *mem_ind += sizeof(processor_datatype);
            *label_ind += sizeof(char);
            *label_ind += sizeof(processor_datatype);

        }

        else if( !strcmp(comm_str, "pushr")){
            command_code = pushr;
            fscanf( sourcefile, "%d", &cha);

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *((char*)*mem_ind) = cha;
            *mem_ind += sizeof(cha);
            *label_ind += sizeof(char);
            *label_ind += sizeof(cha);

        }

        else if( !strcmp(comm_str, "popr")){
            command_code = popr;
            fscanf( sourcefile, "%d", &cha);

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *((char*)*mem_ind) = cha;
            *mem_ind += sizeof(cha);
            *label_ind += sizeof(char);
            *label_ind += sizeof(cha);

        }

        else if( !strcmp(comm_str, "pop")){
            command_code = pop;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "add")){
            command_code = fadd;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "sub")){
            command_code = fsub;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "div")){
            command_code = fdiv;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "mul")){
            command_code = fmul;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "pow")){
            command_code = _pow;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "sin")){
            command_code = fsin;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "cos")){
            command_code = fcos;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "abs")){
            command_code = _abs;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "sqrt")){
            command_code = fsqrt;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "in")){
            command_code = in;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "out")){
            command_code = out;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "mov")){
            command_code = mov;
            fscanf( sourcefile, "%d %d", &cha, &chb);
            //printf("%d %d\n", cha,chb);

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *((char*)*mem_ind) = cha;
            *mem_ind += sizeof(char);
            *((char*)*mem_ind) = chb;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);
            *label_ind += sizeof(char);
            *label_ind += sizeof(char);

        }

        else if( !strcmp(comm_str, "end")){
            command_code = end;

            *((char*)*mem_ind) = command_code;
            //printf("end on %d\n", *label_ind);
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

            //res = 0;
        }

        else if( !strcmp(comm_str, "ret")){
            command_code = ret;
            //printf("ret\n");
            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);
        }


        else if( !strcmp(comm_str, "endprog")){
            command_code = end;

            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *label_ind += sizeof(char);

            res = 0;
        }

        else if( !strcmp(comm_str, "call")){
            command_code = call;
            fscanf( sourcefile, "%d", &label);
            //printf( "call to %d\n", labels[label]);
            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *((int*)*mem_ind) = labels[label];
            *mem_ind += sizeof(int);
            *label_ind += sizeof(char);
            *label_ind += sizeof(int);

        }

        else if( !strcmp(comm_str, "jmp")){
            command_code = jmp;
            fscanf( sourcefile, "%d", &label);
            //printf( "jmp to %d\n", labels[label]);
            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *((int*)*mem_ind) = labels[label];
            *mem_ind += sizeof(int);
            *label_ind += sizeof(char);
            *label_ind += sizeof(int);

        }

        else if( !strcmp(comm_str, "je")){
            command_code = je;
            fscanf( sourcefile, "%d", &label);
            //printf( "je to %d\n", labels[label]);
            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *((int*)*mem_ind) = labels[label];
            *mem_ind += sizeof(int);
            *label_ind += sizeof(char);
            *label_ind += sizeof(int);

        }

        else if( !strcmp(comm_str, "jle")){
            command_code = jle;
            fscanf( sourcefile, "%d", &label);
            //printf( "jle to %d\n", labels[label]);
            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *((int*)*mem_ind) = labels[label];
            *mem_ind += sizeof(int);
            *label_ind += sizeof(char);
            *label_ind += sizeof(int);

        }

        else if( !strcmp(comm_str, "jl")){
            command_code = jl;
            fscanf( sourcefile, "%d", &label);
            //printf( "jl to %d\n", labels[label]);
            *((char*)*mem_ind) = command_code;
            *mem_ind += sizeof(char);
            *((int*)*mem_ind) = labels[label];
            *mem_ind += sizeof(int);
            *label_ind += sizeof(char);
            *label_ind += sizeof(int);

        }

        else if( comm_str[0] == ':'){
            sscanf(comm_str + 1, "%d", &label);
            //printf("new label to %d\n", *label_ind);
            labels[label] = *label_ind;
            (*label_num)++;
        }
        else if( *comm_str == '/'){}
        else{
            fprintf(stderr, "error: %s\n",comm_str);
        }

    }
}







