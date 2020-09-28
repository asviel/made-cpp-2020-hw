.text
.global count_det

count_det:
    mov r4, r0  // Сохранение адреса начала массива
    mov r3, #3  // Счетчик 3х элементов

    push {lr}

    mov r1, #1  // Инициализация промежуточного результата
    bl diag
    push {r1}

    mov r1, #1
    bl first_triangle
    push {r1}

    mov r1, #1
    bl second_triangle
    push {r1}

    mov r1, #1
    bl inv_diag
    push {r1}

    mov r1, #1
    bl first_inv_triangle
    push {r1}

    mov r1, #1
    bl second_inv_triangle
    push {r1}

    mov r1, #0
    
    pop {r2}
    sub r1, r2
    pop {r2}
    sub r1, r2
    pop {r2}
    sub r1, r2

    pop {r2}
    add r1, r2
    pop {r2}
    add r1, r2
    pop {r2}
    add r1, r2

    pop {lr}

    mov r0, r1
    bx lr

// Произведение элементов главной диагонали
diag:
    ldrb r2, [r0], #4
    mul r1, r2

    add r0, #12  // Смещение указателя на 12 байт (3 элемента int32_t)
    sub r3, #1

    cmp r3, #0
    bgt diag

    
    mov r0, r4  // Возврат значения адреса начала массива
    mov r3, #3  // Возврат значения счетчика 3х элементов

    bx lr

first_triangle:
    add r0, #4
    ldrb r2, [r0], #4
    mul r1, r2

    add r0, #12
    ldrb r2, [r0], #4
    mul r1, r2

    ldrb r2, [r0], #4
    mul r1, r2

    mov r0, r4  // Возврат значения адреса начала массива
    mov r3, #3  // Возврат значения счетчика 3х элементов

    bx lr

second_triangle:
    add r0, #8
    ldrb r2, [r0], #4
    mul r1, r2

    ldrb r2, [r0], #4
    mul r1, r2

    add r0, #12
    ldrb r2, [r0], #4
    mul r1, r2

    mov r0, r4  // Возврат значения адреса начала массива
    mov r3, #3  // Возврат значения счетчика 3х элементов

    bx lr

// Произведение элементов обратной диагонали
inv_diag:
    add r0, #8
    ldrb r2, [r0], #4
    mul r1, r2

    add r0, #4
    ldrb r2, [r0], #4
    mul r1, r2

    add r0, #4
    ldrb r2, [r0], #4
    mul r1, r2

    mov r0, r4  // Возврат значения адреса начала массива
    mov r3, #3  // Возврат значения счетчика 3х элементов

    bx lr

first_inv_triangle:
    ldrb r2, [r0], #4
    mul r1, r2

    add r0, #16
    ldrb r2, [r0], #4
    mul r1, r2

    add r0, #4
    ldrb r2, [r0], #4
    mul r1, r2

    mov r0, r4  // Возврат значения адреса начала массива
    mov r3, #3  // Возврат значения счетчика 3х элементов

    bx lr

second_inv_triangle:
    add r0, #4
    ldrb r2, [r0], #4
    mul r1, r2

    add r0, #4
    ldrb r2, [r0], #4
    mul r1, r2

    add r0, #16
    ldrb r2, [r0], #4
    mul r1, r2

    mov r0, r4  // Возврат значения адреса начала массива
    mov r3, #3  // Возврат значения счетчика 3х элементов

    bx lr
