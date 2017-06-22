//assignment
push 0
pop
in
popr 0
//OUT
push 228
out
//OUT
//CALL
pushr 0
call 1
//-CALL
out
//FUNC_DEF
jmp 2
:1
popr 1
//if
pushr 1
push 0
jle 3
push 1
jmp 4
:3
push 0
:4
push 0
je 5
//assignment
pushr 1
//CALL
pushr 1
push 1
sub
call 1
//-CALL
mul
popr 2
//RET
pushr 2
ret
:5
//RET
push 1
ret
:2
//-FUNC_DEF
end
endprog