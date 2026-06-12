.syntax unified
.cpu cortex-m4
.thumb

.global lab1
.type lab1, %function

lab1:
    push {r4, lr}         // Зберігаємо регістри, які будемо використовувати

    // Вхідні значення
    mov r0, #10           // a = 10
    mov r1, #4            // b = 4
    mov r2, #2            // c = 2

    // 1. Перевірка умови: (a - b) >= 0
    cmp r0, r1            // Порівнюємо a та b
    blt _else_branch      // Якщо a < b, то стрибаємо у гілку else

_if_branch:
    // 2. Обчислення якщо true: (a + b) / c
    add r3, r0, r1        // r3 = a + b
    sdiv r4, r3, r2       // r4 = r3 / c (знакове ділення, результат у r4)
    b _calc_done          // Стрибаємо в кінець, пропускаючи гілку else

_else_branch:
    // 3. Обчислення якщо false: (a - b) / c
    sub r3, r0, r1        // r3 = a - b
    sdiv r4, r3, r2       // r4 = r3 / c (знакове ділення, результат у r4)

_calc_done:
    // 4. Фінальний результат зберігаємо у r0
    mov r0, r4            // Тепер у r0 лежить остаточний результат

    pop {r4, pc}          // Відновлюємо регістри та виходимо з функції
.size lab1, .-lab1
