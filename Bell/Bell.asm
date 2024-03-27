global main

extern printf

section .data
message db "Answer is: %d", 10,0
n dq 1
k dq 1
temp dq 0
section .text
main:
    mov rax, [n]
    mov rbx, [k]
    mov rdx, 1
    cmp rax, 0
    jz _test
    mov rcx, 0
_Stirling:
    cmp rcx, [k]
    jz _final
    mov [temp], rcx
    add rcx, rbx
    bt rcx, 0
    jc

    jmp _pow

_pow:


_test:
    cmp rbx, 0
    jz _output
    mov rax, 0
    jmp _final

_output:
    mov rax, 1
    jmp _final


_final:
    sub rsp, 8
    mov rdi, message
    mov rsi, rax
    call printf
    add rsp, 8
    ret


