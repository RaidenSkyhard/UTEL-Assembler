;Universidad UTEL
;Ejercicio 2 de la Semana #4
;Lenguaje Ensamblador
;Israel González Bejarano

;Codigo para leer caracteres e imprimirlos centrados y con cambio de ecolor
;NOTA: Código escrito en Visual Studio Code para posteriormente ser compilado en el emulador emu8086

.model small            ;definimos un modelo pequeño

.stack


;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.data
    text1 db 100 dup(' '),'$'           ;variable para la entrada de datos
    text2 db 100 dup(' '),'$'           ;variable auxiliar
    texto1 db 10,13,7,'Escriba su nombre: ','$'       ;texto para solicitar la entrada del numero
    texto2 db 10,13,7,'Escriba su carrera: ','$'             ;texto para mostrar el resultado de la conversión


;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.code                   ;inicia código del programa

    main proc
    
        ;siempre iniciar el segmento de datos
        mov ax,seg @data        ;cargamos el apuntodor en ax
        mov ds,ax           ;segmento de datos en AX

        ;---------------------CAPTURA DE DATOS-----------------------
        
        ;Impresión del primer mensaje
        mov ah,09h              ;llamada al servicio de impresión
        lea dx,texto1           ;obtenemos la dirección del primer texto
        INT 21h                 ;llamada al sistema operativo
        
        ;leer la cadena
        mov ah,3fh                ;servicio de entrada de datos
        mov bx,00
        mov cx,100
        mov dx, offset[text1]
        int 21h                 ;llamada al sistema operativo

        ;Impresión del primer mensaje
        mov ah,09h              ;llamada al servicio de impresión
        lea dx,texto2           ;obtenemos la dirección del primer texto
        INT 21h                 ;llamada al sistema operativo
        
        ;leer la cadena
        mov ah,3fh                ;servicio de entrada de datos
        mov bx,00
        mov cx,100
        mov dx, offset[text2]
        int 21h                 ;llamada al sistema operativo
        

        ;----------------------imprimir los datos---------
        mov ah,09h
        mov dx,offset[text1]
        int 21h

        mov ah,09h
        mov dx,offset[text2]
        int 21h
    
    .exit
    main ENDP

end