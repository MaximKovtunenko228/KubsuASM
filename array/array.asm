global main

extern printf

section .data

message db "Min: %d , index: %u", 10,0
Array dq 1, 2, -300, 8, 5, -15, 7, 0, -2228, -10
min dq 2
index dq 0

section .text
main:
    mov rcx, 9
    mov rsi, Array
    mov rax, [rsi]
    xor rbx, rbx
_min:
    add rbx, 8
    cmp rax, [rsi + rbx]
    jle not_less
    mov rax, [rsi + rbx]
not_less:
    loop _min

    mov rcx, 9
    xor rbx, rbx
    mov [min], rax
    xor rax, rax
find_index:
    add rbx, 8
    mov rax, [rsi + rbx]
    cmp [min], rax
    jz _final
    loop find_index

correct:
    mov rcx, 10
    jmp _final

_final:
    mov [index], rcx
    mov rcx, 10
    sub rcx, [index]
    sub rsp, 8
    mov rdi, message
    mov rsi, [min]
    mov rdx, rcx
    call printf
    add rsp, 8
    ret
