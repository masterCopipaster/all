#include <math.h>
#include "tree_construct.h"

lexem* muldive(lexem*, double*);
lexem* start_muldive(lexem*);

double to_num(lexem* lx)
{
    return atof(content(lx));
}

lexem* from_num(double num)
{
    char buf[100] = {};
    sprintf(buf, "%g", num);
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
    if(type == OP_DIV) return left / right;
    if(type == OP_MUL) return left * right;
    if(type == OP_POW) return pow(left, right);
}

void precalc(lexem* lx)
{
    if(type(lx) == OP_ADD || type(lx) == OP_MUL)
    {
        if(type(lx -> left) == NUM && type(lx -> right) == type(lx))
        {
            lexem* node = lx -> right;
            if(type(node -> left) == NUM)
            {
                connect_left(lx, from_num(make_operation(to_num(lx -> left), type(node), to_num(node -> left))));
                connect_right(lx, node -> right);
            }

            if(type(node -> right) == NUM)
            {
                connect_left(lx, from_num(make_operation(to_num(lx -> left), type(node), to_num(node -> right))));
                connect_right(lx, node -> left);
            }
            precalc(lx);
        }
        if(type(lx -> right) == NUM && type(lx -> left) == type(lx))
        {
            lexem* node = lx -> left;
            if(type(node -> left) == NUM)
            {
                connect_left(lx, from_num(make_operation(to_num(lx -> right), type(node), to_num(node -> left))));
                connect_right(lx, node -> right);
            }

            if(type(node -> right) == NUM)
            {
                connect_left(lx, from_num(make_operation(to_num(lx -> right), type(node), to_num(node -> right))));
                connect_right(lx, node -> left);
            }
            precalc(lx);
        }

    }
}

lexem* muldive(lexem* lx, double* multiplexor)
{
    if(type(lx) == OP_MUL)
    {
        if(type(lx -> left) == NUM)
        {
            *multiplexor *= to_num(lx -> left);
            return muldive(lx -> right, multiplexor);
        }
        if(type(lx -> right) == NUM)
        {
            *multiplexor *= to_num(lx -> right);
            return muldive(lx -> left, multiplexor);
        }
        if(type(lx -> left) == OP_MUL) connect_left(lx, muldive(lx -> left, multiplexor));
        if(type(lx -> right) == OP_MUL) connect_right(lx, muldive(lx -> right, multiplexor));
        return lx;
    }
    return start_muldive(lx);

}

lexem* start_muldive(lexem* lx)
{
    if(type(lx) == OP_MUL)
    {
        lexem* res = new_lexem(OP_MUL, "*");
        double ml = 1;
        connect_right(res, muldive(lx, &ml));
        connect_left(res, from_num(ml));
        return res;
    }
    if(lx -> left) connect_left(lx, start_muldive(lx -> left));
    if(lx -> right) connect_right(lx, start_muldive(lx -> right));
    return lx;
}






lexem* const_collapse(lexem* lx)
{
    //if(is_unary(lx)) return lx;
    if(is_final(lx))
    {
        return lx;
    }
    lexem* left = 0;
    lexem* right = 0;
    if(lx -> left) left = const_collapse(lx -> left);
    if(lx -> right) right = const_collapse(lx -> right);
    if(is_bin_op(lx))
    {
        if(is_num(left) && is_num(right))
        {
            lexem* res = from_num( make_operation( to_num(left), type(lx), to_num(right) ) );
            //del_lexem(left);
            //del_lexem(right);
            return res;
        }
    }
    if(lx -> left) connect_left(lx, left);
    if(lx -> right) connect_right(lx, right);
    return lx;
}

bool is_equal(double v1, double v2)
{
    return abs(v1 - v2) < 1E-6;
}


