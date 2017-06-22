#ifndef LEXANC
#define LEXANC



lexem* new_lexem(int type, char* content)
{
    lexem* res = (lexem*) calloc(1, sizeof(lexem));
    res -> content = (char*) calloc(strlen(content) + 1, sizeof(char));
    strcpy(res -> content, content);
    res -> type = type;
    return res;
}

void del_lexem(lexem* lx)
{
    free((void*)content(lx));
    free((void*)lx);
}

lexem* copy(lexem* lx)
{
    lexem* res = (lexem*) calloc(1, sizeof(lexem));
    memcpy(res, lx, sizeof(lexem));
    return res;
}


bool isHead(lexem* lx)
{
    return !(lx -> prev);
}

bool isTail(lexem* lx)
{
    return !(lx -> next);
}

void connect(lexem* prev, lexem* next)
{
    assert(prev != 0);
    assert(next != 0);
    //lexem* lp = prev -> prev;
    lexem* rp = next -> prev;
    lexem* ln = prev -> next;
    //lexem* rn = next -> next;
    //printf("con");
    next -> prev = prev;

                                                        //--------------------------------------------//
    prev -> next = next;                                //      _       _#_#_   __     __     __      //
    /*                                                  //     | |     |  ___|  \ \   / /    /  \     //
    printf("nect\n");                                   //     | |     | |___    \ \_/ /    / /\ \    //
    if(isTail(next))                                    //     | |     |  ___|    | _ |    |  __  |   //
    {                                                   //     | |___  | |___    / / \ \   | |  | |   //
        next -> next = ln;                              //     |_____| |_____|  /_/   \_\  |_|  |_|   //
        if(!isTail(prev)) ln -> prev = next;            //--------------------------------------------//
    }

    if(isHead(prev))
    {
        prev -> prev = rp;
        if(!isHead(next)) rp -> next = prev;
    } */
}

void connect_left(lexem* target, lexem* source)
{
    target -> left = source;
}

void connect_right(lexem* target, lexem* source)
{
    target -> right = source;
}

char* _s = 0;
int _curn = 0;

void skip_comment()
{
    if(*_s == '/' && *(_s+1) == '/')
    {
        _s += 2;
        while(*_s != '\n')
        {
            _s++;
        }
    }
}


lexem* get_num()
{
    while(isspace(*_s))
    {
        _s++;
    }
    skip_comment();
    char* s0 = _s;
    while(isdigit(*_s))
    {
        _s++;
    }
    if(*_s == '.')
    {
        _s++;
        while(isdigit(*_s))
        {
            _s++;
        }
    }
    if(s0 != _s)
    {
        char buf = *_s;
        *_s = '\0';
        lexem* res = new_lexem(NUM, s0);
        *_s = buf;
        return res;
    }
    else
    {
        return 0;
    }
}

lexem* get_id()
{
    while(isspace(*_s))
    {
        _s++;
    }
    skip_comment();
    char* s0 = _s;
    while(isdigit(*_s) || isupper(*_s) || islower(*_s) || *_s == '_')
    {
        _s++;
    }
    if(s0 != _s)
    {
        char buf = *_s;
        *_s = '\0';
        lexem* res = new_lexem(ID, s0);
        *_s = buf;
        return res;
    }
    else
    {
        return 0;
    }
}

lexem* get_chr()
{
    while(isspace(*_s))
    {
        _s++;
    }
    skip_comment();
    char* s0 = _s;
    while(ispunct(*_s) && *_s != '(' && *_s != '{' && *_s != '[' && *_s != ')' && *_s != '}' && *_s != ']')
    {
        _s++;
    }
    if(s0 != _s)
    {
        char buf = *_s;
        *_s = '\0';
        lexem* res = new_lexem(CHAR, s0);
        *_s = buf;
        return res;
    }
    else
    {
        return 0;
    }
}

lexem* get_brk()
{
    while(isspace(*_s))
    {
        _s++;
    }
    skip_comment();
    char* s0 = _s;
    if(*_s == '(' || *_s == '{' || *_s == '[' || *_s == ')' || *_s == '}' || *_s == ']')
    {
        _s++;
        char buf = *_s;
        *_s = '\0';
        lexem* res = new_lexem(BRACKET, s0);
        *_s = buf;
        return res;
    }
    else
    {
        return 0;
    }
}


char* dump(lexem* lx)
{
    char* res = (char*) calloc(strlen(lx -> content) + 5, sizeof(char));
    strcpy(res, lx -> content);
    sprintf(res + strlen(lx -> content), " %d", lx -> type);
    return res;
}

