.model small
;i170092 17285
.stack 100h
.data

x word ?
y word ?
r1 word 50
c1 word 280
var word ?

cloudX word 0
cloudY word 0

marioX word 0
savemarioX word 0
clearsaveX word 0
marioY word 0
savemarioY word 0
clearsaveY word 0


enemyX1 word 0
prevenemyX1 word 0
enemyY1 word 0
prevenemyY1 word 0

enemyX2 word 0
prevenemyX2 word 0
enemyY2 word 0
prevenemyY2 word 0


enemyXC word 0
prevenemyXC word 0
enemyYC word 0
prevenemyYC word 0

count word 2


timer word 0



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

		mov cloudX,180
		mov cloudY,60 
		call cloud
		call drawflag

;-----------------------------------------------------------------level1


		start1:


		call drawflag

		call hurdle1

		call hurdle2

		call hurdle3

		call grass

		call clearmama

		mov marioX,20
		mov marioY, 300

		;mov enemyX,220
		;mov enemyY, 293
		;call  goomba

		;mov enemyX,420
		;mov enemyY, 293
		;call goomba

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

			cmp al,'N'     ;E key pressed
			je start1
			cmp al,'n'     ;E key pressed
			je start1

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

				cmp marioX,80  ;hurdles2
				je rukawat22

				cmp marioX,340  ;hurdles1
				je rukawat11

				cmp marioX,500   ;hurdles3
				je rukawat33

				cmp marioX,600   ;flag
				je start2

				jmp noRukawatt
				
				rukawat11:
					mov bx,5
					add marioX,bx

					call hurdle1
					call clearmama
					call mama

					
					
					jmp again

				rukawat22:
					mov bx,5
					add marioX,bx
					
					call hurdle2
					call clearmama
					call mama

					jmp again

				rukawat33:
					mov bx,5
					add marioX,bx
					
					call hurdle3
					call clearmama
					call mama

					jmp again		
					
				noRukawatt:
					mov bx,5
					sub marioX,bx

					call clearmama
					call mama
					call hurdletops


					cmp marioX,105  ;hurdles2
					je rukawat22

					cmp marioX,340  ;hurdles1
					je rukawat11

					cmp marioX,500   ;hurdles3
					je rukawat33

					cmp marioX,600   ;flag
					je exit



					jmp again

			rightKeyPressed:
				
				cmp marioX,60  ;hurdles2
				je rukawat2

				cmp marioX,310  ;hurdles1
				je rukawat1

				cmp marioX,465   ;hurdles3
				je rukawat3

				cmp marioX,600   ;flag
				je start2
				jmp noRukawat
				
				rukawat1:
					mov bx,5
					sub marioX,bx

					call hurdle1
					call clearmama
					call mama
					
					jmp again

				rukawat2:
					mov bx,5
					sub marioX,bx
					
					call hurdle2
					call clearmama
					call mama

					jmp again

				rukawat3:
					mov bx,5
					sub marioX,bx
					
					call hurdle3
					call clearmama
					call mama

					jmp again		
					
				noRukawat:
					mov bx,5
					add marioX,bx

					call clearmama
					call mama

					call hurdletops


					cmp marioX,80  ;hurdles2
					je rukawat22

					cmp marioX,340  ;hurdles1
					je rukawat11

					cmp marioX,500   ;hurdles3
					je rukawat33

					cmp marioX,600   ;flag
					je start2
				

				jmp again
	
			upKeyPressed:  ;saray paisay iskay hain
				cmp marioX,150  ;hurdles
				je exit

				cmp marioX,320
				je exit

				cmp marioX,480
				je exit

				cmp marioX,620   ;flag
				je start2
	
				call hurdletops
				call clearmama
				call tabahiJump
				


				;call hurdle1
				;call hurdle2
				;call hurdle3
				;call drawflag


				jmp again


			

			jmp again

