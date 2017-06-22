#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

#define MAX_ID_LEN


#ifndef _LEXAN
#define _LEXAN
enum lexem_types
{
    NUM = 1,
    ID,
    CHAR,
    BRACKET,
    OP_MUL,
    OP_DIV,
    OP_ADD,
    OP_SUB,
    OP_POW,
    OP_SQRT,
    OP_SIN,
    OP_COS,
    OP_ABS,
    OP_LE,
    OP_EQ,
    OP_L,
    OP_M,
    OP_NE,
    OP_ME,
    OP_ASS,
    OP_IN,
    OP_OUT,
    OP_IF,
    OP_WHL,
    OP_SEP,
    OP_ASM,
    ARG_SEP,
    FUNC_DEF,
    OP_RET,
    OP_INCL
};

struct lexem
{
    lexem* prev = 0;
    lexem* left = 0;
    int type = 0;
    int num = 0;
    char* content = 0;
    lexem* right = 0;
    lexem* next = 0;
} ;

lexem* new_lexem(int type, char* content);
bool isHead(lexem* lx);
bool isTail(lexem* lx);
void connect(lexem* prev, lexem* next);
void connect_left(lexem* target, lexem* source);
void connect_right(lexem* target, lexem* source);
void skip_comment();
lexem* get_num();
lexem* get_id();
lexem* get_chr();
lexem* get_brk();
char* dump(lexem* lx);
void expand_lex_type(lexem* lx);
lexem* go_parse(char* s);
int type(lexem* lx);
const char* content(lexem* lx);
bool is_bin_op(lexem* lx);
bool is_unary(lexem* lx);


#include "lexem_an.c"

#endif













