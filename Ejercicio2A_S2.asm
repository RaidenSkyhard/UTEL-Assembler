;Universidad UTEL
;Ejercicio 2 de la Semana #2 modificado con base en el ejercicio original
;Lenguaje Ensamblador
;Israel González Bejarano

;Codigo para hacer operaciones aritméticas suma, resta y multiplicación
;NOTA: Código escrito en Visual Studio Code para posteriormente ser compilado en el emulador emu8086

.model small            ;definimos un modelo pequeño

.stack 100h             ;segmento de pila de 256 posiciones



;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.data
    num1 db 0           ;variable para el primer numero
    num2 db 0           ;variable para el segundo numero
    num3 db 0           ;variable para resultados
    texto db 10,13,"Primer Numero: $"       ;texto para solicitar la entrada del primer numero
    texto1 db 10,13,"Segundo Numero: $"     ;texto para solicitar la entrada del segundo numero 
    resultado1 db 10,13,"El resultado de la suma es: $"             ;texto para mostrar el resultado de la suma
    resultado2 db 10,13,"El resultado de la resta es: $"            ;texto para mostrar el resultado de la resta
    resultado3 db 10,13,"El resultado de la multiplicación es: $"           ;texto para mostrar el resultado de la multiplicación


;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.code                   ;inicia código del programa

    ;siempre iniciar el segmento de datos
    mov ax,@data        ;cargamos el apuntodor en ax
    mov ds,ax           ;segmento de datos en AX

    ;---------------------CAPTURA DE DATOS
    mov ah,9            ;llamada al servicio de impresión
    lea dx,texto        ;obtenemos la dirección del primer texto
    INT 21h             ;llamada al sistema operativo
    mov ah,1            ;servicio de entrada de datos
    INT 21h             ;llamada al sistema operativo
    sub al,30h          ;ajuste de datos con el número 30 hexadecimal o 48 decimal en caso de que el usuario pulse una tecla de letra
    mov num1,al         ;mover la entrada a la variable num1

    mov ah,9            ;llamada al servicio de impresión
    lea dx,texto1       ;obtenemos la dirección del segundo texto
    INT 21h             ;llamada al sistema operativo
    mov ah,1            ;servicio de entrada
    INT 21h             ;llamada al sistema operativo
    sub al,30h          ;ajuste de datos con el número 30 hexadecimal o 48 decimal en caso de que el usuario pulse una tecla de letra
    mov num2,al         ;mover la entrada a la variable num2

    ;---------------------SUMA
    mov al,num1
    add al,num2
    add al,30h
    mov num3,al

    mov ah,9
    lea dx,resultado1
    int 21h
    mov ah,2            ;servicio que exhibe resultado
    mov dl,num3
    int 21h

    ;--------------------RESTA
    mov al,num1
    sub al,num2
    add al,30h
    mov num3,al

    mov ah,9
    lea dx,resultado2
    int 21h
    mov ah,2            ;servicio que exhibe resultado
    mov dl,num3
    int 21h

    ;---------------------MULTIPLICACIÓN
    mov al,num1
    sub al,



    


    ;*-*-*-Multiplicación de 8 bits*-*-*-
    mov al,Quince       ;Se coloca el valor de la variable Quince en al, ya que siempre debe estar en al el valor a multiplicar -- al=0Fh(15)
    mov cl,3            ;asignamos al registro cl el valor por el cual se multiplicará el registro al -- cl=3
    mul cl              ;El resultado de la multiplicación siempre se muestra en la variable ax -- ax=2Dh(45)


    ;*-*-*-Multiplicación de 16 bits*-*-*-
    mov ax,Quince;      ;asignamos el valor de la variable 15 al registro axax=0fh(15)
    mov cx,1000;        ;asignamos a cx el valor por el cual se multiplicará la variable ax -- cx=1000
    mul cx              ;el valor de la variable seleccionada siempre se multiplicará por ax, y el resultado se almacenará en dx y parte de cx ya que puede ser un número muy extenso -- [dx ax]=0000 3A98h(15000)


    mov ah,4ch
    INT 21h

end