;-----------------------------------------------------------------level2
			
			start2:

						
						call hurdle1

						call hurdle2

						call hurdle3

						call grass

			

			start22:

						
						

						

						call clearmama

						mov marioX,20
						mov marioY, 300

						mov enemyX1,300  
						mov enemyY1, 293
						call  goomba1

						mov enemyX2,445
						mov enemyY2, 293
						call goomba2

						call mama

						;sari game iski hai

						again2:
							
							add count,1
							
							cmp count,2000000000
							ja block
							jmp no

							
							

						block:

							
							
							cmp count,2000000000
							ja nunu

							call drawrect2
							call drawrect1

							jmp no	


							nunu:
							mov count,0
							sub enemyX1,5
							call clearmama
							call mama
							call drawrect2
							call drawrect1
							
							call goomba1
							
							sub enemyX2,5
							
							call goomba2

							call clearmama
							call mama
							

							
							
							jmp no
							
							no:

							mov ah,01     ;checking for key press
							int 16h
							JZ again2      ;if no key is pressed
							mov ah,0      ;getting chracter
							int 16h

							
							

							cmp al,'E'     ;E key pressed
							je exit
							cmp al,'e'     ;E key pressed
							je exit

							cmp al,'N'     ;E key pressed
							je start22
							cmp al,'n'     ;E key pressed
							je start22

							cmp ax,4B00h    ;left key pressed
							je leftKeyPressed2

							cmp ax,4D00h     ;right key pressed
							je rightKeyPressed2

							cmp ax,4800h  ;up key pressed
							je upKeyPressed2
							jmp again2

							cmp marioX,620
								je exit

							leftKeyPressed2:

								cmp marioX,80  ;hurdles2
								je rukawat222

								cmp marioX,340  ;hurdles1
								je rukawat112

								cmp marioX,500   ;hurdles3
								je rukawat332

								cmp marioX,600   ;flag
								je start22

								jmp noRukawatt2
				
								rukawat112:
									mov bx,5
									add marioX,bx

									call hurdle1
									call clearmama
									call mama

					
					
									jmp again2

								rukawat222:
									mov bx,5
									add marioX,bx
					
									call hurdle2
									call clearmama
									call mama

									jmp again2

								rukawat332:
									mov bx,5
									add marioX,bx
					
									call hurdle3
									call clearmama
									call mama

									jmp again2		
					
								noRukawatt2:
									mov bx,5
									sub marioX,bx

									call clearmama
									call mama
									call hurdletops


									cmp marioX,105  ;hurdles2
									je rukawat222

									cmp marioX,340  ;hurdles1
									je rukawat112

									cmp marioX,500   ;hurdles3
									je rukawat332

									cmp marioX,600   ;flag
									je exit



									jmp again2

							rightKeyPressed2:
				
								cmp marioX,60  ;hurdles2
								je rukawat2222

								cmp marioX,310  ;hurdles1
								je rukawat12

								cmp marioX,465   ;hurdles3
								je rukawat32

								cmp marioX,600   ;flag
								je start22
								jmp noRukawat2
				
								rukawat12:
									mov bx,5
									sub marioX,bx

									call hurdle1
									call clearmama
									call mama
					
									jmp again2

								rukawat2222:
									mov bx,5
									sub marioX,bx
					
									call hurdle2
									call clearmama
									call mama

									jmp again2

								rukawat32:
									mov bx,5
									sub marioX,bx
					
									call hurdle3
									call clearmama
									call mama

									jmp again2		
					
								noRukawat2:
									mov bx,5
									add marioX,bx

									call clearmama
									call mama

									call hurdletops


									cmp marioX,80  ;hurdles2
									je rukawat222

									cmp marioX,340  ;hurdles1
									je rukawat112

									cmp marioX,500   ;hurdles3
									je rukawat332

									cmp marioX,600   ;flag
									je exit
				

								jmp again2
	
							upKeyPressed2:  ;saray paisay iskay hain
								cmp marioX,150  ;hurdles
								je exit

								cmp marioX,320
								je exit

								cmp marioX,480
								je exit

								cmp marioX,620   ;flag
								je exit
	
								call hurdletops
								call clearmama
								call tabahiJump
				


								;call hurdle1
								;call hurdle2
								;call hurdle3
								;call drawflag


								jmp again2


			

							jmp again2
	

;-----------------------------------------------------------------exit

exit:
mov ah, 4ch
int 10h

main endp

;------------------------------------------------------------------objects



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


drawrect1 proc
		
		mov ah, 0ch
		mov al, 0
		mov cx, 49	; height	
		mov dx, 293	; y-start; marioY
		int 10h

		loop2:
		push cx
		mov cx, 342	;how far from the x-start ;variable marioX

		mov si, 134    ;xaxis
		l2:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, 342	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop2

drawrect1 endp


