    ;; Hello world Program (Calculating string length)

    SECTION .data
    msg db 'Hello, brave new world!', 0Ah

    SECTION .text
    global _start

_start:
    mov ecx, msg                ; msg into ecx register for writing
    call _do_count_chars      ; count chars

    ;; _end
    mov ebx, 1                  ; 1 is stdout?
    mov eax, 4                  ; write
    int 80h

    mov ebx, 0                  ; 0 is success
    mov eax, 1
    int 80h

_do_count_chars:
    push esi                    ; esi memory addresss
    mov esi, ecx                ; esi loads address of ecx

_count_chars:
    cmp byte [esi], 0           ; compare the byte pointed to by esi against zero (Zero is end of string delimiter)
    jz _end_count_chars         ; jump zero flag or some shit like that
    inc esi                     ; inc esi by one byte
    jmp _count_chars       ; eat up next bytes

_end_count_chars:               ; leverage the stack that's the point
    pop edi                     ; pop the result of count chars into edi
    sub edi, ecx                ; ecx = string
    mov edx, edi                ; mov into edx the result of that
    ret
