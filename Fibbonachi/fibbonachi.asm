global _start           ; делаем метку метку _start видимой извне

section .data
f1 dq 10;
f2 dq 1;
f3 dq 0;
n dq 12


section .text           ; объявление секции кода
_start:                 ; объявление метки _start - точки входа в программу
    mov RAX, 2
    sub [n], RAX
    mov EAX, 1
    mov EBX, [f2]
    mov EDX, 0
    mov ECX, [n]
_metka:
    add EDX, EAX
    mov EDX, EBX
    mov EAX, EBX
    mov EBX, EDX
    mov EDX, 0
    loop _metka

    mov edi, ebx

    mov rax, 60         ; 60 - номер системного вызова exit
    syscall             ; выполняем системный вызов exit