lexem* simplifise(lexem* lx)
{

    lexem* res = lx;
    if(res -> left)  connect_left (res, simplifise(res -> left));
    if(res -> right) connect_right(res, simplifise(res -> right));

    if(type(res) == OP_ADD)
    {
        if(type(res -> left) == NUM)
        if(is_equal(to_num(res -> left), 0))
        return res -> right;

        if(type(res -> right) == NUM)
        if(is_equal(to_num(res -> right), 0))
        return res -> left;
    }

    if(type(res) == OP_SUB)
    {
        if(type(res -> right) == NUM)
        if(is_equal(to_num(res -> right), 0))
        return res -> left;
    }

    if(type(res) == OP_MUL)
    {
        if(type(res -> left) == NUM)
        if(is_equal(to_num(res -> left), 0))
        return new_lexem(NUM, "0");

        if(type(res -> right) == NUM)
        if(is_equal(to_num(res -> right), 0))
        return new_lexem(NUM, "0");
    }

    if(type(res) == OP_MUL)
    {
        if(type(res -> left) == NUM)
        if(is_equal(to_num(res -> left), 1))
        return res -> right;

        if(type(res -> right) == NUM)
        if(is_equal(to_num(res -> right), 1))
        return res -> left;
    }

    if(type(res) == OP_DIV)
    {
        if(type(res -> left) == NUM)
        if(is_equal(to_num(res -> left), 0))
        return new_lexem(NUM, "0");
    }

    if(type(res) == OP_DIV)
    {
        if(type(res -> right) == NUM)
        if(is_equal(to_num(res -> right), 1))
        return res -> left;
    }

    if(type(res) == OP_POW)
    {
        if(type(res -> right) == NUM)
        if(is_equal(to_num(res -> right), 1))
        return res -> left;
    }

    if(type(res) == OP_POW)
    {
        if(type(res -> right) == NUM)
        if(is_equal(to_num(res -> right), 0))
        return new_lexem(NUM, "1");
    }
    //printf("simplifised\n");
    return res;
}









lexem* dif(lexem* lx)
{
    lexem* res = lx;

    if(is_num(lx))
    {
        res = new_lexem(NUM, "0");
    }

    if(type(lx) == ID)
    {
        res = new_lexem(NUM, "1");
    }

    if(type(lx) == OP_ADD)
    {
        res = new_lexem(OP_ADD, "+");
        connect_left(res, dif(lx -> left));
        connect_right(res, dif(lx -> right));
    }

    if(type(lx) == OP_SUB)
    {
        res = new_lexem(OP_SUB, "-");
        connect_left(res, dif(lx -> left));
        connect_right(res, dif(lx -> right));
    }

    if(type(lx) == OP_POW)
    {
        res = new_lexem(OP_MUL, "*");
        connect_left(res, dif(lx -> left));
        lexem* ml = new_lexem(OP_MUL, "*");
        lexem* pw = copy(lx);
        connect_right(res, ml);
        connect_left(ml, lx -> right);
        connect_right(ml, pw);
        lexem* sb = new_lexem(OP_SUB, "-");
        connect_left(sb, lx -> right);
        connect_right(sb, from_num(1));
        connect_right(pw, sb);
    }

    if(type(lx) == OP_MUL)
    {
        res = new_lexem(OP_ADD, "+");

        lexem* mul1 = new_lexem(OP_MUL, "*");
        connect_left(mul1, lx -> left);
        connect_right(mul1, dif(lx -> right));

        lexem* mul2 = new_lexem(OP_MUL, "*");
        connect_left(mul2, lx -> right);
        connect_right(mul2, dif(lx -> left));

        connect_left(res, mul1);
        connect_right(res, mul2);
    }


    if(type(lx) == OP_DIV)
    {
        lexem* sb = new_lexem(OP_SUB, "-");

        lexem* mul1 = new_lexem(OP_MUL, "*");
        connect_left(mul1, lx -> left);
        connect_right(mul1, dif(lx -> right));

        lexem* mul2 = new_lexem(OP_MUL, "*");
        connect_left(mul2, lx -> right);
        connect_right(mul2, dif(lx -> left));

        connect_left(sb, mul2);
        connect_right(sb, mul1);

        lexem* sqr = new_lexem(OP_POW, "^");
        connect_left(sqr, lx -> right);
        connect_right(sqr, from_num(2));

        res = new_lexem(OP_DIV, "/");
        connect_left(res, sb);
        connect_right(res, sqr);
    }

    if(type(lx) == OP_COS)
    {
        res = new_lexem(OP_MUL, "*");
        connect_left(res, dif(lx -> left));
        lexem* ml = new_lexem(OP_MUL, "*");
        lexem* sn = new_lexem(OP_SIN, "sin");
        connect_right(res, ml);
        connect_left(ml, from_num(-1));
        connect_right(ml, sn);
        connect_left(sn, copy(lx -> left));
    }

    if(type(lx) == OP_SIN)
    {
        res = new_lexem(OP_MUL, "*");
        connect_left(res, dif(lx -> left));
        lexem* cs = new_lexem(OP_COS, "cos");
        connect_right(res, cs);
        connect_left(cs, copy(lx -> left));
    }

    return res;
}

