#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>


#include "lexem_anal.h"

lexem* _cur = 0;
lexem* get_pr(lexem* sq);
lexem* get_seq();
lexem* get_bas();
lexem* get_ass();
lexem* get_if();
lexem* get_whl();
lexem* get_op();
lexem* get_el();
lexem* get_exp();
lexem* get_md();
lexem* get_prm();
lexem* get_pow();
lexem* get_un();
lexem* get_asm();
lexem* get_out();
lexem* get_func_def();
lexem* get_arg_list();
lexem* get_arg_seq();
lexem* get_call();
lexem* get_ret();


void move()
{
    if(_cur)
    {
        _cur = _cur -> next;
    }
}

lexem* get_pr(lexem* sq)
{
    _cur = sq;
    lexem* res = get_seq();
    if(type(_cur) == 0)
    {
        return res;
    }
    else
    {
        fprintf(stderr, "error: syntax error %s\n", content(_cur));
        return 0;
    }
}

lexem* get_seq()
{
    //printf("getting operator sequence\n");
    lexem* buf = get_bas();
    if(!buf) return 0;
    lexem* res = _cur;
    if(type(res) == OP_SEP)
    {
        move();
        connect_left(res, buf);
        buf = get_seq();
        connect_right(res, buf);
        return res;
    }
    else
    {
        fprintf(stderr, "error: expected ; , got %s\n", content(_cur));
        return 0;
    }
}

lexem* get_bas()
{
    //printf("getting basic\n");
    lexem* res = get_ass();
    if(!res) res = get_if();
    if(!res) res = get_whl();
    if(!res) res = get_asm();
    if(!res) res = get_out();
    if(!res) res = get_func_def();
    if(!res) res = get_ret();
    if(!res) res = get_call();
    return res;
}

lexem* get_asm()
{
    //printf("getting assembler instruction\n");
    lexem* res = _cur;
    if(type(res) == OP_ASM)
    {
        move();
        lexem* buf = _cur;
        connect_left(res, buf);
        lexem* _buf = 0;
        while(type(buf -> next) != OP_SEP && buf)
        {
            move();
            //printf("asm %s\n", content(buf));
            _buf = _cur;
            connect_left(buf, _buf);
            buf = _buf;
        }
        move();
        return res;
    }
    else
    {
        return 0;
    }
}

lexem* get_func_def()
{
    //printf("getting function definition\n");
    lexem* res = _cur;
    if(type(res) == FUNC_DEF)
    {
        move();
        lexem* buf = _cur;
        if(type(buf) != ID)
        {
            fprintf(stderr, "error: expected ID, got %s\n", content(buf));
            return 0;
        }
        move();
        connect_left(res, buf);
        lexem* res_ = buf;
        buf = get_arg_list();
        connect_left(res_, buf);
        buf = get_op();
        connect_right(res_, buf);
        return res;
    }
    else
    {
        return 0;
    }
}

lexem* get_call()
{
    //printf("getting call %s\n", content(_cur));
    lexem* res = _cur;
    if(type(res) == ID)
    {
        move();
        lexem* buf = get_arg_list();
        if(!buf)
        {
            fprintf(stderr, "error: expected argument list\n");
            return 0;
        }
        connect_left(res, buf);
        return res;
    }
    else
    {
        return 0;
    }
}


lexem* get_arg_list()
{
    //printf("getting arg list\n");
    lexem* buf = _cur;
    if(*content(buf) == '(')
    {
        move();
        lexem* res = get_arg_seq();
        buf = _cur;
        if(*content(buf) == ')')
        {
            move();
            return res;
        }
        else
        {
            fprintf(stderr, "error: expected ), got %s\n", content(buf));
            return 0;
        }
    }
    else
    {
        return 0;
    }
}

lexem* get_arg_seq()
{
    //printf("getting argument sequence\n");
    lexem* buf = get_exp();
    lexem* res = _cur;
    if(type(res) == ARG_SEP)
    {
        move();
        connect_left(res, buf);
        buf = get_arg_seq();
        connect_right(res, buf);
        return res;
    }
    return buf;

}

