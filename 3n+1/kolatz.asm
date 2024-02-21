global _start

section .data
n dq 78

section .text
_start:
    mov eax, [n]
    jmp _even
    _mult:
        mov ebx, 3
        mov eax, ecx
        mul ebx
        inc eax
    _even:
        mov ecx, eax
        mov edx, eax
        shr edx, 16
        mov bx, 2
        div bx
        cmp dx, 1
        je _mult
        cmp eax, 1
        jne _even

    mov rax, 60         ; 60 - номер системного вызова exit
    syscall             ; выполняем системный вызов exit

