global main

extern printf

section .data
result1 dq 1
result2 dq 1
result dq 1
n dq 6
k dq 4
message db "Answer is: %u", 10,0

section .text
main:
    mov rdi, [n]
    mov rsi, [k]
    cmp rdi, rsi
    je _odin
    cmp rsi, 0
    je _odin
    sub rdi, rsi
    mov rcx, rdi
    mov rax, [result]
_denominator:
    imul rax, rcx
    loop _denominator
    mov [result1], rax
    mov rcx, rdi
    mov rax, [result]
    mov rbx, [n]
_numerator:
    imul rax, rbx
    dec rbx
    cmp rcx, 0
    je _final
    dec rcx
    jne _numerator

_final:
    sub rsp, 8
    mov rdi, [result1]
    cqo
    div rdi
    mov [result], rax
    mov rdi, message
    mov rsi, [result]
    call printf
    add rsp, 8
    ret

_odin:
    sub rsp, 8
    mov rsi, 1
    mov rdi, message
    mov rsi, [result]
    call printf
    add rsp, 8
    ret