drawrect2 proc
		
		mov ah, 0ch
		mov al, 0
		mov cx, 49	; height	
		mov dx, 293	; y-start; marioY
		int 10h

		loop2:
		push cx
		mov cx, 100	;how far from the x-start ;variable marioX

		mov si, 222    ;xaxis
		l2:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, 100	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop2

drawrect2 endp


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
		; hurdle1
		mov ah, 0ch
		mov al, 13
		mov cx, 18	;responsible for the pixel in the start
		mov dx, 265
		int 10h

		h1:
		push cx
		mov cx, 327	;how far the hurdle is from the starting

		mov si, 18
		l2:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, 327	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h1


		;hurdle2
		mov ah, 0ch
		mov al, 13
		mov cx, 15	; height of hurdle && responsible for the pixel in the start
		mov dx, 300	; start point of the hurdle alog y axis
		int 10h

		h3:
		push cx
		mov cx, 77	;how far the hurdle is from the starting

		mov si, 18
		l3:
		inc cx		; thickness of the flag
		int 10h
		dec si
		cmp si, 0
		jge l3

		mov cx, 77	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h3


		;hurdle3
		mov ah, 0ch
		mov al, 13
		mov cx, 18	;responsible for the pixel in the start
		mov dx, 290
		int 10h

		h4:
		push cx
		mov cx, 478	;how far the hurdle is from the starting

		mov si, 20
		l4:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l4 

		mov cx, 478	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h4

hurdletops endp



hurdle1 proc ; middle

		;;base
		mov ah, 0ch
		mov al, 6
		mov cx, 59	; height of the hurdle	// responsible 
		mov dx, 283	; starting of the hurdle		(along y-axis)
		int 10h

		h2:
		push cx
		mov cx, 325	;how far the hurdle is from the starting

		mov si, 15
		l3:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l3

		mov cx, 325	; setting col again
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
		mov cx, 322	;how far the hurdle is from the starting

		mov si, 20
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



hurdle2 proc ;left wala


		mov ah, 0ch
		mov al, 6
		mov cx, 27	; height of the hurdle	// responsible 
		mov dx, 315	; starting of the hurdle		(along y-axis)
		int 10h

		h2:
		push cx
		mov cx, 80	;how far the hurdle is from the starting

		mov si, 15
		l3:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l3

		mov cx, 80	; setting col again
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
		mov cx, 77	;how far the hurdle is from the starting

		mov si, 20
		l2:
		inc cx		; thickness of the flag
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, 77	; setting col again
		inc dx	; going to the next row
		int 10h
		int 10h
		pop cx
		loop h1


		ret 
hurdle2 endp






hurdle3 proc ;right wala


		mov ah, 0ch
		mov al, 6
		mov cx, 34	; height of the hurdle	// responsible 
		mov dx, 308	; starting of the hurdle		(along y-axis)
		int 10h

		h2:
		push cx
		mov cx, 480	;how far the hurdle is from the starting

		mov si, 15
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
		mov cx, 477	;how far the hurdle is from the starting

		mov si, 20
		l2:
		inc cx		; thickness of the hurdle
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, 477	; setting col again
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
			mov bx, 2
			add marioX,bx
			
			add bx,6
			sub marioY,bx
			mov bx,0
			call clearmama
			call mama
			pop cx
			

		loop l12

		mov cx, 20
		l13:
			push cx
			mov bx, 2
			add marioX,bx
			add bx,6
			add marioY,bx
			mov bx,0
			call clearmama
			call mama
			pop cx
			

		loop l13



		ret

tabahiJump endp



