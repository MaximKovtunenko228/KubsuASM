global main

extern printf

section .data
message db "Answer is: %d", 10,0
error db "Error! Uncertainty!"
n dq 2
x dq 39

section .text
main:
    mov rax, [x]
    mov rbx, [n]
    cmp rbx, 1
    jz _final
    cmp rbx, 0
    jz _ecxeption
    xor rcx, rcx
    bsr rcx, rbx
    mov rbx, rcx
    mov rdx, [n]
pow:
    dec rbx
    bt rdx, rbx
    jc _mul
    jmp _sqr
_mul:
    imul rax, rax
    imul rax, [x]
    dec rcx
    cmp rcx, 0
    jz _final
    jmp pow

_sqr:
    imul rax, rax
    dec rcx
    cmp rcx, 0
    jz _final
    jmp pow

;вместо меток _exception и _output пишешь вывод на с++ используя cout
_ecxeption:
    cmp rax, 0
    jz _output
    mov rax, 1
    jmp _final

_output:
    sub rsp, 8
    mov rdi, error
    call printf
    add rsp, 8
    ret
;это тебе не надо, вместо этой метки просто вывод на с++(в регистре rax находится нужное тебе значение, то есть переносишь из rax в переменную и выводишь её)
_final:
    sub rsp, 8
    mov rdi, message
    mov rsi, rax
    call printf
    add rsp, 8
    ret


