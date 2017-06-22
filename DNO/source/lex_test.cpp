#include "translator.h"

int main()
{
    char s[100] = "if(in(0)) { a = out(10101);};";
    lexem* res = go_parse(s);
    lexem* ast = get_pr(res);
    ast_save("ast.txt", ast);
    ast = load("ast.txt");
    dot_dump("asd.txt", ast);
    ast_to_asm("asm.txt", ast);
    return 0;
}