goomba1 proc

			
			
			mov bx, enemyX1
			mov prevenemyX1, bx
			mov bx, enemyY1
			mov prevenemyY1, bx

			mov var, 10	; thickness

			mov bx,  0

			baraloop:


			mov ah, 0ch
			mov al, 6
			mov cx, 4	; height
			mov dx, enemyY1	; starting y
			int 10h

			l1:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			l2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l2


			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop l1





			add enemyY1, 4
			sub enemyX1, 4
			add var, 8	; double of addition in x


			inc bx

			cmp bx, 3
			jl baraloop

	

			mov ah, 0ch
			mov al, 6
			mov cx, 6	; height
			mov dx, enemyY1	; starting y
			int 10h

			l3:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			l4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l4


			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop l3


			add enemyY1, 6
			sub enemyX1, 4
			add var, 8

			mov ah, 0ch
			mov al, 6
			mov cx, 10	; height
			mov dx, enemyY1	; starting y
			int 10h

			l5:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			l6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l6


			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop l5



			add enemyX1, 10
			add enemyY1, 10
			mov var, 20

			mov ah, 0ch
			mov al, 15
			mov cx, 12	; height
			mov dx, enemyY1	; starting y
			int 10h

			g1:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			g2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g2


			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop g1






			sub enemyX1, 5
			mov var, 10

			mov ah, 0ch
			mov al, 6
			mov cx, 3	; height
			mov dx, enemyY1	; starting y
			int 10h

			l7:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			l8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l8


			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop l7



			add enemyX1, 22

			mov ah, 0ch
			mov al, 6
			mov cx, 3	; height
			mov dx, enemyY1	; starting y
			int 10h

			l9:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			l10:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l10


			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop l9



			; feet of enemy
			add enemyY1, 10
			sub enemyX1, 23
			mov var, 10

			mov ah, 0ch
			mov al, 8	;IDHAR
			mov cx, 5; height
			mov dx, enemyY1	; starting y
			int 10h

			g3:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			g4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g4


			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop g3



			add enemyX1, 3
			add enemyY1, 3	;height of the previios block
			mov var, 10

			mov ah, 0ch
			mov al, 8
			mov cx, 7; height
			mov dx, enemyY1	; starting y
			int 10h

			g5:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			g6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g6


			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop g5




			add enemyX1, 17
			mov var, 12	;thickness

			mov ah, 0ch
			mov al, 8
			mov cx, 7; height
			mov dx, enemyY1	; starting y
			int 10h

			g7:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			g8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g8

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop g7


			sub enemyY1, 5
			mov var, 15	;thickness

			mov ah, 0ch
			mov al, 8
			mov cx, 5; height
			mov dx, enemyY1	; starting y
			int 10h

			g9:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			g10:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g10

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop g9





			sub enemyY1, 5
			mov var, 5	;thickness
			add enemyX1, 5

			mov ah, 0ch
			mov al, 8
			mov cx, 5; height
			mov dx, enemyY1	; starting y
			int 10h

			gom:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			gom1:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge gom1

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop gom




			; eyes
			sub enemyX1, 18
			sub enemyY1, 25
			mov var, 3

			mov ah, 0ch
			mov al, 8
			mov cx, 3; height
			mov dx, enemyY1	; starting y
			int 10h

			gom3:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			gom4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge gom4

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop gom3



			add enemyX1, 15

			mov ah, 0ch
			mov al, 8
			mov cx, 3; height
			mov dx, enemyY1	; starting y
			int 10h

			gom5:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			gom6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge gom6

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop gom5





			sub enemyX1, 12
			add enemyY1,3


			mov ah, 0ch
			mov al, 8
			mov cx, 3; height
			mov dx, enemyY1	; starting y
			int 10h

			gom7:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			gom8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge gom8

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop gom7








			add enemyX1, 10


			mov ah, 0ch
			mov al, 8
			mov cx, 3; height
			mov dx, enemyY1	; starting y
			int 10h

			en1:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			en2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge en2

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop en1


			add enemyY1, 3
			sub enemyX1, 8
			mov var, 8

			mov ah, 0ch
			mov al, 8
			mov cx, 3; height
			mov dx, enemyY1	; starting y
			int 10h

			en3:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			en4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge en4

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop en3






			sub enemyX1, 7
			mov var, 3

			mov ah, 0ch
			mov al, 15
			mov cx, 10; height
			mov dx, enemyY1	; starting y
			int 10h

			en5:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			en6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge en6

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop en5




			add enemyX1, 17
			mov var, 3

			mov ah, 0ch
			mov al, 15
			mov cx, 10; height
			mov dx, enemyY1	; starting y
			int 10h

			en7:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			en8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge en8

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop en7




			sub enemyX1, 3
			add enemyY1, 3
			mov var, 2

			mov ah, 0ch
			mov al, 15
			mov cx, 7; height
			mov dx, enemyY1	; starting y
			int 10h

			k1:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			k2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k2

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop k1






			sub enemyX1, 10
			mov var, 2

			mov ah, 0ch
			mov al, 15
			mov cx, 7; height
			mov dx, enemyY1	; starting y
			int 10h

			k3:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			k4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k4

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop k3






			sub enemyX1, 2
			sub enemyY1, 4
			mov var, 1


			mov ah, 0ch
			mov al, 8
			mov cx, 8; height
			mov dx, enemyY1	; starting y
			int 10h

			k5:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			k6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k6

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop k5





			add enemyX1, 15


			mov ah, 0ch
			mov al, 8
			mov cx, 8; height
			mov dx, enemyY1	; starting y
			int 10h

			k7:
			push cx
			mov cx, enemyX1	;starting x

			mov si, var	; thickness of enemy
			k8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k8

			mov cx, enemyX1
			inc dx
			int 10h
			int 10h
			pop cx
			loop k7


			mov bx, prevenemyX1
			mov enemyX1, bx
			mov bx, prevenemyY1
			mov enemyY1, bx

			ret
