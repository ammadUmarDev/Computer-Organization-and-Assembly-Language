.model small

.stack 100h
.data

x word ?
y word ?
r1 word 50
c1 word 280
var word ?



marioX word 0
savemarioX word 0
clearsaveX word 0
marioY word 0
savemarioY word 0
clearsaveY word 0

crownX word 0;

.code


main proc
		mov ax, @data
		mov ds,ax

		; setting graphics mode
		mov ah, 0h
		mov al, 10h
		int 10h

		;setting background color
		mov ah, 0BH
		mov bx, 9	; 0-15
		int 10h






		call drawflag

		call hurdle1

		call hurdle2

		call hurdle3

		call grass


		mov marioX,20
		mov marioY, 300


		call mama


		;sari game iski hai
		again:
			mov ah,01     ;checking for key press
			int 16h
			JZ again      ;if no key is pressed
			mov ah,0      ;getting chracter
			int 16h

			cmp al,'E'     ;E key pressed
			je exit
			cmp al,'e'     ;E key pressed
			je exit

			cmp ax,4B00h    ;left key pressed
			je leftKeyPressed

			cmp ax,4D00h     ;right key pressed
			je rightKeyPressed

			cmp ax,4800h  ;up key pressed
			je upKeyPressed
			jmp again

			cmp marioX,620
				je exit

			leftKeyPressed:
				mov bx,10
	
				sub marioX,bx
				call clearmama
				call mama

				call hurdletops
				;call hurdle1
				;call hurdle2
				;call hurdle3
				;call drawflag

				cmp marioX,620
				je exit

				cmp marioX,320
				je exit

				cmp marioX,150
				je exit

				cmp marioX,480
				je exit
	

				jmp again

			rightKeyPressed:
				mov bx,10
	
				add marioX,bx
				call clearmama
				call mama
				call hurdletops
				;call hurdle1
				;call hurdle2
				;call hurdle3
				;call drawflag

				cmp marioX,620
				je exit

				cmp marioX,320
				je exit

				cmp marioX,150
				je exit

				cmp marioX,480
				je exit
				

				jmp again
	
			upKeyPressed:  ;saray paisay iskay hain
				call hurdletops
				call clearmama
				
				call tabahiJump
				


				;call hurdle1
				;call hurdle2
				;call hurdle3
				;call drawflag

				cmp marioX,620
				je exit

				cmp marioX,320
				je exit

				cmp marioX,150
				je exit

				cmp marioX,480
				je exit
	

				jmp again


			

			jmp again
	
exit:
mov ah, 4ch
int 10h

main endp



draw proc 

		pop var
		pop x
		pop y

		mov ah, 0ch
		mov al, 14	;color of my pixel
		mov cx, y
		mov dx, x
		int 10h


		mov bx, 4
		l:
		mov si, 4
		l1:
		inc cx
		int 10h
		dec si
		cmp si, 0
		jge l1

		mov cx, y		; reset to the start of the col
		inc dx		; next row
		int 10h
		int 10h
		dec bx
		cmp bx, 0
		jge l

		mov ah, 4ch
		int 21h

		push var

ret
draw endp


drawflag proc

	pole:
		mov ah, 0ch
		mov al, 15
		mov cx, 302	; height of pole
		mov dx, 40	; starting of the pole
		int 10h
		
		loop1:
		push cx
		mov cx, 620	;how far pole is from the starting
		mov si, 6
		l1:
		inc cx		; thickness of the pole
		int 10h
		dec si
		cmp si, 0
		jge l1

		mov cx, 620	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop loop1

	flag:
		mov ah, 0ch
		mov al, 5
		mov cx, 60	; height of flag	
		mov dx, 40	
		int 10h

		loop2:
		push cx
		mov cx, 515	;how far the flad is from the starting

		mov si, 100
		l2:
		inc cx		; thickness of the flag
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, 515	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop loop2


	crownFlag:
		;base
		mov ah, 0ch
		mov al, 14
		mov cx, 10	; height	
		mov dx, 70	; y-start; marioY
		int 10h
		loop5:
		push cx
		mov cx, 530	;how far from the x-start ;variable marioX
		mov si, 70
		l5:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l5
		mov cx, 530	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop5
	
	
		;left danda
		mov crownX,530
		mov ah, 0ch
		mov al, 14
		mov cx, 15	; height	
		mov dx, 55	; y-start; marioY
		int 10h
		loop6:
		push cx
		mov cx, crownX	;how far from the x-start ;variable marioX
		mov si, 5
		l6:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l6
		mov cx, crownX	; setting col again
		add crownX,1
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop6

		mov crownX,530
		mov ah, 0ch
		mov al, 14
		mov cx, 15	; height	
		mov dx, 55	; y-start; marioY
		int 10h
		loop8:
		push cx
		mov cx, crownX	;how far from the x-start ;variable marioX
		mov si, 4
		l8:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l8
		mov cx, crownX	; setting col again

		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop8



		mov crownX,595
		;right danda
		mov ah, 0ch
		mov al, 14
		mov cx, 15	; height	
		mov dx, 55	; y-start; marioY
		int 10h
		loop7:
		push cx
		mov cx, crownX	;how far from the x-start ;variable marioX
		mov si, 5
		l7:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l7
		mov cx, crownX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop7


	
		mov crownX,580
		mov ah, 0ch
		mov al, 14
		mov cx, 15	; height	
		mov dx, 70	; y-start; marioY start from base
		int 10h
		loop9:
		push cx
		mov cx, crownX	;how far from the x-start ;variable marioX
		mov si, 5
		l9:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l9
		mov cx, crownX	; setting col again
		inc crownX
		dec dx	; prev row
		int 10h
		int 10h
		pop cx
		loop loop9

		;bechwala kanta

		mov crownX,545
		mov ah, 0ch
		mov al, 14
		mov cx, 15	; height	
		mov dx, 70	; y-start; marioY start from base
		int 10h
		loop10:
		push cx
		mov cx, crownX	;how far from the x-start ;variable marioX
		mov si, 5
		l10:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l10
		mov cx, crownX	; setting col again
		inc crownX
		dec dx	; prev row
		int 10h
		int 10h
		pop cx
		loop loop10

		mov crownX,560
		mov ah, 0ch
		mov al, 14
		mov cx, 15	; height	
		mov dx, 55	; y-start; marioY
		int 10h
		loop11:
		push cx
		mov cx, crownX	;how far from the x-start ;variable marioX
		mov si, 5
		l11:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l11
		mov cx, crownX	; setting col again
		add crownX,1
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop11


	
	


