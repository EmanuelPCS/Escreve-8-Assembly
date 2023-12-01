;-- TRABALHO PRATICO 
; Data: 12/06/2020
; Hora: 9:30
;-- Preencher os seguintes dados --
; Numero do TP: P482
; Aluno 1: Emanuel Saraiva 2019130219
; Aluno 2: Helder Barreto 2019115156
; Aluno 3: Tiago Morais 2019131045

.8086
.model small
.stack 2048

dseg segment para public 'data'
    
	LIN db 2
	COL db 7
	ALT db 7
	LARG db 5
	; CAR db '+'
dseg ends

cseg segment para public 'code'
     assume cs:cseg, ds:dseg
main proc
     mov ax, dseg
     mov ds, ax

	 
     mov ax, 0B800h
	 
     mov es, ax
	 
     xor ax,ax
     xor si,si
     xor bx,bx
     xor di,di
     xor cx,cx
	 xor bp,bp
	 	 
	 mov cl,ALT
     ; mov cx, ALT
     mov al, LIN
     mov bl, 80*2
     mul bl
     mov si, ax

     mov al, COL
     mov bl, 2
     mul bl
     mov di, ax
	 
	 mov bh,'+'
     
     add si,di


	 mov bl, 0C2h
; ciclo1-> Vai dar dar print da coluna final (coluna 7)
ciclo1:
		mov es:[si], bh
		mov es:[si+1], bl
		add si, 160
loop ciclo1
		; Subtrair si,160 para voltar uma linha atras para de seguida fazer o print da largura na mesma posição
		sub si,160
		mov cl, LARG
		
  ; ciclo2-> Vai dar print da parte de baixo do numero (largura 5)
ciclo2:
		mov es:[si], bh
		mov es:[si+1], bl
        sub si, 2
loop ciclo2	
		
		add si,2
		mov cl, ALT
		mov bp,160	  
	; ciclo3-> Vai dar print da primeira coluna	
ciclo3:
		mov es:[si], bh
		mov es:[si+1], bl
	    sub si, bp
loop ciclo3
	  
		mov cl, LARG
		add si, 160
		
		; ciclo4-> Vai dar print da parte de cima do numero
ciclo4:
		mov es:[si], bh
		mov es:[si+1], bl
		add si, 2
	
loop ciclo4	

;Calculos para achar o centro do numero 8 para desenhar o traço no meio
	mov al, ALT
	mov bl,02h
	div bl
	mov bl, 160
	mul bl
	add si, ax
	sub si,2
	mov cl,LARG
	mov bl,0C2h
	; ciclo5-> Vai dar print do traço do meio do numero 8
ciclo5:
	mov es:[si], bh
	mov es:[si+1], bl
    sub si, 2
loop ciclo5
	  
	 
     mov ah, 4ch
     int 21h
main endp
cseg ends

end main