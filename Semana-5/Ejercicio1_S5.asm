;Universidad UTEL
;Ejercicio 1 de la Semana #5
;Lenguaje Ensamblador
;Israel González Bejarano

;Codigo para crear un archivo .txt titulado Archivo_semana5 y que contenga el mensaje Ejercicio3, Semana 5, UTEL
;NOTA: Código escrito en Visual Studio Code para posteriormente ser compilado en el emulador emu8086

org 100h

;definición de macro
imprimir macro texto
    mov ah,9
    mov dx, offset texto
    int 21h
endm
;fin de macro

inicio:
    ;crear directorio
    mov ah,39h
    mov dx,offset directorio
    int 21h

    ;crear archivo
    mov ah,3ch
    mov cx,0
    mov dx,offset archivo
    int 21h
    ;si hay error en la creación, CF=1
    jc error1
    mov handler,ax

    ;escribir el contenido del archivo
    mov ah,40h
    mov bx,handler
    mov cx,numbytes
    mov dx,offset cadena
    int 21h
    ;validacion de escritura (si hay error en la escritura CF=1)
    jc error2

    ;cerrar archivo
    mov ah,3Eh
    mov bx, handler
    int 21h
    
    jmp fin

error1:
    imprimir msgError1
error2:
    imprimir msgError2

fin:
    ret

;DEFINICIÓN DEL CONTENIDO DEL ARCHIVO
directorio db 'C:\prueba',0
archivo db 'C:\prueba\Archivo_Semana5.txt',0
cadena db 'Ejercicio3, Semana 5, UTEL',0
numbytes dw $ - offset cadena
handler dw ?    ;manejador
msgError1 db 'Error: No es posible crear el archivo',10,13,'$'
msgError2 db 'Error: No es posible escribir en el archivo',10,13,'$'