ret
drawflag endp

hurdletops proc
		; hurdle 1
		mov ah, 0ch
		mov al, 13
		mov cx, 18	;responsible for the pixel in the start
		mov dx, 265
		int 10h

		h1:
		push cx
		mov cx, 318	;how far the hurdle is from the starting

		mov si, 35
		l2:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, 328	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h1


		;hurdle 2
		mov ah, 0ch
		mov al, 13
		mov cx, 15	; height of hurdle && responsible for the pixel in the start
		mov dx, 300	; start point of the hurdle alog y axis
		int 10h

		h3:
		push cx
		mov cx, 144	;how far the hurdle is from the starting

		mov si, 32
		l3:
		inc cx		; thickness of the flag
		int 10h
		dec si
		cmp si, 0
		jge l3

		mov cx, 144	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h3


		;hurdle 3
		mov ah, 0ch
		mov al, 13
		mov cx, 18	;responsible for the pixel in the start
		mov dx, 290
		int 10h

		h4:
		push cx
		mov cx, 473	;how far the hurdle is from the starting

		mov si, 35
		l4:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l4 

		mov cx, 473	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h4

hurdletops endp



hurdle1 proc

		;;base
		mov ah, 0ch
		mov al, 6
		mov cx, 59	; height of the hurdle	// responsible 
		mov dx, 283	; starting of the hurdle		(along y-axis)
		int 10h

		h2:
		push cx
		mov cx, 325	;how far the hurdle is from the starting

		mov si, 20
		l3:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l3

		mov cx, 335	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h2


		;top wali cheez
		mov ah, 0ch
		mov al, 13
		mov cx, 18	;responsible for the pixel in the start
		mov dx, 265
		int 10h

		h1:
		push cx
		mov cx, 318	;how far the hurdle is from the starting

		mov si, 35
		l2:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, 328	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h1

 


		ret 
hurdle1 endp



hurdle2 proc


		mov ah, 0ch
		mov al, 6
		mov cx, 27	; height of the hurdle	// responsible 
		mov dx, 315	; starting of the hurdle		(along y-axis)
		int 10h

		h2:
		push cx
		mov cx, 150	;how far the hurdle is from the starting

		mov si, 20
		l3:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l3

		mov cx, 150	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h2



		mov ah, 0ch
		mov al, 13
		mov cx, 15	; height of hurdle && responsible for the pixel in the start
		mov dx, 300	; start point of the hurdle alog y axis
		int 10h

		h1:
		push cx
		mov cx, 144	;how far the hurdle is from the starting

		mov si, 32
		l2:
		inc cx		; thickness of the flag
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, 144	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h1


		ret 
hurdle2 endp






hurdle3 proc


		mov ah, 0ch
		mov al, 6
		mov cx, 34	; height of the hurdle	// responsible 
		mov dx, 308	; starting of the hurdle		(along y-axis)
		int 10h

		h2:
		push cx
		mov cx, 480	;how far the hurdle is from the starting

		mov si, 20
		l3:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l3

		mov cx, 480	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h2



		mov ah, 0ch
		mov al, 13
		mov cx, 18	;responsible for the pixel in the start
		mov dx, 290
		int 10h

		h1:
		push cx
		mov cx, 473	;how far the hurdle is from the starting

		mov si, 35
		l2:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, 473	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h1


		ret 
