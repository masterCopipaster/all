#include "translator.h"

int main(int argc, char* argv[])
{
    if(argc > 1)
    {
        lexem* ast = load(argv[1]);
        //create filename
        char resname[100] = {};
        strcpy(resname, argv[1]);
        char* point = strrchr(resname, '.');
        if(!point)
        {
            point = resname + strlen(resname);
        }
        sprintf(point, ".asm");
        ///////////////////
        ast_to_asm(resname, ast);
        //print_var_table();
    }
    return 0;
}


