;Universidad UTEL
;Ejercicio 1 de la Semana #4
;Lenguaje Ensamblador
;Israel González Bejarano

;Codigo para convertir un número decimal de dos cifras en binario usando el método BCD
;NOTA: Código escrito en Visual Studio Code para posteriormente ser compilado en el emulador emu8086

.model small            ;definimos un modelo pequeño

.stack 100h             ;segmento de pila de 256 posiciones


jmp start



;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.data
    num1 dw ?           ;variable para la entrada de datos
    num2 dw ?           ;variable auxiliar
    num3 dw ?           ;variable para resultados
    texto db 10,13,"Escriba su numero decimal de dos cifras: $"       ;texto para solicitar la entrada del numero
    resultado db 10,13,"El resultado de la conversion es: $"             ;texto para mostrar el resultado de la conversión


;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.code                   ;inicia código del programa

    start:

        ;siempre iniciar el segmento de datos
        mov ax,@data        ;cargamos el apuntodor en ax
        mov ds,ax           ;segmento de datos en AX

        ;---------------------CAPTURA DE DATOS-----------------------
        mov ah,9            ;llamada al servicio de impresión
        lea dx,texto        ;obtenemos la dirección del primer texto
        INT 21h             ;llamada al sistema operativo
        mov ah,1            ;servicio de entrada de datos
        INT 21h             ;llamada al sistema operativo
        sub ax,30h          ;ajuste de datos con el número 30 hexadecimal o 48 decimal en caso de que el usuario pulse una tecla de letra
        mov num1,ax         ;mover la entrada a la variable num1
        
        mov cx,num1

        
        mov num2,cx         ;mover
        
        mov dx,num3
        mov ah,9
        int 21h

        mov bx,num2
        mov cx,16

        print:

            mov ah,2
            mov dl,'0'
            text bx, 1000000000000000b
            jz zero
            mov dl,'1'

        zero:
            int 21h
            shl bx,1

        loop print
            mov dl,'b'
            int 21h
        
        jmp start           ;loop del programa

        stop:

            ret

            abinario    proc    near
                        push    dx
                        push    ax
                        push    si
        
        jmp process
;------------------------VARIABLES LOCALES---------
        make_minus      db  ?
        diez            dx  10
;--------------------------------------------------

        process:
            mov cx,0        ;reiniciar acumulador

            mov cs:make_minus,0     ;reiniciar bandera
        
        next_digit:
        


    
    mov ah,4ch
    INT 21h

end