char* get_str()
{
    char* res = 0;
    while(isspace(*_s))
    {
        _s++;
    }
    skip_comment();
    if(*_s == '\"')
    {
        char* s0 = _s + 1;
        while(*_s != '\"' && *_s)
        {
            _s++;
        }
        char buf = *_s;
        *_s = '\0';
        res = (char*) calloc(strlen(s0) + 1, sizeof(char));
        strcpy(res, s0);
        *_s = buf;
    }
    return res;
}




void expand_lex_type(lexem* lx)
{
    if(!strcmp(lx -> content, "*")) lx -> type = OP_MUL;
    if(!strcmp(lx -> content, "+")) lx -> type = OP_ADD;
    if(!strcmp(lx -> content, "-")) lx -> type = OP_SUB;
    if(!strcmp(lx -> content, "/")) lx -> type = OP_DIV;
    if(!strcmp(lx -> content, "^")) lx -> type = OP_POW;
    if(!strcmp(lx -> content, "<=")) lx -> type = OP_LE;
    if(!strcmp(lx -> content, ">=")) lx -> type = OP_ME;
    if(!strcmp(lx -> content, "=")) lx -> type = OP_ASS;
    if(!strcmp(lx -> content, "!=")) lx -> type = OP_NE;
    if(!strcmp(lx -> content, "==")) lx -> type = OP_EQ;
    if(!strcmp(lx -> content, "<")) lx -> type = OP_L;
    if(!strcmp(lx -> content, ">")) lx -> type = OP_M;
    if(!strcmp(lx -> content, "sin")) lx -> type = OP_SIN;
    if(!strcmp(lx -> content, "sqrt")) lx -> type = OP_SQRT;
    if(!strcmp(lx -> content, "cos")) lx -> type = OP_COS;
    if(!strcmp(lx -> content, "in")) lx -> type = OP_IN;
    if(!strcmp(lx -> content, "out")) lx -> type = OP_OUT;
    if(!strcmp(lx -> content, "if")) lx -> type = OP_IF;
    if(!strcmp(lx -> content, "while")) lx -> type = OP_WHL;
    if(!strcmp(lx -> content, ";")) lx -> type = OP_SEP;
    if(!strcmp(lx -> content, "ASM")) lx -> type = OP_ASM;
    if(!strcmp(lx -> content, "abs")) lx -> type = OP_ABS;
    if(!strcmp(lx -> content, ",")) lx -> type = ARG_SEP;
    if(!strcmp(lx -> content, "func")) lx -> type = FUNC_DEF;
    if(!strcmp(lx -> content, "return")) lx -> type = OP_RET;
    if(!strcmp(lx -> content, "include")) lx -> type = OP_INCL;
}

lexem* go_parse(char* s)
{
    _s = s;
    lexem* res = new_lexem(0,"start");
    lexem* cur = res;
    lexem* got = (lexem*)1;
    //printf("begin parsing\n");
    while(got)
    {
        got = 0;
        //printf("getting chr\n");
        got = get_chr();
        if(!got) got = get_brk();
        //printf("getting num\n");
        if(!got) got = get_num();
        //printf("getting id\n");
        if(!got) got = get_id();
        if(got)
        {
            //printf("got result %s\n", dump(got));
            expand_lex_type(got);
            connect(cur, got);
            //printf("connected\n");
            cur = cur -> next;
        }
    }
    if(*_s == '\0')
    {
        return res -> next;
    }
    else
    {
        fprintf(stderr, "error: wrong symbol %c\n", *_s);
        return 0;
    }
}

int type(lexem* lx)
{
    if(lx)
    {
        return lx -> type;
    }
    else
    {
        return 0;
    }
}

const char* content(lexem* lx)
{
    if(lx)
    {
        return lx -> content;
    }
    else
    {
        return 0;
    }
}


bool is_bin_op(lexem* lx)
{
    return type(lx) == OP_ADD || type(lx) == OP_SUB || type(lx) == OP_MUL  || type(lx) == OP_DIV ||  type(lx) == OP_POW;
}

bool is_unary(lexem* lx)
{
    return type(lx) == OP_SIN || type(lx) == OP_COS ||type(lx) == OP_ABS ||
    type(lx) == OP_SQRT || type(lx) == OP_IN || type(lx) == OP_OUT  || type(lx) == OP_ASM;
}

#endif
