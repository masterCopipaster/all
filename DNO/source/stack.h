/*! \file stack.h
    \brief Stack structure and functions.

    Details.
*/

#ifndef STACKH
#define NDEBUG
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <assert.h>
#define STACKH

#define STACK_OVF_ERR 1
#define OK_CHECK_ERR 2
#define NO_MEMORY_ERR 3
#define OPERATION_OK 0
#define EMP_STACK_READING 4

#define STACK_DUMP_LENGTH 100
#define TRACE_SYMBOLS_NUM 1000
#define STACK_EXPECTED_DATATYPE "%lg\n"

/**
    /Stack structure
*/
struct Stack {
    unsigned long length = 0;
    unsigned long max_len = 0;
    bool ok = false;
    stack_datatype* data;
};

/**
    /Stack constructor
*/

Stack getStack(long len){
    assert(len);
    Stack res;
    res.data = (stack_datatype*) calloc((size_t)len, sizeof(stack_datatype));

    if (res.data != NULL){
        res.max_len = len;
        res.ok = true;
    }

    return (res);
}

void burnStack(Stack* st){
    assert(*st);
    free((*st).data);
    (*st).ok = false;
    (*st).length = -1;
    (*st).max_len = 0;
    delete st;
}

/**
Function to resize stack
*/

int resizeStack(Stack* st, int new_len){
    assert(st);
    assert(new_len);
    stack_datatype* ptr = (stack_datatype*) realloc((*st).data, sizeof(stack_datatype) * new_len);
    if (ptr != NULL && (*st).ok){
        (*st).max_len = new_len;
        (*st).data = ptr;
        return (OPERATION_OK);
    }
    else{
        if (ptr == NULL){
            return (NO_MEMORY_ERR);
        }
        if (!(*st).ok){
            return (OK_CHECK_ERR);
        }

    }
    assert(0);
}

/**
    /Stack push function
*/

inline int stpush(Stack* st, stack_datatype* element){
    assert(st);
    assert(element);

    if ((*st).length < (*st).max_len && (*st).ok){

        *( (*st).data + (*st).length ) = *element;
        (*st).length++;
        return (OPERATION_OK);

    }
    else{

        if (!(*st).ok){
            return (OK_CHECK_ERR);
        }
        if ((*st).length >= (*st).max_len){
            return (STACK_OVF_ERR);
        }

    }
    assert(0);
}

/**
    /Stack pop function
*/

inline int stpop(Stack* st, stack_datatype* ptr){
    assert(st);
    assert(ptr);
    if ((*st).length > 0 && (*st).ok){

        * ptr = * ((*st).data + (*st).length - 1);
        (*st).length--;
        return (OPERATION_OK);

    }
    else{
        if (!(*st).ok){
            return (OK_CHECK_ERR);
        }
        if ((*st).length <= 0){
            return (EMP_STACK_READING);
        }
    }
    assert(0);
}

/**
    /Verificator
*/
inline bool stok(Stack* st){
    assert(st);
    (*st).ok = (*st).length >= 0 && (*st).length <= (*st).max_len && (*st).data > 0 && sizeof(stack_datatype) > 0;
    return ( (*st).ok );
}
/**
    /it is dump, dumb
*/
char* stdump(Stack* st){
    assert(st);
    char logstr[TRACE_SYMBOLS_NUM]={};
    char* s = logstr;
    FILE* dumpfile = fopen("stack_dump.txt","w");
    bool state = stok(st);
    if ( state) {
        //fprintf(dumpfile, "Stack state: OK\n");
        s += sprintf(s, "Stack state: OK\n");
    }
    else{
        //fprintf(dumpfile, "Stack state: BROKEN\n");
        s += sprintf(s, "Stack state: BROKEN\n");
    }
    //fprintf(dumpfile, "stack length: %d, stack max length: %d\n", (*st).length, (*st).max_len);
    s += sprintf(s, "stack length: %d, stack max length: %d\n", (*st).length, (*st).max_len);
    //fprintf(dumpfile, "element size: %d\n", sizeof(stack_datatype));
    s += sprintf(s, "element size: %d\n", sizeof(stack_datatype));
    if( (*st).length >= 0){
        for( int i = 0; i < (*st).length; i++){
            s += sprintf(s, STACK_EXPECTED_DATATYPE, *(stack_datatype*)((*st).data+sizeof(stack_datatype)*i));
        }
    }
    else{
        s += sprintf(s,"Stack length lost! Dumping STACK_DUMP_LENGTH elements.\n");
        for( int i = 0; i < STACK_DUMP_LENGTH; i++){
            s += sprintf(s, STACK_EXPECTED_DATATYPE, *(stack_datatype*)((*st).data+sizeof(stack_datatype)*i));
        }
    }

    fprintf(dumpfile, "%s", logstr);
    fclose(dumpfile);
    return (logstr);

}

#endif
