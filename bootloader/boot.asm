[BITS 16]
[org 0x7c00]

boot:
    mov ah, 0x0E
    mov si, msg

print:
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    int 10h
    jmp print

done:
    hlt

msg db "Hello world!", 0

times 510 - ($ - $$) db 0
dw 0xAA55