lexem* get_ret()
{
    //printf("getting output instruction\n");
    lexem* res = _cur;
    if(type(res) == OP_RET)
    {
        move();
        lexem* buf = get_exp();
        if(buf)
        {
            connect_left(res, buf);

        }
        return res;
    }
    else
    {
        return 0;
    }
}


lexem* get_out()
{
    //printf("getting output instruction\n");
    lexem* res = _cur;
    if(type(res) == OP_OUT)
    {
        move();
        lexem* buf = get_prm();
        if(buf)
        {
            connect_left(res, buf);
            return res;
        }
        else
        {
            fprintf(stderr, "error: expected primary expression, got %s\n", content(buf));
            return 0;
        }
    }
    else
    {
        return 0;
    }
}


lexem* get_ass()
{
    //printf("getting ass\n");
    lexem* buf = _cur;
    if(type(buf) == ID)
    {
        //move();
        //lexem* res = _cur;
        if(type(buf -> next) == OP_ASS)
        {
            move();
            lexem* res = _cur;
            move();
            connect_left(res, buf);
            buf = get_exp();
            if(buf)
            {
                connect_right(res, buf);
                return res;
            }
            else
            {
                fprintf(stderr, "error: expected expression\n");
                return 0;
            }
        }
        else
        {
            //fprintf(stderr, "error: expected =, got %s\n", content(res));
            return 0;
        }
    }
    else
    {
        return 0;
    }
}

lexem* get_if()
{
    //printf("getting if\n");
    lexem* res = _cur;
    if(type(res) == OP_IF)
    {
        move();
        lexem* buf = get_prm();
        if(buf)
        {
            connect_left(res, buf);
            buf = get_op();
            if(buf)
            {
                connect_right(res, buf);
                return res;
            }
            else
            {
                fprintf(stderr, "error: expected complex operator\n");
                return 0;
            }
        }
        else
        {
            fprintf(stderr, "error: expected primary expression\n");
            return 0;
        }
    }
    else
    {
        return 0;
    }
}

lexem* get_whl()
{
    //printf("getting while\n");
    lexem* res = _cur;
    if(type(res) == OP_WHL)
    {
        move();
        lexem* buf = get_prm();
        if(buf)
        {
            connect_left(res, buf);
            buf = get_op();
            if(buf)
            {
                connect_right(res, buf);
                return res;
            }
            else
            {
                fprintf(stderr, "error: expected complex operator\n");
                return 0;
            }
        }
        else
        {
            fprintf(stderr, "error: expected primary expression\n");
            return 0;
        }
    }
    else
    {
        return 0;
    }
}

lexem* get_op()
{
    //printf("getting complex operator\n");
    lexem* buf = _cur;
    if(*content(buf) == '{')
    {
        move();
        lexem* res = get_seq();
        buf = _cur;
        if(*content(buf) == '}')
        {
            move();
            return res;
        }
        else
        {
            fprintf(stderr, "error: expected }\n");
            return 0;
        }
    }
    else
    {
        fprintf(stderr, "error: expected {\n");
        return 0;
    }
}

lexem* get_el()
{
    //printf("getting elementary\n");
    lexem* buf = _cur;
    if(type(buf) == ID && *content(buf -> next) != '(' || type(buf) == NUM)
    {
        move();
        return buf;
    }
    else
    {
        buf = get_call();
        if(!buf)
        {
            fprintf(stderr, "error: expected number or id or call, got %s\n", content(buf));
            return 0;
        }
        return buf;
    }
}

lexem* get_exp()
{
    //printf("getting expression\n");
    lexem* buf = get_md();
    lexem* res = _cur;
    if(type(res) == OP_ADD || type(res) == OP_SUB || type(res) == OP_EQ ||type(res) == OP_NE ||
       type(res) == OP_LE || type(res) == OP_L || type(res) == OP_ME || type(res) == OP_M)
    {
        move();
        connect_left(res, buf);
        buf = get_exp();
        connect_right(res, buf);
        return res;
    }
    else
    {
        return buf;
    }
}

lexem* get_md()
{
    //printf("getting */\n");
    lexem* buf = get_pow();
    lexem* res = _cur;
    if(type(res) == OP_MUL || type(res) == OP_DIV)
    {
        move();
        connect_left(res, buf);
        buf = get_md();
        connect_right(res, buf);
        return res;
    }
    else
    {
        return buf;
    }
}

