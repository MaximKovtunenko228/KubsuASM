global _start

section .data
d dq 3
a1 dq 1
n dq 6

section .text
_start:
    mov ECX, [n]
    mov EAX, [d]
    mov EDX, [a1]
_metka:
    add EDX, EAX
    loop _metka
    mov EAX, EDX
                        ; вывод информации на консоль посредством закидывания значения в статус программы (что хотим вернуть надо подставить вместо edx)
    mov EBX, EDX
    mov edi, ebx

    mov rax, 60         ; 60 - номер системного вызова exit
    syscall             ; выполняем системный вызов exit
