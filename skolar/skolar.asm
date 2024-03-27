global main

extern printf

section .data

message db "Answer is: %d", 10,0
Array1 dq 1, 1, 1
Array2 dq 1, 1, 1
res dq 0
n dq 3
section .text
main:
    mov rcx, n
    xor rax, rax
    xor rbx, rbx
    xor rdx, rdx
skolar:
    mov rax, Array1[rbx]
    imul rax, Array2[rbx]
    add rdx, rax
    add rbx, 8
    loop skolar

    mov [res], rdx
_final:
    sub rsp, 8
    mov rdi, message
    mov rsi, [res]
    call printf
    add rsp, 8
    ret

