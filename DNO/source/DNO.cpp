#include <stdio.h>
#include <string.h>
#include <stdlib.h>


int main(int argc, char* argv[])
{
    char* ch = 0;
    if(argc > 1)
    {
        char resname[1000] = {};
        strcpy(resname, argv[1]);
        char* point = strrchr(resname, '.');
        if(!point)
        {
            point = resname + strlen(resname);
        }
        char cmd[1000] = {};
        system("color 07");
        sprintf(cmd, "C:/Users/Alex/Documents/programming/ccodes/DNO/bin/front_end %s", resname);
        system((const char*)cmd);

        sprintf(point, ".ast");
        sprintf(cmd, "C:/Users/Alex/Documents/programming/ccodes/DNO/bin/middle_end %s", resname);
        system((const char*)cmd);

        sprintf(point, ".ast");
        sprintf(cmd, "C:/Users/Alex/Documents/programming/ccodes/DNO/bin/back_end %s", resname);
        system((const char*)cmd);

        sprintf(point, ".asm");
        sprintf(cmd, "C:/Users/Alex/Documents/programming/ccodes/DNO/bin/assembler %s", resname);
        system((const char*)cmd);
    }
    else
    {
        printf("no arguments");
        scanf("%s", ch);
    }
    return 0;
}
