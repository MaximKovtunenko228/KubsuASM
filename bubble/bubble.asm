global main

extern printf

section .data

message db "Min: %d , index: %u", 10,0
Array dq 1, 2, -300, 8, 5, -15, 7, 0, -2228, -10
min dq 2
index dq 0

section .text
main:
    xor rcx, rcx
    mov rsi, Array
    mov rax, [rsi]
    xor rbx, rbx

first:
    add rbx, 8
    cmp rax, [rsi + rbx]
    jle ex

ex:
    xchg rax, [rsi + rbx + 8]

_final:
    sub rsp, 8

    call printf
    add rsp, 8
    ret

