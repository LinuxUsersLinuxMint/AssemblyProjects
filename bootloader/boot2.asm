[BITS 16]
[org 0x7c00]

KernelName db " LXKernel", 0
KernelVersion db " v0.1", 0

boot:
    mov ah, 0x0E

    mov si, msg
    call print_string

    mov si, KernelName
    call print_string

    mov si, KernelVersion
    call print_string

    jmp $

print_string:
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    int 10h
    jmp print_string
done:
    ret

msg db "Hello world!", 0

times 510 - ($ - $$) db 0
dw 0xAA55