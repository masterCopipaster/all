/*! \file processor.h
    \brief Processor structure and functions.

    Details.
*/

#ifndef PROCH
#define PROCH
#define NDEBUG
//includes
#include <math.h>
#include <stdio.h>
#include <string.h>



typedef double processor_datatype ;

typedef processor_datatype stack_datatype;
#include "stack.h"
#include "command_sys.h"

// common constants
//#define DEBUG
#define NO_CONTROL

#define DATATYPE_SIGN "%lg"
#define PROC_DUMP_LEN 10000
#include "stack.h"

// error codes
#define WRONG_CODE_ERR 5
#define PROC_OK_CHECK_ERR 6
#define END_PROG -1


/**
    @note fuck the programming
*/



struct CPU {
    Stack stk;
    Stack retStk;
    processor_datatype* reg;
    processor_datatype rubbish;
    char* mem_ind;
    char* mem_begin;
    size_t reg_num = 0 ;
    bool ok = false;
};

int makeStep(CPU* proc);

CPU createCPU(size_t st_len, size_t reg_num, size_t ret_stack_len){
    CPU res;
    res.reg_num=reg_num;
    res.stk = getStack(st_len);
    res.retStk = getStack(ret_stack_len);
    res.reg = (processor_datatype*)calloc(reg_num, sizeof(processor_datatype));
    res.ok = true;
    return (res);
}

void burnCPU(CPU* proc){
    burnStack(&(*proc).stk);
    burnStack(&(*proc).retStk);
    free((*proc).reg);
    delete proc;
}


inline int makeStep(CPU* proc){
    int status = 0;
    //if (!(*proc).ok){
    //    return (PROC_OK_CHECK_ERR);
    //}

    char cmd = *(*proc).mem_ind;
    int label;
    processor_datatype opera, operb;
    char cha,chb;
    //printf("%d\n", cmd);
    switch (cmd) {
    case end:
        status = END_PROG;
        break;
    case push:
        (*proc).mem_ind++;
        status = stpush( &(*proc).stk ,(stack_datatype*) (*proc).mem_ind);
        (*proc).mem_ind += sizeof(processor_datatype);
        break;

    case pushr:
        (*proc).mem_ind++;
        status = stpush( & (*proc).stk ,(stack_datatype*) ( (*proc).reg + (*(int*)(*proc).mem_ind)) );
        (*proc).mem_ind += sizeof(int);
        break;

    case pop:
        (*proc).mem_ind++;
        status = stpop( & (*proc).stk , & (*proc).rubbish);
        break;

    case popr:
        (*proc).mem_ind++;
        status = stpop( & (*proc).stk ,(stack_datatype*) ( (*proc).reg + (*(int*)(*proc).mem_ind) ) );
        (*proc).mem_ind += sizeof(int);
        break;

    case fadd:
        (*proc).mem_ind++;
        status = stpop( & (*proc).stk , &opera);
        status = stpop( & (*proc).stk , &operb);
        opera = opera + operb;
        status = stpush( & (*proc).stk , &opera);
        break;

    case fsub:
        (*proc).mem_ind++;
        status = stpop( & (*proc).stk , &opera);
        status = stpop( & (*proc).stk , &operb);
        opera = operb - opera;
        status = stpush( & (*proc).stk , &opera);
        break;

    case fmul:
        (*proc).mem_ind++;
        status = stpop( & (*proc).stk , &opera);
        status = stpop( & (*proc).stk , &operb);
        opera = opera * operb;
        status = stpush( & (*proc).stk , &opera);
        break;

    case _pow:
        (*proc).mem_ind++;
        status = stpop( & (*proc).stk , &opera);
        status = stpop( & (*proc).stk , &operb);
        opera = pow(operb, opera);
        status = stpush( & (*proc).stk , &opera);
        break;

    case fdiv:
        (*proc).mem_ind++;
        status = stpop( & (*proc).stk , &opera);
        status = stpop( & (*proc).stk , &operb);
        opera = operb / opera;
        status = stpush( & (*proc).stk , &opera);
        break;

    case fsin:
        (*proc).mem_ind++;
        status = stpop( & (*proc).stk , &opera);
        opera = sin( opera );
        status = stpush( & (*proc).stk , &opera);
        break;

    case fcos:
        (*proc).mem_ind++;
        status = stpop( & (*proc).stk , &opera);
        opera = cos( opera );
        status = stpush( & (*proc).stk , &opera);
        break;

    case _abs:
        (*proc).mem_ind++;
        status = stpop( & (*proc).stk , &opera);
        opera = fabs( opera );
        status = stpush( & (*proc).stk , &opera);
        break;

    case fsqrt:
        (*proc).mem_ind++;
        status = stpop( & (*proc).stk , &opera);
        opera = sqrt( opera );
        status = stpush( & (*proc).stk , &opera);
        break;

    case in:
        (*proc).mem_ind++;
        scanf(DATATYPE_SIGN,&opera);
        status = stpush( & (*proc).stk , &opera);
        break;

    case out:
        (*proc).mem_ind++;
        status = stpop( & (*proc).stk , &opera);
        printf(DATATYPE_SIGN,opera);
        putchar('\n');
        putchar('\a');
        break;

    case mov:
        (*proc).mem_ind++;
        cha = *(*proc).mem_ind;
        (*proc).mem_ind++;
        chb = *(*proc).mem_ind;
        (*proc).mem_ind++;
        memcpy((*proc).reg + cha * sizeof(processor_datatype), (*proc).reg + chb * sizeof(processor_datatype), sizeof(processor_datatype));
        break;

    case je:
        (*proc).mem_ind++;
        label = *(int*)((*proc).mem_ind);
        status = stpop( & (*proc).stk , &opera);
        status = stpop( & (*proc).stk , &operb);
        if ( opera == operb ){
            (*proc).mem_ind = (*proc).mem_begin + label;
        }
        else{
            (*proc).mem_ind += sizeof(int);
        }
        //printf("jump to %d\n", label);
        break;

    case jle:
        (*proc).mem_ind++;
        label = *(int*)((*proc).mem_ind);
        status = stpop( & (*proc).stk , &opera);
        status = stpop( & (*proc).stk , &operb);
        if ( operb <= opera ){
            (*proc).mem_ind = (*proc).mem_begin + label;
        }
        else{
            (*proc).mem_ind += sizeof(int);
        }
        //printf("jump to %d\n", label);
        break;

    case jl:
        (*proc).mem_ind++;
        label = *(int*)((*proc).mem_ind);
        status = stpop( & (*proc).stk , &opera);
        status = stpop( & (*proc).stk , &operb);
        if ( operb < opera ){
            (*proc).mem_ind = (*proc).mem_begin + label;
        }
        else{
            (*proc).mem_ind += sizeof(int);
        }
        //printf("jump to %d\n", label);
        break;

    case jmp:
        (*proc).mem_ind++;
        label = *(int*)((*proc).mem_ind);
        (*proc).mem_ind = (*proc).mem_begin + label;
        //printf("jump to %d\n", label);
        break;

    case call:
        (*proc).mem_ind++;
        label = *(int*)((*proc).mem_ind);
        (*proc).mem_ind += sizeof(int);
        opera = (processor_datatype)((*proc).mem_ind - (*proc).mem_begin);
        //printf("call from %d\n", (int)opera);
        status = stpush( & (*proc).retStk , &opera);
        (*proc).mem_ind = (*proc).mem_begin + label;

        //printf("jump to %d\n", label);
        break;

    case ret:
        (*proc).mem_ind++;
        status = stpop( & (*proc).retStk , &opera);
        label = (int)opera;
        //printf("ret to %d\n", label);
        (*proc).mem_ind = (*proc).mem_begin + label;
        //printf("jump to %d\n", label);
        break;

    default:
        (*proc).mem_ind++;
        status = WRONG_CODE_ERR;
        //printf("WRONG OPERATION CODE");
    }
    return(status);
}


