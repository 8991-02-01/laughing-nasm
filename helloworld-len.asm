    ;; Hello world Program (Calculating string length)

    SECTION .data
    msg db 'Hello, brave new world!', 0Ah

    SECTION .text
    global _start

_start:
    mov ecx, msg                ; msg into ecx register for writing
    mov esi, ecx                ; esi points to same pool in memory as ecx

_loop_count_chars:
    cmp byte [esi], 0           ; compare the byte pointed to by esi against zero (Zero is end of string delimiter)
    jz _end                     ; jump (if zero flagged has been set to _end)
    inc esi                     ; inc esi by one byte
    jmp _loop_count_chars       ; eat up next bytes

_end:
    sub esi, ecx                ; esi has number of bytes until end of ecx which contains the msg
    mov edx, esi                ; edx will contain count required to exec write syscall
    mov ebx, 1                  ; 1 is stdout?
    mov eax, 4                  ; write
    int 80h

    mov ebx, 0                  ; 0 is success
    mov eax, 1
    int 80h
