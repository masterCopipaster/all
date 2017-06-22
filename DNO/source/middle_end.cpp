#include "tree_convert.h"

int main(int argc, char* argv[])
{
    //printf("middle end\n");
    if(argc > 1)
    {

        //loading and optimising
        lexem* ast = load(argv[1]);
        ast = const_collapse(ast);
        //printf("optimised\n");
        //create filename
        char resname[1000] = {};
        strcpy(resname, argv[1]);
        char* point = strrchr(resname, '.');
        if(!point)
        {
            point = resname + strlen(resname);
        }
        //saving dot and ast
        sprintf(point, "_final.dot");
        //printf("dotting\n");
        dot_dump(resname, ast);
        //printf("dotted\n");
        ///////////////////
        sprintf(point, ".ast");
        ast_save(resname, ast);
        //printf("saved\n");
        //print_var_table();
    }
    return 0;
}