goomba1 endp





goomba2 proc


			mov bx, enemyX2
			mov prevenemyX2, bx
			mov bx, enemyY2
			mov prevenemyY2, bx

			mov var, 10	; thickness

			mov bx,  0

			baraloop:


			mov ah, 0ch
			mov al, 6
			mov cx, 4	; height
			mov dx, enemyY2	; starting y
			int 10h

			l1:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			l2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l2


			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop l1





			add enemyY2, 4
			sub enemyX2, 4
			add var, 8	; double of addition in x


			inc bx

			cmp bx, 3
			jl baraloop

	

			mov ah, 0ch
			mov al, 6
			mov cx, 6	; height
			mov dx, enemyY2	; starting y
			int 10h

			l3:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			l4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l4


			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop l3


			add enemyY2, 6
			sub enemyX2, 4
			add var, 8

			mov ah, 0ch
			mov al, 6
			mov cx, 10	; height
			mov dx, enemyY2	; starting y
			int 10h

			l5:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			l6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l6


			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop l5



			add enemyX2, 10
			add enemyY2, 10
			mov var, 20

			mov ah, 0ch
			mov al, 15
			mov cx, 12	; height
			mov dx, enemyY2	; starting y
			int 10h

			g1:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			g2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g2


			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop g1






			sub enemyX2, 5
			mov var, 10

			mov ah, 0ch
			mov al, 6
			mov cx, 3	; height
			mov dx, enemyY2	; starting y
			int 10h

			l7:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			l8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l8


			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop l7



			add enemyX2, 22

			mov ah, 0ch
			mov al, 6
			mov cx, 3	; height
			mov dx, enemyY2	; starting y
			int 10h

			l9:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			l10:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l10


			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop l9



			; feet of enemy
			add enemyY2, 10
			sub enemyX2, 23
			mov var, 10

			mov ah, 0ch
			mov al, 8	;IDHAR
			mov cx, 5; height
			mov dx, enemyY2	; starting y
			int 10h

			g3:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			g4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g4


			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop g3



			add enemyX2, 3
			add enemyY2, 3	;height of the previios block
			mov var, 10

			mov ah, 0ch
			mov al, 8
			mov cx, 7; height
			mov dx, enemyY2	; starting y
			int 10h

			g5:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			g6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g6


			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop g5




			add enemyX2, 17
			mov var, 12	;thickness

			mov ah, 0ch
			mov al, 8
			mov cx, 7; height
			mov dx, enemyY2	; starting y
			int 10h

			g7:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			g8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g8

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop g7


			sub enemyY2, 5
			mov var, 15	;thickness

			mov ah, 0ch
			mov al, 8
			mov cx, 5; height
			mov dx, enemyY2	; starting y
			int 10h

			g9:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			g10:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g10

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop g9





			sub enemyY2, 5
			mov var, 5	;thickness
			add enemyX2, 5

			mov ah, 0ch
			mov al, 8
			mov cx, 5; height
			mov dx, enemyY2	; starting y
			int 10h

			gom:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			gom1:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge gom1

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop gom




			; eyes
			sub enemyX2, 18
			sub enemyY2, 25
			mov var, 3

			mov ah, 0ch
			mov al, 8
			mov cx, 3; height
			mov dx, enemyY2	; starting y
			int 10h

			gom3:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			gom4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge gom4

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop gom3



			add enemyX2, 15

			mov ah, 0ch
			mov al, 8
			mov cx, 3; height
			mov dx, enemyY2	; starting y
			int 10h

			gom5:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			gom6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge gom6

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop gom5





			sub enemyX2, 12
			add enemyY2,3


			mov ah, 0ch
			mov al, 8
			mov cx, 3; height
			mov dx, enemyY2	; starting y
			int 10h

			gom7:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			gom8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge gom8

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop gom7








			add enemyX2, 10


			mov ah, 0ch
			mov al, 8
			mov cx, 3; height
			mov dx, enemyY2	; starting y
			int 10h

			en1:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			en2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge en2

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop en1


			add enemyY2, 3
			sub enemyX2, 8
			mov var, 8

			mov ah, 0ch
			mov al, 8
			mov cx, 3; height
			mov dx, enemyY2	; starting y
			int 10h

			en3:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			en4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge en4

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop en3






			sub enemyX2, 7
			mov var, 3

			mov ah, 0ch
			mov al, 15
			mov cx, 10; height
			mov dx, enemyY2	; starting y
			int 10h

			en5:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			en6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge en6

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop en5




			add enemyX2, 17
			mov var, 3

			mov ah, 0ch
			mov al, 15
			mov cx, 10; height
			mov dx, enemyY2	; starting y
			int 10h

			en7:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			en8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge en8

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop en7




			sub enemyX2, 3
			add enemyY2, 3
			mov var, 2

			mov ah, 0ch
			mov al, 15
			mov cx, 7; height
			mov dx, enemyY2	; starting y
			int 10h

			k1:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			k2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k2

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop k1






			sub enemyX2, 10
			mov var, 2

			mov ah, 0ch
			mov al, 15
			mov cx, 7; height
			mov dx, enemyY2	; starting y
			int 10h

			k3:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			k4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k4

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop k3






			sub enemyX2, 2
			sub enemyY2, 4
			mov var, 1


			mov ah, 0ch
			mov al, 8
			mov cx, 8; height
			mov dx, enemyY2	; starting y
			int 10h

			k5:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			k6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k6

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop k5





			add enemyX2, 15


			mov ah, 0ch
			mov al, 8
			mov cx, 8; height
			mov dx, enemyY2	; starting y
			int 10h

			k7:
			push cx
			mov cx, enemyX2	;starting x

			mov si, var	; thickness of enemy
			k8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k8

			mov cx, enemyX2
			inc dx
			int 10h
			int 10h
			pop cx
			loop k7

			mov bx, prevenemyX2
			mov enemyX2, bx
			mov bx, prevenemyY2
			mov enemyY2, bx

			


			ret
