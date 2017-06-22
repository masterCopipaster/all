#include "tree_convert.h"




lexem* construct_expr_tree(lexem* sq);

int main(int argc, char* argv[])
{
    if(argc > 1)
    {
        int n = 1;
        if(argc > 2)
        {
            n = atoi(argv[2]);
        }
        bool optimise = false;

        if(argc > 3)
        {
            optimise = !strcmp("opt", argv[3]);
        }
        FILE* file = fopen(argv[1], "r");
        char* code = readfile(file);
        lexem* ast = go_parse(code);
        ast = construct_expr_tree(ast);

        char resname[1000] = {};
        strcpy(resname, argv[1]);
        char* point = strrchr(resname, '.');
        if(!point)
        {
            point = resname + strlen(resname);
        }

        sprintf(point, "_final.tex");
        FILE* result = fopen( resname, "w");

        sprintf(point, "_словами.txt");

        FILE* words_result = fopen( resname, "w");

        fprintf(result, "\\documentclass[12pt]{article}\n\\title{DERIVATION", n);
        fprintf(result, "}\n\\author{dermaker v1.0}\n\\date{\\today}\n\\begin{document}\n\\maketitle\n");

        lexem* res = ast;
        expr_dolbaeb_printout(words_result, ast);
        res = start_muldive(res);
        printf("begin\n");
        for(int i = 0; i < n; i++)
        {
            printf("taking %d \n", i+1);
            fprintf(result, "derivation this: \\[\n");
            expr_latex(result, res);
            fprintf(result, "\n\\]getting derivative %d order: \\[\n", i+1);
            res = dif(res);
            //dot_dump("dotdmp.dot", res);
            expr_latex(result, res);
            fprintf(result, "\n\\]\n");
            if(optimise)
            {
                fprintf(result, "collapsing constants: \\[\n");
                res = const_collapse(res);
                expr_latex(result, res);
                fprintf(result, "\n\\]dropping nulls and etc...: \\[\n");
                res = simplifise(res);
                res = const_collapse(res);
                res = simplifise(res);
                res = const_collapse(res);
                expr_latex(result, res);
                fprintf(result, "\n\\]using diving algorytm: \\[\n");
                res = start_muldive(res);
                res = simplifise(res);
                res = start_muldive(res);
                res = simplifise(res);
                res = const_collapse(res);
                expr_latex(result, res);
                fprintf(result, "\n\\]\n");
            }
        }

        if(!optimise)
        {
                fprintf(result, "collapsing constants: \\[\n");
                res = const_collapse(res);
                expr_latex(result, res);
                fprintf(result, "\n\\]dropping nulls and etc...: \\[\n");
                res = simplifise(res);
                res = const_collapse(res);
                res = simplifise(res);
                res = const_collapse(res);
                expr_latex(result, res);
                fprintf(result, "\n\\]using diving algorytm: \\[\n");
                res = start_muldive(res);
                res = simplifise(res);
                res = const_collapse(res);
                expr_latex(result, res);
                fprintf(result, "\n\\]\n");
        }

        fprintf(result, "As result: \\[\n");
        expr_latex(result, res);

        fprintf(result, "\n\\]\n\\end{document}");

        /*
        lexem* res = 0;

        res = dif(ast);

        expr_printout(result, res);
        putc('\n', result);

        res = const_collapse(res);
        expr_printout(result, res);
        putc('\n', result);

        res = simplifise(res);
        expr_printout(result, res);
        putc('\n', result);

        res = const_collapse(res);
        expr_latex(result, res);
 */


    }
    return 0;
}

lexem* construct_expr_tree(lexem* sq)
{
    _cur = sq;
    lexem* res = get_exp();
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