hurdle3 endp


grass proc

		;;base
		mov ah, 0ch
		mov al, 10
		mov cx, 80	; height of the hurdle	// responsible 
		mov dx, 342	; starting of the hurdle		(along y-axis)
		int 10h

		h2:
		push cx
		mov cx, 0	;how far the hurdle is from the starting

		mov si, 650
		l3:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l3

		mov cx, 0	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h2


		ret 
grass endp


mama proc

		mov bx, marioX
		mov savemarioX,bx
		mov bx, marioY
		mov savemarioY,bx
		mov bx,0


		
		mov bx, marioX
		mov clearsaveX,bx
		mov bx, marioY
		mov clearsaveY,bx
		mov bx,0
	
	
	
		;head
		mov ah, 0ch
		mov al, 3
		mov cx, 12	; height	
		mov dx, marioY	; y-start; marioY
		int 10h

		loop2:
		push cx
		mov cx, marioX	;how far from the x-start ;variable marioX

		mov si, 10
		l2:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop2
		;body

		mov bx,12
		add marioY,bx
		mov bx,4
		sub marioX,bx

		mov ah, 0ch
		mov al, 0ch
		mov cx, 18	; height	
		mov dx, marioY	; marioY +15
		int 10h

		loop3:
		push cx
		mov cx, marioX	;how far from the start ;marioX-5

		mov si, 19
		l3:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l3 

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop3

		;legs1

		mov bx,18
		add marioY,bx
		mov bx,4
		add marioX,bx

		mov ah, 0ch
		mov al, 8
		mov cx, 12	; height	
		mov dx, marioY	; marioY+45
		int 10h

		loop4:
		push cx
		mov cx,marioX 	;how far from the start; marioX+1

		mov si, 3
		l4:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l4 

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop4

		;legs2

		mov bx,8
		add marioX,bx

		mov ah, 0ch
		mov al, 8
		mov cx, 12	; height	
		mov dx, marioY	; marioY+45
		int 10h

		loop5:
		push cx
		mov cx,marioX 	;how far from the start;marioX+11

		mov si, 3
		l5:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l5 

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop5

		mov bx, savemarioX
		mov marioX,bx
		mov bx, savemarioY
		mov marioY,bx
		mov bx,0

		ret

mama endp


clearmama proc

		mov bx, marioX
		mov savemarioX,bx
		mov bx, marioY
		mov savemarioY,bx
		mov bx,0

		mov bx, clearsaveX 
		mov marioX,bx
		mov bx, clearsaveY
		mov marioY,bx
		mov bx,0




	
	
		;head
		mov ah, 0ch
		mov al, 0
		mov cx, 12	; height	
		mov dx, marioY	; y-start; marioY
		int 10h

		loop2:
		push cx
		mov cx, marioX	;how far from the x-start ;variable marioX

		mov si, 10
		l2:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop2
		;body

		mov bx,12
		add marioY,bx
		mov bx,4
		sub marioX,bx

		mov ah, 0ch
		mov al, 0
		mov cx, 18	; height	
		mov dx, marioY	; marioY +15
		int 10h

		loop3:
		push cx
		mov cx, marioX	;how far from the start ;marioX-5

		mov si, 19
		l3:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l3 

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop3

		;legs1

		mov bx,18
		add marioY,bx
		mov bx,4
		add marioX,bx

		mov ah, 0ch
		mov al, 0
		mov cx, 12	; height	
		mov dx, marioY	; marioY+45
		int 10h

		loop4:
		push cx
		mov cx,marioX 	;how far from the start; marioX+1

		mov si, 3
		l4:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l4 

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop4

		;legs2

		mov bx,8
		add marioX,bx

		mov ah, 0ch
		mov al, 0
		mov cx, 12	; height	
		mov dx, marioY	; marioY+45
		int 10h

		loop5:
		push cx
		mov cx,marioX 	;how far from the start;marioX+11

		mov si, 3
		l5:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l5 

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop5

		mov bx, savemarioX
		mov marioX,bx
		mov bx, savemarioY
		mov marioY,bx
		mov bx,0

		ret

clearmama endp


clearscreen proc

		MOV AL,03
		MOV AH,0
		INT 10H
		ret

clearscreen endp

tabahiJump proc

		

		mov cx, 20
		l12:
			push cx
			mov bx, 4
			add marioX,bx
			
			add bx,4
			sub marioY,bx
			mov bx,0
			call clearmama
			call mama
			pop cx
			

		loop l12

		mov cx, 20
		l13:
			push cx
			mov bx, 4
			add marioX,bx
			add bx,4
			add marioY,bx
			mov bx,0
			call clearmama
			call mama
			pop cx
			

		loop l13



		ret

tabahiJump endp


end main
