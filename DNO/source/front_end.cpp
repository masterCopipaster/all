#include "tree_construct.h"

int main(int argc, char* argv[])
{
    if(argc > 1)
    {
        FILE* file = fopen(argv[1], "r");
        if(file)
        {
            char* code = readfile(file);
            lexem* ast = go_parse(code);
            ast = get_pr(ast);
            char resname[100] = {};
            strcpy(resname, argv[1]);
            char* point = strrchr(resname, '.');
            if(!point)
            {
                point = resname + strlen(resname);
            }
            sprintf(point, ".ast");
            ast_save(resname, ast);
            sprintf(point, ".dot");
            dot_dump(resname, ast);
        }
    }
    return 0;
}


