[BITS 16]
[org 0x7c00]

boot:
    mov ah, 0x0E

add:
    mov ax, 10
    mov bx, 8
    add ax, bx
    mov dx, ax
    
    mov si, msg
    mov [si], dl         
    mov [si + 1], dh

print:
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    int 10h
    jmp print

done:
    hlt

msg db 0,0
times 510 - ($ - $$) db 0
dw 0xAA55