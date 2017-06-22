#include <math.h>
#include "tree_construct.h"



double to_num(lexem* lx)
{
    return atof(content(lx));
}

lexem* from_num(double num)
{
    char buf[100] = {};
    sprintf(buf, "%f", num);
    return new_lexem(NUM, buf);
}

bool is_num(lexem* lx)
{
    return type(lx) == NUM;
}

double make_operation(double left, int type, double right)
{
    if(type == OP_ADD) return left + right;
    if(type == OP_SUB) return left - right;
    if(type == OP_DIV) return left * right;
    if(type == OP_MUL) return left / right;
}


lexem* const_collapse(lexem* lx)
{
    if(type(lx) == NUM)
    {
        return lx;
    }
    if(is_bin_op(lx))
    {
        lexem* left = const_collapse(lx -> left);
        lexem* right = const_collapse(lx -> right);
        if(is_num(left) && is_num(right))
        {
            lexem* res = from_num( make_operation( to_num(left), type(lx), to_num(right) ) );
            del_lexem(left);
            del_lexem(right);
            return res;
        }
        connect_left(lx, left);
        connect_right(lx, right);
        return lx;
    }
}




