global main

extern printf

section .data

message db "Answer is: %d", 10,0
Array1 dq 1, 1, 1, 2, 2, 2, 3, 3, 3
Array2 dq 4, 4, 4, 5, 5, 5, 6, 6, 6
ArrayResult dq 0, 0, 0, 0, 0, 0, 0, 0, 0
n dq 3
end_of_row dq 8

section .text
main:
    mov rax, [n]
    mov rbx, [end_of_row]
    imul rbx, rax
    mov [end_of_row], rbx
    xor rbx, rbx
    xor rcx, rcx
    xor rax, rax
    xor rdx, rdx
multiply:
    mov rax, Array1[rcx]
    imul rax, Array2[rbx]
    add rdx, rax
    add rbx, [end_of_row]
    add rcx, 8
    cmp rcx, [end_of_row]
    jz fill
    jmp multiply

fill:
    xor rax, rax
    mov ArrayResult[rax], rdx
    xor rbx, rbx
    xor rdx, rdx
    mov rbx, [n]
    mov rdx, [end_of_row]
    imul rdx, rbx
    mov [end_of_row], rdx
    xor rax, rax
    jmp multiply

_final:
    sub rsp, 8
    mov rdi, message
    mov rsi, ArrayResult
    call printf
    add rsp, 8
    ret


; 1 1 1       4, 4, 4
; 2 2 2       5, 5, 5
; 3 3 3       6, 6, 6


;1 * 4 + 1 * 5 + 1 * 6,  1 * 4 + 1 * 5 + 1 * 6, 1 * 4 + 1 * 5 + 1 * 6
;2 * 4 + 2 * 5 + 2 * 6,  2 * 4 + 2 * 5 + 2 * 6, 2 * 4 + 2 * 5 + 2 * 6
;3 * 4 + 3 * 5 + 3 * 6,  3 * 4 + 3 * 5 + 3 * 6, 3 * 4 + 3 * 5 + 3 * 6



; 15 15 15
; 30 30 30
; 45 45 45


;15 15 15 30 30 30 45 45 45