goomba2 endp







cloud proc

			mov var, 20

			mov bx, 0
			baraloop:

			mov ah, 0ch
			mov al, 15
			mov cx, 3; height
			mov dx, cloudY	; starting y
			int 10h

			k1:
			push cx
			mov cx, cloudX	;starting x

			mov si, var	; thickness 
			k2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k2

			mov cx, cloudX
			inc dx
			int 10h
			int 10h
			pop cx
			loop k1

			sub cloudX, 3
			add cloudY, 2
			add var, 6

			inc bx
			cmp bx, 6
			jle baraloop











			sub cloudY, 10
			add cloudX, 60
			mov bx, 0
			mov var, 20
			baraloop2:

			mov ah, 0ch
			mov al, 15
			mov cx, 3; height
			mov dx, cloudY	; starting y
			int 10h

			k3:
			push cx
			mov cx, cloudX	;starting x

			mov si, var	; thickness 
			k4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k4

			mov cx, cloudX
			inc dx
			int 10h
			int 10h
			pop cx
			loop k3

			sub cloudX, 3
			add cloudY, 2
			add var, 6

			inc bx
			cmp bx, 6
			jle baraloop2









			sub cloudX, 65
			sub cloudY, 14
			mov bx, 0
			mov var, 20
			baraloop3:

			mov ah, 0ch
			mov al, 15
			mov cx, 3; height
			mov dx, cloudY	; starting y
			int 10h

			k5:
			push cx
			mov cx, cloudX	;starting x

			mov si, var	; thickness 
			k6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k6

			mov cx, cloudX
			inc dx
			int 10h
			int 10h
			pop cx
			loop k5

			sub cloudX, 3
			add cloudY, 2
			add var, 6

			inc bx
			cmp bx, 6
			jle baraloop3






			add cloudX, 25
			sub cloudY, 3

			mov ah, 0ch
			mov al, 15
			mov cx, 4; height
			mov dx, cloudY	; starting y
			int 10h

			k7:
			push cx
			mov cx, cloudX	;starting x

			mov si, var	; thickness 
			k8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k8

			mov cx, cloudX
			inc dx
			int 10h
			int 10h
			pop cx
			loop k7










			secondcloud:

			mov var, 20
			add cloudX, 250
			sub cloudY, 50

			mov bx, 0
			baraloop5:

			mov ah, 0ch
			mov al, 15
			mov cx, 3; height
			mov dx, cloudY	; starting y
			int 10h

			cl1:
			push cx
			mov cx, cloudX	;starting x

			mov si, var	; thickness 
			c2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge c2

			mov cx, cloudX
			inc dx
			int 10h
			int 10h
			pop cx
			loop cl1

			sub cloudX, 3
			add cloudY, 2
			add var, 6

			inc bx
			cmp bx, 6
			jle baraloop5











			sub cloudY, 10
			add cloudX, 60
			mov bx, 0
			mov var, 20
			baraloop6:

			mov ah, 0ch
			mov al, 15
			mov cx, 3; height
			mov dx, cloudY	; starting y
			int 10h

			c3:
			push cx
			mov cx, cloudX	;starting x

			mov si, var	; thickness 
			c4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge c4

			mov cx, cloudX
			inc dx
			int 10h
			int 10h
			pop cx
			loop c3

			sub cloudX, 3
			add cloudY, 2
			add var, 6

			inc bx
			cmp bx, 6
			jle baraloop6









			sub cloudX, 65
			sub cloudY, 14
			mov bx, 0
			mov var, 20
			baraloop7:

			mov ah, 0ch
			mov al, 15
			mov cx, 3; height
			mov dx, cloudY	; starting y
			int 10h

			c5:
			push cx
			mov cx, cloudX	;starting x

			mov si, var	; thickness 
			c6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge c6

			mov cx, cloudX
			inc dx
			int 10h
			int 10h
			pop cx
			loop c5

			sub cloudX, 3
			add cloudY, 2
			add var, 6

			inc bx
			cmp bx, 6
			jle baraloop7






			add cloudX, 25
			sub cloudY, 3

			mov ah, 0ch
			mov al, 15
			mov cx, 4; height
			mov dx, cloudY	; starting y
			int 10h

			c7:
			push cx
			mov cx, cloudX	;starting x

			mov si, var	; thickness 
			c8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge c8

			mov cx, cloudX
			inc dx
			int 10h
			int 10h
			pop cx
			loop c7


			ret
