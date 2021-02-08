;Universidad UTEL
;Ejercicio PRUEBA IRVING de la Semana #5
;Lenguaje Ensamblador
;Israel González Bejarano

;Codigo para crear un archivo .txt titulado Archivo_semana5 y que contenga el mensaje Ejercicio3, Semana 5, UTEL
;NOTA: Código escrito en Visual Studio Code para posteriormente ser compilado en el emulador emu8086

.model small            ;definimos un modelo pequeño

.stack 100h             ;segmento de pila de 256 posiciones

;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.data
    TamBuf = 256
    infile BYTE "Archivo_Semana5.txt",0
    inHandle WORD ?
    buffer BYTE TamBuf DUP(?)
    bytesRead WORD ?

;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.code                   ;inicia código del programa

;Comandos
;enter          E adress[list]
;dump           D [range]
;hex add/sub    H value1 value 2
;set name       N [[drive:][path]progname [arglist]]
;register       W [address]
;quit           Q

main PROC
    mov ax,@data
    mov ds,ax

;Abrir la entrada del archivo
    mov ax,716Ch                ;abrir o crear un archivo
    mov bx,0                    ;modo = solo lectura
    mov cx,0                    ;atributo normal
    mov dx,1                    ;acción abrir
    mov si,OFFSET infile
    int 21h                     ;llamada al sistema operativo
    jc quit                     ;salir si hay un error
    mov inHandle,ax

Read_File_Into_Buffer:
    mov ah,3Fh                  ;leer archivo o dispositivo
    mov bx,inHandle             ;manejo de archivos
    mov cx,TamBuf               ;número máximo de bytes a leer
    mov dx,OFFSET buffer        ;apuntador al buffer
    int 21h
    jc Close_File               ;salir si hay un error
    cmp ax,0                    ;¿fin del archivo?
    je Close_File               ;si: cerrar el archivo
    mov bytesRead,ax

;Mostrar el contenido del buffer en hexadecimal
    mov esi,OFFSET buffer       ;dirección del buffer
    movzx ecx,bytesRead         ;número de unidades a mostrar
    mov ebx,1                   ;tamaño de la unidad (bytes)
    call DumpMem

    jmp Read_File_Into_Buffer   ;leer más datos

Close_File:
    mov ah,3Eh                  ;función: cerrar archivo
    mov bx,inHandle             ;entrada del manejo de archivos
    int 21h

quit:
    call Crlf
    exit

main ENDP