void RUN(CPU* proc){
    int exitcode = 0;
    FILE* fp = fopen("proc_runlog.log", "w");
    (*proc).mem_ind = (*proc).mem_begin;
    while(exitcode >= 0){
        exitcode = makeStep(proc);
        #ifdef DEBUG
        fprintf(fp, "%d\n", exitcode);
        if(exitcode != END_PROG && exitcode != OPERATION_OK){
            fprintf(stderr, "operation returned %d\n", exitcode);
        }
        #else
        #ifndef NO_CONTROL
            if(exitcode != END_PROG && exitcode != OPERATION_OK){
                fprintf(stderr, "operation returned %d\n", exitcode);
                exit(1);
            }
        #endif
        #endif

    }
fclose(fp);
}

bool prok(CPU* proc){
    assert(proc);
    (*proc).ok = (*proc).mem_ind && (*proc).mem_begin && (*proc).mem_begin <= (*proc).mem_ind
    && stok(&(*proc).stk) && stok(&(*proc).retStk) && (*proc).reg && (*proc).reg_num >= 0;
    return ((*proc).ok);

}

char* prdump(CPU* proc){
    assert(proc);
    char logstr[PROC_DUMP_LEN] = {};
    FILE* dumpfile = fopen("processor_dump.txt","w");
    char* s = logstr;

    if( prok(proc) ){
        s += sprintf(s, "processor state: OK\n");

    }
    else{
        s += sprintf(s, "processor state: BROKEN\n");

    }
    /*
    if((*proc).reg_num >= 0 && (*proc).reg){
        printf("dumping register\n");
        s += sprintf(s, "register number %d\nregister contains:\n", (*proc).reg_num);
        for(int i = 0; i < (*proc).reg_num; i++){
            assert((*proc).reg_num);
            s += sprintf(s, DATATYPE_SIGN, (*proc).reg[i]);
            *s = '\n';
            s++;
        }
    }
    else{
        s += sprintf(s, "register number broken\n");

    }
     */
    s += sprintf(s, "program memory beginning: %d\n", (*proc).mem_begin);


    s += sprintf(s, "program memory current index: %d\n", (*proc).mem_ind);
    //printf("dumping stack\n");
    s += sprintf(s, "\n now stack dump \n \n");

    s += sprintf(s,"%s",stdump(&(*proc).stk));

    s += sprintf(s, "\n now return stack dump \n \n");

    s += sprintf(s,"%s",stdump(&(*proc).retStk));

    fprintf(dumpfile, "%s", logstr);
    fclose(dumpfile);

    return (logstr);
}

#endif