cloud endp



cleargoomba proc
			
			mov bx, enemyXC
			mov prevenemyXC, bx
			mov bx, enemyYC
			mov prevenemyYC, bx

			mov var, 10	; thickness

			mov bx,  0

			baraloop:


			mov ah, 0ch
			mov al, 0
			mov cx, 4	; height
			mov dx, enemyYC	; starting y
			int 10h

			l1:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			l2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l2


			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop l1





			add enemyYC, 4
			sub enemyXC, 4
			add var, 8	; double of addition in x


			inc bx

			cmp bx, 3
			jl baraloop

	

			mov ah, 0ch
			mov al, 0
			mov cx, 6	; height
			mov dx, enemyYC	; starting y
			int 10h

			l3:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			l4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l4


			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop l3


			add enemyYC, 6
			sub enemyXC, 4
			add var, 8

			mov ah, 0ch
			mov al, 0
			mov cx, 10	; height
			mov dx, enemyYC	; starting y
			int 10h

			l5:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			l6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l6


			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop l5



			add enemyXC, 10
			add enemyYC, 10
			mov var, 20

			mov ah, 0ch
			mov al, 0
			mov cx, 12	; height
			mov dx, enemyYC	; starting y
			int 10h

			g1:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			g2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g2


			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop g1






			sub enemyXC, 5
			mov var, 10

			mov ah, 0ch
			mov al, 0
			mov cx, 3	; height
			mov dx, enemyYC	; starting y
			int 10h

			l7:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			l8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l8


			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop l7



			add enemyXC, 22

			mov ah, 0ch
			mov al, 0
			mov cx, 3	; height
			mov dx, enemyYC	; starting y
			int 10h

			l9:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			l10:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge l10


			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop l9



			; feet of enemy
			add enemyYC, 10
			sub enemyXC, 23
			mov var, 10

			mov ah, 0ch
			mov al, 0	;IDHAR
			mov cx, 5; height
			mov dx, enemyYC	; starting y
			int 10h

			g3:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			g4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g4


			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop g3



			add enemyXC, 3
			add enemyYC, 3	;height of the previios block
			mov var, 10

			mov ah, 0ch
			mov al, 0
			mov cx, 7; height
			mov dx, enemyYC	; starting y
			int 10h

			g5:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			g6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g6


			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop g5




			add enemyXC, 17
			mov var, 12	;thickness

			mov ah, 0ch
			mov al, 0
			mov cx, 7; height
			mov dx, enemyYC	; starting y
			int 10h

			g7:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			g8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g8

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop g7


			sub enemyYC, 5
			mov var, 15	;thickness

			mov ah, 0ch
			mov al, 0
			mov cx, 5; height
			mov dx, enemyYC	; starting y
			int 10h

			g9:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			g10:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge g10

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop g9





			sub enemyYC, 5
			mov var, 5	;thickness
			add enemyXC, 5

			mov ah, 0ch
			mov al, 0
			mov cx, 5; height
			mov dx, enemyYC	; starting y
			int 10h

			gom:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			gom1:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge gom1

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop gom




			; eyes
			sub enemyXC, 18
			sub enemyYC, 25
			mov var, 3

			mov ah, 0ch
			mov al,0
			mov cx, 3; height
			mov dx, enemyYC	; starting y
			int 10h

			gom3:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			gom4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge gom4

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop gom3



			add enemyXC, 15

			mov ah, 0ch
			mov al, 0
			mov cx, 3; height
			mov dx, enemyYC	; starting y
			int 10h

			gom5:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			gom6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge gom6

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop gom5





			sub enemyXC, 12
			add enemyYC,3


			mov ah, 0ch
			mov al, 0
			mov cx, 3; height
			mov dx, enemyYC	; starting y
			int 10h

			gom7:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			gom8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge gom8

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop gom7








			add enemyXC, 10


			mov ah, 0ch
			mov al, 0
			mov cx, 3; height
			mov dx, enemyYC	; starting y
			int 10h

			en1:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			en2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge en2

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop en1


			add enemyYC, 3
			sub enemyXC, 8
			mov var, 8

			mov ah, 0ch
			mov al, 0
			mov cx, 3; height
			mov dx, enemyYC	; starting y
			int 10h

			en3:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			en4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge en4

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop en3






			sub enemyXC, 7
			mov var, 3

			mov ah, 0ch
			mov al, 0
			mov cx, 10; height
			mov dx, enemyYC	; starting y
			int 10h

			en5:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			en6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge en6

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop en5




			add enemyXC, 17
			mov var, 3

			mov ah, 0ch
			mov al, 0
			mov cx, 10; height
			mov dx, enemyYC	; starting y
			int 10h

			en7:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			en8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge en8

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop en7




			sub enemyXC, 3
			add enemyYC, 3
			mov var, 2

			mov ah, 0ch
			mov al, 0
			mov cx, 7; height
			mov dx, enemyYC	; starting y
			int 10h

			k1:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			k2:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k2

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop k1






			sub enemyXC, 10
			mov var, 2

			mov ah, 0ch
			mov al, 0
			mov cx, 7; height
			mov dx, enemyYC	; starting y
			int 10h

			k3:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			k4:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k4

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop k3






			sub enemyXC, 2
			sub enemyYC, 4
			mov var, 1


			mov ah, 0ch
			mov al, 0
			mov cx, 8; height
			mov dx, enemyYC	; starting y
			int 10h

			k5:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			k6:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k6

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop k5





			add enemyXC, 15


			mov ah, 0ch
			mov al, 0
			mov cx, 8; height
			mov dx, enemyYC	; starting y
			int 10h

			k7:
			push cx
			mov cx, enemyXC	;starting x

			mov si, var	; thickness of enemy
			k8:
			inc cx
			int 10h
			dec si
			cmp si,0
			jge k8

			mov cx, enemyXC
			inc dx
			int 10h
			int 10h
			pop cx
			loop k7


			mov bx, prevenemyXC
			mov enemyX1, bx
			mov bx, prevenemyYC
			mov enemyY1, bx

			ret
cleargoomba endp



end main