int prioritet(lexem* lx)
{
    if(type(lx) == OP_ADD || type(lx) == OP_SUB) return 1;
    if(type(lx) == OP_MUL || type(lx) == OP_DIV) return 2;
    if(type(lx) == OP_POW) return 3;
    return 4;
}


void expr_printout(FILE* file, lexem* lx)
{
    if(is_bin_op(lx) || is_final(lx) || is_unary(lx))
    {
        if(lx -> right)
        {
            if(prioritet(lx) > prioritet(lx -> right))
            {
                putc('(', file);
                expr_printout(file, lx -> right);
                putc(')', file);
            }
            else expr_printout(file, lx -> right);
        }
        fprintf(file, "%s ", content(lx));
        if(lx -> left)
        {
            if(prioritet(lx) > prioritet(lx -> left))
            {
                putc('(', file);
                expr_printout(file, lx -> left);
                putc(')', file);
            }
            else expr_printout(file, lx -> left);
        }


    }
}


char* dolbaeb_content(lexem* lx)
{
    if(type(lx) == OP_MUL) return "умножить на ";
    else if(type(lx) == OP_DIV) return "делить на ";
    else if(type(lx) == OP_ADD) return "плюс ";
    else if(type(lx) == OP_SUB) return "минус ";
    else if(type(lx) == OP_SIN) return "синус ";
    else if(type(lx) == OP_COS) return "косинус ";
    else if(type(lx) == OP_POW) return "в степени ";
    else if(type(lx) == ID) return "ИКС ";
    else return (char*)content(lx);
}

void expr_dolbaeb_printout(FILE* file, lexem* lx)
{
    if(is_bin_op(lx) || is_final(lx) || is_unary(lx))
    {

        if(lx -> right)
        {
            if(prioritet(lx) > prioritet(lx -> right))
            {
                fprintf(file, "скобка открывается ");
                expr_dolbaeb_printout(file, lx -> right);
                fprintf(file, "скобка закрывается ");
            }
            else expr_dolbaeb_printout(file, lx -> right);
        }
        fprintf(file, "%s ", dolbaeb_content(lx));
        if(lx -> left)
        {
            if(prioritet(lx) > prioritet(lx -> left))
            {
                fprintf(file, "скобка открывается ");
                expr_dolbaeb_printout(file, lx -> left);
                fprintf(file, "скобка закрывается ");
            }
            else expr_dolbaeb_printout(file, lx -> left);
        }


    }
}

void expr_latex(FILE* file, lexem* lx)

{
    if(is_bin_op(lx) || is_final(lx))
    {
        if(type(lx) == OP_DIV)
        {
            fprintf(file, "\\frac{");
            expr_latex(file, lx -> left);
            fprintf(file, "}{");
            expr_latex(file, lx -> right);
            putc('}', file);
            return;
        }
        if(lx -> left)
        {
            if(prioritet(lx) > prioritet(lx -> left))
            {
                putc('{', file); putc('(', file);
                expr_latex(file, lx -> left);
                putc(')', file); putc('}', file);
            }
            else
            {
            putc('{', file);
            expr_latex(file, lx -> left);
            putc('}', file);
            }
        }
        fprintf(file, "%s", content(lx));
        if(lx -> right)
        {
            if(prioritet(lx) > prioritet(lx -> right))
            {
                putc('{', file); putc('(', file);
                expr_latex(file, lx -> right);
                putc(')', file); putc('}', file);
            }
            else
            {
            putc('{', file);
            expr_latex(file, lx -> right);
            putc('}', file);
            }
        }
    }
    if(is_unary(lx))
    {
        //printf("printing unary\n");
        fprintf(file, "\\%s", content(lx));
        if(lx -> left)
        {
            //printf("goind left\n");

                putc('{', file); putc('(', file);
                expr_latex(file, lx -> left);
                putc(')', file); putc('}', file);

        }
    }
}







