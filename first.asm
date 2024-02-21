ПРоизводительные силы - силы которые движут общественным производством (нтр нтп нанотехнологии)
рабочая сила - способность человека к труду являясь совокупностью его физ и дух сил применяемых в процессе производства
средство труда - то с помощью чего производится производственный процесс учавствует в производственном процессе многократно и переносят свою стоимость на создаваемый продукт по частям по мере своего износа
предмет труда - то на что направлен труд человека что подвергается обработке они учавствуют в произв процессе один раз и переносят свою стоимость на создаваемый продукт сразу же
под факторами производства понимаются условия производственной деятельности. экономическая наука знает два подхода классификации факторов производства
1: Макрсистская трактовка
2: Маржиналистская трактовка
1 - труд это целесообразная и осознанная деятельность человека с помощью которой он видоизменяет виды природы и приспосабливает их для удовл своих потребностей
2 - земля это естественный фактор производства (недра ресурсы леса энергия солнца воды и ветра освоение космоса)
3 - капитал
4 - предпринимательская способность - особый вид человеческого капитала характеризующийся знанием умением опытом в целях получения прибыли
5 - информация систематизирует знания способствует принятию наиболее выгодных решений для цели производства - оптимизирует ...


global main

extern printf

section .data
result1 dq 1
result2 dq 1
result dq 1
n dq 8
k dq 3
message db "Answer is: %u", 10,0

section .text
main:
    mov rdi, [n]
    mov rsi, [k]
    sub rdi, rsi
    mov rcx, rdi
    mov rax, [result]
_denominator:
    imul rax, rcx
    loop _denominator
    mov [result1], rax

    mov rcx, rdi
    mov rax, [result]
_numerator:
    imul rax, rcx
    loop _numerator
    mov [result2], rax

    sub rsp, 8
    mov rdi, [result1]
    mov rax, [result2]
    div rdi
    mov [result], rax
    mov rdi, message
    mov rsi, [result]
    call printf
    add rsp, 8
    ret

;(k-1)*(k-2)*(k-3)*...*n

global main

extern printf

section .data
result dq 1
n dq 7
k dq 3
message db "Answer is: %u", 10,0

section .text
main:
    mov rdi, [n]
    mov rsi, [k]
    sub rdi, rsi
    mov rcx, rdi
    mov rax, [result]
_factorial:
    imul rax, rcx
    loop _factorial
    sub rsp, 8
    mov [result], rax
    mov rdi, message
    mov rsi, [result]
    call printf
    add rsp, 8
    ret

;(k-1)*(k-2)*(k-3)*...*


global main

extern printf

section .data
result1 dq 1
result2 dq 1
result dq 1
n dq 8
k dq 3
message db "Answer is: %u", 10,0

section .text
main:
    mov rdi, [n]
    mov rsi, [k]
    sub rdi, rsi
    mov rcx, rdi
    mov rax, [result]
_denominator:
    imul rax, rcx
    loop _denominator
    mov [result1], rax

    mov rcx, 1
    mov rax, [result]
_numerator:
    imul rax, rcx
    cmp rcx, rdi
    jne _numerator
    inc rcx
    mov [result2], rax

    sub rsp, 8
    mov rdi, [result1]
    mov rax, [result2]
    div rdi
    mov [result], rax
    mov rdi, message
    mov rsi, [result]
    call printf
    add rsp, 8
    ret