lexem* get_pow()
{
    //printf("getting */\n");
    lexem* buf = get_prm();
    lexem* res = _cur;
    if(type(res) == OP_POW)
    {
        move();
        connect_left(res, buf);
        buf = get_pow();
        connect_right(res, buf);
        return res;
    }
    else
    {
        return buf;
    }
}

lexem* get_prm()
{
    //printf("getting primary expression\n");
    lexem* buf = _cur;
    lexem* res = 0;
    if(*content(buf) == '(')
    {
        move();
        res = get_exp();
        buf = _cur;
        if(*content(buf) == ')')
        {
            move();
            return res;
        }
        else
        {
            fprintf(stderr, "error: expected ), got %s\n", content(buf));
            return 0;
        }
    }
    else
    {
        res = get_un();
        return res;
    }
}

lexem* get_un()
{
    //printf("getting unary\n");
    lexem* res = _cur;
    if(is_unary(res))
    {
        move();
        lexem* buf = get_prm();
        connect_left(res, buf);
        return res;
    }
    else
    {
        res == get_el();
        return res;
    }
}

bool is_final(lexem* lx)
{
    if(lx){
        return !lx -> left && !lx -> right;
    }
    else return 1;
}

void _dot_dump(FILE* file, lexem* lx)
{
    if(!is_final(lx))
    {
        if(content(lx -> left)) fprintf(file, "\"%s\\n[0x%p]\" -> \"%s\\n[0x%p]\"[label = \"L\"]\n", content(lx), lx, content(lx -> left), lx -> left);
        if(content(lx -> right)) fprintf(file, "\"%s\\n[0x%p]\" -> \"%s\\n[0x%p]\"[label = \"R\"]\n", content(lx), lx, content(lx -> right), lx -> right);
        //if(content(lx -> next)) fprintf(file, "\"%s\\n%p\" -> \"%s\\n%p\"[style=dotted, color=blue]\n", content(lx), lx, content(lx -> next), lx -> next);
        _dot_dump(file, lx -> left);
        _dot_dump(file, lx -> right);
    }
}

void dot_dump(char* filename, lexem* lx)
{
    FILE* file = fopen(filename, "w");
    assert(file);
    fprintf(file, "digraph {\n");
    _dot_dump(file, lx);
    fprintf(file, "}");
    fclose(file);
}

void _ast_save(FILE* file, lexem* lx)
{
    if(lx)
    {
        fprintf(file, "< %d %s ", type(lx), content(lx));
        _ast_save(file, lx -> left);
        fprintf(file, " ");
        _ast_save(file, lx -> right);
        fprintf(file, " >");
    }
    else
    {
        fprintf(file, "nil");
    }
}

void ast_save(char* filename, lexem* lx)
{
    FILE* file = fopen(filename, "w");
    _ast_save(file, lx);
    fclose(file);
}

char* readfile(FILE* ptr)
{
  assert(ptr);
  fseek(ptr, 0, SEEK_END);
  size_t fl_len = ftell(ptr);
  rewind(ptr);
  char* res = (char*) calloc( fl_len + 1 , sizeof(char));
  fread((void*) res, sizeof(char), fl_len + 10 , ptr);
  return (res);

}

lexem* _load(FILE* file)
{
    char buf[MAX_ID_LEN] = {};
    int type = 0;
    fscanf(file, "%s", buf);

    if(*buf == '<')
    {
        fscanf(file, "%s", buf);
        type = atoi(buf);
        fscanf(file, "%s", buf);
        lexem* res = new_lexem(type, buf);
        connect_left(res, _load(file));
        connect_right(res, _load(file));
        fscanf(file, "%s", buf);
        if(*buf == '>')
        {
            return res;
        }
        else
        {
            fprintf(stderr, "error: syntax error %s\n", buf);
            exit(228);
        }
    }
    else if(!strcmp(buf, "nil"))
    {
        return 0;
    }
    else
    {
        system("color 0c");
        fprintf(stderr, "error: syntax error %s\n", buf);
        exit(228);
    }
}

lexem* load(char* filename)
{
    FILE* file = fopen(filename, "r");
    if(file)
    {
        return _load(file);
    }
    else
    {
        printf("no such file");
        exit(228);
    }
    fclose(file);
}






















