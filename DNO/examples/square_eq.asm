//assignment
push 0
pop
in
popr 0
//assignment
push 0
pop
in
popr 1
//assignment
push 0
pop
in
popr 2
//assignment
pushr 1
pushr 1
mul
push 4
pushr 0
pushr 2
mul
mul
sub
popr 3
//assignment
push 0
popr 4
//assignment
push 0.0000001
popr 5
//assignment
push 0
popr 6
//assignment
push 0
popr 7
//if
pushr 3
push 0
jle 1
push 1
jmp 2
:1
push 0
:2
push 0
je 3
//if
//CALL
pushr 0
call 4
//-CALL
push 1
je 5
push 1
jmp 6
:5
push 0
:6
push 0
je 7
//assignment
push 2
popr 4
//assignment
push 0
pushr 1
pushr 3
push 0.5
pow
add
sub
push 2
pushr 0
mul
div
popr 6
//assignment
push 0
pushr 1
pushr 3
sqrt
sub
sub
push 2
pushr 0
mul
div
popr 7
:7
//if
//CALL
pushr 0
call 4
//-CALL
push 0
je 8
//if
//CALL
pushr 1
call 4
//-CALL
push 1
je 9
push 1
jmp 10
:9
push 0
:10
push 0
je 11
//assignment
push 1
popr 4
//assignment
push 0
pushr 2
pushr 1
div
sub
popr 6
//assignment
pushr 6
popr 7
:11
//if
//CALL
pushr 1
call 4
//-CALL
push 0
je 12
//assignment
push 3
popr 4
//assignment
push 0
popr 6
//assignment
push 0
popr 7
:12
:8
:3
//if
//CALL
pushr 3
call 4
//-CALL
push 0
je 13
//assignment
push 1
popr 4
//assignment
push 0
pushr 1
push 2
pushr 0
mul
div
sub
popr 6
//assignment
pushr 6
popr 7
:13
//CALL
pushr 6
call 14
//-CALL
//CALL
pushr 7
call 14
//-CALL
//if
pushr 3
push 0
jl 15
push 0
jmp 16
:15
push 1
:16
push 0
je 17
//assignment
push 0
popr 4
:17
//OUT
pushr 4
out
//if
pushr 4
push 1
je 18
push 0
jmp 19
:18
push 1
:19
push 0
je 20
//OUT
pushr 6
out
:20
//if
pushr 4
push 2
je 21
push 0
jmp 22
:21
push 1
:22
push 0
je 23
//OUT
pushr 6
out
//OUT
pushr 7
out
:23
//FUNC_DEF
jmp 24
:4
popr 8
//RET
pushr 0
abs
pushr 5
jle 25
push 0
jmp 26
:25
push 1
:26
ret
:24
//-FUNC_DEF
//FUNC_DEF
jmp 27
:14
popr 9
//if
pushr 9
abs
pushr 5
jl 28
push 0
jmp 29
:28
push 1
:29
push 0
je 30
//assignment
push 0
popr 9
:30
//RET
pushr 9
ret
:27
//-FUNC_DEF
end
endprog