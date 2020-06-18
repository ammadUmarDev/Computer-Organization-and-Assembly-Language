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

drawrect1X word 428
drawrect1Y word 293

drawrect2X word 283
drawrect2Y word 293


castleY word 0
castleX word 0

dragonY word 0
dragonX word 0
prevdragonX word 0
prevdragonY word 0
level3 word 0

prevFX word 0
prevFY word 0
fireX word 0
fireY word 0

count word 2
firecount word 0

Factivate word 0

timer word 0



crownX word 0;

screen word 0


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

		mov screen,0
		call Cstart00
		kaka00:

				add screen,1

				cmp screen,100000000
				je nkaka00
				jmp kaka00
		
		nkaka00:
		call clearscreen



		mov screen,0
		call Cstart0
		kaka1:

				add screen,1

				cmp screen,100000000
				je nkaka1
				jmp kaka1
		
		nkaka1:
		mov screen,0
		call clearscreen


		mov screen,0
		call Cstart1
		kaka2:

				add screen,1

				cmp screen,100000000
				je nkaka2
				jmp kaka2
		
		nkaka2:
		mov screen,0
		call clearscreen
		
;-----------------------------------------------------------------level1




		start1:

		mov cloudX,180
		mov cloudY,40 
		call cloud
		call flagu


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


		mov dl, 2 ;col
		mov dh, 1 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'M'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'A'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'R'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'O'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h


		mov dl, 2 ;col
		mov dh, 2 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '1'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '7'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '0'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '0'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '9'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '2'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '1'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '7'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '0'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '2'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '8'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '5'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		


		mov dl, 2 ;col
		mov dh, 3 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'V'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '1'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h


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

							cmp al,'P'     ;n key pressed
							je start2
							cmp al,'p'     ;n key pressed
							je start2

							cmp al,'L'     ;n key pressed
							je start3
							cmp al,'l'     ;n key pressed
							je start3

							cmp al,'O'     ;L key pressed
							je start1
							cmp al,'o'     ;L key pressed
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
				



				jmp again


			

			jmp again

;-----------------------------------------------------------------level2
			



			start2:



			call clearscreen


		mov screen,0
		call Cstart2
		kaka3:

				add screen,1

				cmp screen,100000000
				je nkaka3
				jmp kaka3
		
		nkaka3:
		mov screen,0
		call clearscreen


		mov dl, 2 ;col
		mov dh, 1 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'M'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'A'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'R'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'O'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h


		mov dl, 2 ;col
		mov dh, 2 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '1'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '7'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '0'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '0'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '9'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '2'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '1'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '7'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '0'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '2'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '8'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '5'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		


			mov dl, 2 ;col
		mov dh, 3 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'V'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '2'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
			
			mov cloudX,180
			mov cloudY,40 

						
			call cloud
			call flagu


			call hurdle1

			call hurdle2

			call hurdle3

			call grass

			call clearmama

			

			start22:

						
						

						

						call clearmama

						mov marioX,20
						mov marioY, 300

						;call drawrect1
						;call drawrect2

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

							
							jmp no	


							nunu:
							
								call drawrect2
							call drawrect1
							
							
								cmp enemyX1,120  ;hurdles2
								je restart1

								cmp enemyX2,360  ;hurdles1
								je restart2

								cmp dragonX,480  ;hurdles1
								je level33


								jmp norestart



								

								restart1:
										call drawrect2
										call drawrect1
										mov drawrect2X,283
										call drawrect1
										mov enemyX1,300  
										mov enemyY1, 293
										call  goomba1

										cmp enemyX1,120  ;hurdles2
										je restart1

										cmp enemyX2,360  ;hurdles1
										je restart2

										jmp norestart

								restart2:
										call drawrect2
										call drawrect1
				
										mov drawrect1X,428
										call drawrect2
										mov enemyX2,445
										mov enemyY2, 293
										call goomba2


										cmp enemyX1,120  ;hurdles2
										je restart1

										cmp enemyX2,360  ;hurdles1
										je restart2

										jmp norestart

								
								


										norestart:


							

							

							call drawrect2
							call drawrect1
							
							
							mov count,0

							sub drawrect1X,5
							call drawrect1

							sub drawrect2X,5
							call drawrect2

							sub enemyX1,5 
							call goomba1
							
							sub enemyX2,5
							call goomba2

							cmp dragonX,480  ;drogo
							je level33

							
							cmp level3, 1
							je norestartt
							
							call clearmama
							call mama


								cmp enemyX1,120  ;hurdles2
								je restart1

								cmp enemyX2,360  ;hurdles1
								je restart2
								
							;	norestart:

							
							
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

							cmp al,'N'     ;n key pressed
							je start1
							cmp al,'n'     ;n key pressed
							je start1

							cmp al,'P'     ;n key pressed
							je start2
							cmp al,'p'     ;n key pressed
							je start2


							cmp al,'L'     ;n key pressed
							je start3
							cmp al,'l'     ;n key pressed
							je start3

							cmp al,'O'     ;L key pressed
							je start1
							cmp al,'o'     ;L key pressed
							je start1

							cmp ax,4B00h    ;left key pressed
							je leftKeyPressed2

							cmp ax,4D00h     ;right key pressed
							je rightKeyPressed2222222222

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
								je start3

								
								mov bx,enemyX1
								sub bx,30
								cmp marioX,bx  ;enemy1
								je exit
							
							mov bx,enemyX2
								sub bx,30
								cmp marioX,bx  ;enemy2
								je exit


								mov bx,enemyX1
								add bx,30
								cmp marioX,bx  ;enemy1
								je exit
							
							mov bx,enemyX2
								add bx,30
								cmp marioX,bx  ;enemy2
								je exit

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

							rightKeyPressed2222222222:
				
								cmp marioX,60  ;hurdles2
								je rukawat2222

								cmp marioX,310  ;hurdles1
								je rukawat12

								cmp marioX,465   ;hurdles3
								je rukawat32

								cmp marioX,600   ;flag
								je start3


								mov bx,enemyX1
								sub bx,30
								cmp marioX,bx  ;enemy1
								je exit
							
							mov bx,enemyX2
								sub bx,30
								cmp marioX,bx  ;enemy2
								je exit


								mov bx,enemyX1
								add bx,30
								cmp marioX,bx  ;enemy1
								je exit
							
							mov bx,enemyX2
								add bx,30
								cmp marioX,bx  ;enemy2
								je exit

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
									je start3
				

								jmp again2
	
							upKeyPressed2:  ;saray paisay iskay hain
								cmp marioX,150  ;hurdles
								je exit

								cmp marioX,320
								je exit

								cmp marioX,480
								je exit

								cmp marioX,620   ;flag
								je start3
	
								call hurdletops
								call clearmama
								call tabahiJump
				





								jmp again2


			

							jmp again2
	

;------------------------------------------------------------------level3



				start3:


				call clearscreen


		mov screen,0
		call Cstart3
		kaka4:

				add screen,1

				cmp screen,100000000
				je nkaka4
				jmp kaka4
		
		nkaka4:
		mov screen,0
		call clearscreen

						;call ;drawrect3

						
						mov cloudX,180
						mov cloudY,40
						call clearscreen

						mov dl, 2 ;col
		mov dh, 1 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'M'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'A'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'R'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'O'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h


		mov dl, 2 ;col
		mov dh, 2 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '1'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '7'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '0'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '0'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '9'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '2'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '1'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '7'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '0'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '2'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '8'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '5'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		


		mov dl, 2 ;col
		mov dh, 3 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'V'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '3'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		

						call cloud
						


						call hurdle1

						call hurdle2

						call hurdle3

						call grass

						call clearmama

						call flagchup

						mov level3,1
						mov count,0

			

			start33:

						mov drawrect2X,283
						mov drawrect1X,428
						
						
						mov castleX,585
						mov castleY,302
						
						
						mov dragonX, 120
						mov dragonY, 70
						call dragonchup
						call dragon
						
						
						;call flagchup
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
						call castle
						;sari game iski hai

						again3:
							
							add count,1
							
							cmp count,2000000000
							ja blockk



							jmp noo

							
							

						blockk:

							
							
							cmp count,2000000000
							ja nunu

							jmp noo	


							nunuu:
								call drawrect2
								call drawrect1
								
								level33:
							
								cmp enemyX1,120  ;hurdles2
								je restart11

								cmp dragonX,480  ;drogo
								je restartD
								

								cmp enemyX2,360  ;hurdles1
								je restart22

								jmp norestartt


								restart11:
										call drawrect2
										call drawrect1
										mov drawrect2X,283
										call drawrect1

										mov enemyX1,300  
										mov enemyY1, 293
										call  goomba1
										

										cmp enemyX1,120  ;hurdles2
										je restart11

										cmp dragonX,480  ;drogo
										je restartD
								

										cmp enemyX2,360  ;hurdles1
										je restart22

										jmp norestartt

								restart22:

										call drawrect2
										call drawrect1
										mov drawrect1X,428
										call drawrect2
										mov enemyX2,445
										mov enemyY2, 293
										call goomba2
										
										jmp norestartt

										cmp enemyX1,120  ;hurdles2
										je restart11

										cmp dragonX,480  ;drogo
										je restartD
								

										cmp enemyX2,360  ;hurdles1
										je restart22
								
								restartD:

										mov dragonX,120
										mov dragonY, 70
																
										call dragonchup
										call dragon


										cmp enemyX1,120  ;hurdles2
										je restart11

										cmp dragonX,480  ;drogo
										je restartD
								

										cmp enemyX2,360  ;hurdles1
										je restart22

										jmp norestartt

							norestartt:


							
							call drawrect2
							call drawrect1
							
							mov count,0

							sub drawrect1X,0
							call drawrect1

							sub drawrect2X,0
							call drawrect2

							;sub enemyX1,0
							;call goomba1
							
							;sub enemyX2,0
							;call goomba2
							
							add dragonX,40
							
								
							call dragon						
							call dragonchup
							call dragon
							call dragonchup
							

							call clearmama
							call mama
								call drawrect2
								call drawrect1


							cmp enemyX1,120  ;hurdles2
								je restart11

								cmp dragonX,480  ;drogo
								je restartD
								

								cmp enemyX2,360  ;hurdles1
								je restart22
								
							;	norestartt:

							
							
							jmp noo
							
							noo:

								mov bx,enemyX1
								cmp marioX,bx  ;enemy1
								je exit
							
								mov bx,enemyX2
								cmp marioX,bx  ;enemy2
								je exit
														



							mov ah,01     ;checking for key press
							int 16h
							JZ again3      ;if no key is pressed
							mov ah,0      ;getting chracter
							int 16h

							
							

							cmp al,'E'     ;E key pressed
							je exit
							cmp al,'e'     ;E key pressed
							je exit

							cmp al,'N'     ;n key pressed
							je start1
							cmp al,'n'     ;n key pressed
							je start1

							cmp al,'L'     ;L key pressed
							je start3
							cmp al,'l'     ;L key pressed
							je start3

							cmp al,'O'     ;L key pressed
							je start1
							cmp al,'o'     ;L key pressed
							je start1




							cmp ax,4B00h    ;left key pressed
							je leftKeyPressed223

							cmp ax,4D00h     ;right key pressed
							je rightKeyPressed223

							cmp ax,4800h  ;up key pressed
							je upKeyPressed223
							jmp again3

							

							leftKeyPressed223:

								

								cmp marioX,340  ;hurdles1
								je rukawat123

								cmp marioX,80  ;hurdles2
								je rukawat456

								cmp marioX,500   ;hurdles3
								je rukawat789

								cmp marioX,550   ;flag
								je exit
								


								
								mov bx,enemyX1
								sub bx,30
								cmp marioX,bx  ;enemy1
								je exit
							
							mov bx,enemyX2
								sub bx,30
								cmp marioX,bx  ;enemy2
								je exit


								mov bx,enemyX1
								add bx,30
								cmp marioX,bx  ;enemy1
								je exit
							
							mov bx,enemyX2
								add bx,30
								cmp marioX,bx  ;enemy2
								je exit

								jmp noRukawatt00
				
								rukawat123:
									mov bx,5
									add marioX,bx

									call hurdle1
									call clearmama
									call mama

					
					
									jmp again3

								rukawat456:
									mov bx,5
									add marioX,bx
					
									call hurdle2
									call clearmama
									call mama

									jmp again3

								rukawat789:
									mov bx,5
									add marioX,bx
					
									call hurdle3
									call clearmama
									call mama

									jmp again3		
					
								noRukawatt00:
									mov bx,5
									sub marioX,bx

									call clearmama
									call mama
									call hurdletops


									

									cmp marioX,340  ;hurdles1
									je rukawat123

									cmp marioX,105  ;hurdles2
									je rukawat456

									cmp marioX,500   ;hurdles3
									je rukawat789

									cmp marioX,560   ;flag
								je exit
								



									jmp again3

							rightKeyPressed223:
				
								
								cmp marioX,310  ;hurdles1
								je rukawat5

								cmp marioX,60  ;hurdles2
								je rukawat55


								cmp marioX,465   ;hurdles3
								je rukawat555

								cmp marioX,570   ;flag
								je exit
								


								mov bx,enemyX1
								cmp marioX,bx  ;enemy1
								je exit
							
								mov bx,enemyX2
								cmp marioX,bx  ;enemy2
								je exit

								add factivate,1

								cmp factivate,10
								je unleash
								jmp dontunleash
								unleash: 

									call fiyahdrop
									mov bx, marioX
									cmp fireX,bx
									je exit
									mov factivate,0
							
								
								dontunleash:
								jmp noRukawat22
				
								rukawat5:
									mov bx,5
									sub marioX,bx

									call hurdle1
									call clearmama
									call mama
					
									jmp again3

								rukawat55:
									mov bx,5
									sub marioX,bx
					
									call hurdle2
									call clearmama
									call mama

									jmp again3

								rukawat555:
									mov bx,5
									sub marioX,bx
					
									call hurdle3
									call clearmama
									call mama

									jmp again3		
					
								noRukawat22:
									mov bx,5
									add marioX,bx

									call clearmama
									call mama

									call hurdletops



									cmp marioX,340  ;hurdles1
									je rukawat5


									cmp marioX,80  ;hurdles2
									je rukawat55

									cmp marioX,500   ;hurdles3
									je rukawat555
								
								cmp marioX,20   ;flag
								je exit
								

								jmp again3
	
							upKeyPressed223:  ;saray paisay iskay hain
								cmp marioX,150  ;hurdles
								je exit

								cmp marioX,320
								je exit

								cmp marioX,480
								je exit

								cmp marioX,550   ;flag
								je exit
	
								call hurdletops
								call clearmama
								call tabahiJump
								;call fiyahdrop


								


								jmp again3


			

							jmp again3











;-----------------------------------------------------------------exit

exit:

call clearscreen


		mov screen,0
		call Cstart4
		kaka5:

				add screen,1

				cmp screen,100000000
				je nkaka5
				jmp kaka5
		
		nkaka5:
		mov screen,0
		call clearscreen


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
		mov dx, drawrect1Y	; y-start; marioY
		int 10h
		loop2:
		push cx
		mov cx, drawrect1X	;how far from the x-start ;variable marioX
		mov si, 43   ;xaxis
		l2:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l2 
		mov cx, drawrect1X	; setting col again
		inc dx	; next rowe
		int 10h
		int 10h
		pop cx
		loop loop2
		ret

drawrect1 endp


clearscreen proc
		
		mov ah, 0ch
		mov al, 0
		mov cx, 500	; height	
		mov dx, 0	; y-start; marioY
		int 10h

		loop2:
		push cx
		mov cx, 0	;how far from the x-start ;variable marioX

		mov si,700    ;xaxis
		l2:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, 0	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop2
		ret

clearscreen endp


drawrect2 proc
		
		mov ah, 0ch
		mov al, 0
		mov cx, 49	; height	
		mov dx, drawrect2Y	; y-start; marioY
		int 10h

		loop2:
		push cx
		mov cx, drawrect2X	;how far from the x-start ;variable marioX

		mov si, 43    ;xaxis
		l2:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, drawrect2X	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop2
		ret

drawrect2 endp


dragonchup proc
		
		mov ah, 0ch
		mov al, 0
		mov cx, 60	; height	
		mov dx, 62	; y-start; marioY
		int 10h

		loop2:
		push cx
		mov cx,80	;how far from the x-start ;variable marioX

		mov si, 450    ;xaxis
		l2:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l2 

		mov cx, 80	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop2

		ret

dragonchup endp



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

		ret
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
	
	
	;hattop
		

		mov bx,8
		sub marioY,bx
		

		mov ah, 0ch
		mov al, 4
		mov cx, 2	; height	
		mov dx, marioY	; y-start; marioY
		int 10h

		loop00:
		push cx
		mov cx, marioX	;how far from the x-start ;variable marioX

		mov si, 8
		l00:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l00

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop00


		mov bx,8
		add marioY,bx

	;hat
		

		mov bx,6
		sub marioY,bx
		

		mov ah, 0ch
		mov al, 4
		mov cx, 6	; height	
		mov dx, marioY	; y-start; marioY
		int 10h

		loop0:
		push cx
		mov cx, marioX	;how far from the x-start ;variable marioX

		mov si, 15
		l0:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l0

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop0


		mov bx,6
		add marioY,bx




		;nose
		

		mov bx,3
		add marioY,bx
		

		mov ah, 0ch
		mov al, 14
		mov cx, 4	; height	
		mov dx, marioY	; y-start; marioY
		int 10h

		loop000:
		push cx
		mov cx, marioX	;how far from the x-start ;variable marioX

		mov si, 13
		l000:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l000

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop000


		mov bx,3
		sub marioY,bx



		
		
	
	;head
		mov ah, 0ch
		mov al, 14
		mov cx, 12	; height	
		mov dx, marioY	; y-start; marioY
		int 10h

		loop2:
		push cx
		mov cx, marioX	;how far from the x-start ;variable marioX

		mov si, 9
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

		
		;mooch
		

		mov bx,6
		add marioY,bx
		mov bx,7
		add marioX,bx

		mov ah, 0ch
		mov al, 8
		mov cx, 2	; height	
		mov dx, marioY	; y-start; marioY
		int 10h

		loop0000:
		push cx
		mov cx, marioX	;how far from the x-start ;variable marioX

		mov si, 3
		l0000:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l0000

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop0000

		mov bx,6
		sub marioY,bx
		mov bx,7
		sub marioX,bx


		;body

		mov bx,12
		add marioY,bx
		mov bx,2
		sub marioX,bx

		mov ah, 0ch
		mov al, 4
		mov cx, 18	; height	
		mov dx, marioY	; marioY +15
		int 10h

		loop3:
		push cx
		mov cx, marioX	;how far from the start ;marioX-5

		mov si, 15
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
		mov bx,3
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

		mov bx,6
		add marioX,bx

		mov ah, 0ch
		mov al, 8
		mov cx, 12	; height	
		mov dx, marioY	; marioY+45
		int 10h




		mov bx,5
		add marioY,bx

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


		;hattop
		

		mov bx,8
		sub marioY,bx
		

		mov ah, 0ch
		mov al, 0
		mov cx, 2	; height	
		mov dx, marioY	; y-start; marioY
		int 10h

		loop00:
		push cx
		mov cx, marioX	;how far from the x-start ;variable marioX

		mov si, 8
		l00:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l00

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop00


		mov bx,8
		add marioY,bx

	;hat
		

		mov bx,6
		sub marioY,bx
		

		mov ah, 0ch
		mov al, 0
		mov cx, 6	; height	
		mov dx, marioY	; y-start; marioY
		int 10h

		loop0:
		push cx
		mov cx, marioX	;how far from the x-start ;variable marioX

		mov si, 15
		l0:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l0

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop0


		mov bx,6
		add marioY,bx




		;nose
		

		mov bx,3
		add marioY,bx
		

		mov ah, 0ch
		mov al, 0
		mov cx, 4	; height	
		mov dx, marioY	; y-start; marioY
		int 10h

		loop000:
		push cx
		mov cx, marioX	;how far from the x-start ;variable marioX

		mov si, 13
		l000:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l000

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop000


		mov bx,3
		sub marioY,bx

	
	
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
			
		;mooch
		

		mov bx,6
		add marioY,bx
		mov bx,7
		add marioX,bx

		mov ah, 0ch
		mov al, 0
		mov cx, 2	; height	
		mov dx, marioY	; y-start; marioY
		int 10h

		loop0000:
		push cx
		mov cx, marioX	;how far from the x-start ;variable marioX

		mov si, 3
		l0000:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l0000

		mov cx, marioX	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop0000

		mov bx,6
		sub marioY,bx
		mov bx,7
		sub marioX,bx


		;body

		mov bx,12
		add marioY,bx
		mov bx,2
		sub marioX,bx

		mov ah, 0ch
		mov al, 0
		mov cx, 18	; height	
		mov dx, marioY	; marioY +15
		int 10h

		loop3:
		push cx
		mov cx, marioX	;how far from the start ;marioX-5

		mov si, 15
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
		mov bx,3
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

		mov bx,6
		add marioX,bx

		mov ah, 0ch
		mov al, 0
		mov cx, 12	; height	
		mov dx, marioY	; marioY+45
		int 10h




		mov bx,5
		add marioY,bx

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

		call hurdle1

		call hurdle2

		call hurdle3

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






flagu proc


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

flagu endp

flagchup proc

	mov ah, 0ch
		mov al, 0
		mov cx, 322	; height	
		mov dx, 20	; y-start; marioY
		int 10h

		loop222:
		push cx
		mov cx, 510	;how far from the x-start ;variable marioX

		mov si, 130    ;xaxis
		l2222:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l2222 

		mov cx, 510	; setting col again
		inc dx	; next row
		int 10h
		int 10h
		pop cx
		loop loop222
		ret

flagchup endp


castle proc

					mov var, 50

					mov ah, 0ch
					mov al, 6
					mov cx, 40; height
					mov dx, castleY	; starting y
					int 10h

					c7:
					push cx
					mov cx, castleX	;starting x

					mov si, var	; thickness 
					c8:
					inc cx
					int 10h
					dec si
					cmp si,0
					jge c8

					mov cx, castleX
					inc dx
					int 10h
					int 10h
					pop cx
					loop c7




					mov var, 30
					sub castleY, 15
					add castleX, 10
					mov ah, 0ch
					mov al, 6
					mov cx, 15; height
					mov dx, castleY	; starting y
					int 10h

					m1:
					push cx
					mov cx, castleX	;starting x

					mov si, var	; thickness 
					m2:
					inc cx
					int 10h
					dec si
					cmp si,0
					jge m2

					mov cx, castleX
					inc dx
					int 10h
					int 10h
					pop cx
					loop m1




					mov var, 2
					sub castleY, 15
					add castleX, 13
					mov ah, 0ch
					mov al, 8
					mov cx, 15; height
					mov dx, castleY	; starting y
					int 10h

					m3:
					push cx
					mov cx, castleX	;starting x

					mov si, var	; thickness 
					m4:
					inc cx
					int 10h
					dec si
					cmp si,0
					jge m4

					mov cx, castleX
					inc dx
					int 10h
					int 10h
					pop cx
					loop m3




					mov var, 7
					sub castleY, 5
					mov ah, 0ch
					mov al, 4
					mov cx, 7; height
					mov dx, castleY	; starting y
					int 10h

					m5:
					push cx
					mov cx, castleX	;starting x

					mov si, var	; thickness 
					m6:
					inc cx
					int 10h
					dec si
					cmp si,0
					jge m6

					mov cx, castleX
					inc dx
					int 10h
					int 10h
					dec var
					pop cx
					loop m5








					mov var, 12
					add castleY, 50
					sub castleX, 3
					mov ah, 0ch
					mov al, 8
					mov cx, 25; height
					mov dx, castleY	; starting y
					int 10h

					m7:
					push cx
					mov cx, castleX	;starting x

					mov si, var	; thickness 
					m8:
					inc cx
					int 10h
					dec si
					cmp si,0
					jge m8

					mov cx, castleX
					inc dx
					int 10h
					int 10h
					pop cx
					loop m7





					mov bx, 0


					mov var, 3
					sub castleY, 8
					add castleX, 4

					baraloop:

					mov ah, 0ch
					mov al, 8
					mov cx, 3; height
					mov dx, castleY	; starting y
					int 10h

					n1:
					push cx
					mov cx, castleX	;starting x

					mov si, var	; thickness 
					n2:
					inc cx
					int 10h
					dec si
					cmp si,0
					jge n2

					mov cx, castleX
					inc dx
					int 10h
					int 10h
					pop cx
					loop n1


					add var,4
					add castleY, 3
					sub castleX, 2

					inc bx
					cmp bx, 3
					jl baraloop


					ret
castle endp


dragon proc



									mov bx, dragonX
									mov prevdragonX, bx
									mov bx, dragonY
									mov prevdragonY, bx


		

						mov var, 7
						mov bx, 0

						baraloop:

						mov ah, 0ch
						mov al, 2
						mov cx, 3; height
						mov dx, dragonY	; starting y
						int 10h

						m5:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						m6:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge m6

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop m5

						sub dragonX, 3
						add dragonY, 3
						add var, 6
						inc bx
						cmp bx, 5
						jle baraloop



						mov ah, 0ch
						mov al, 2
						mov cx, 5; height
						mov dx, dragonY	; starting y
						int 10h

						d1:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						d2:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge d2

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop d1




						sub dragonX,10
						add dragonY, 2
						mov var, 10

						mov ah, 0ch
						mov al, 2
						mov cx, 3; height
						mov dx, dragonY	; starting y
						int 10h

						d3:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						d4:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge d4

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop d3






						sub dragonX, 4
						sub dragonY, 10
						mov var, 1

						mov ah, 0ch
						mov al, 4
						mov cx, 28; height
						mov dx, dragonY	; starting y
						int 10h

						d5:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						d6:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge d6

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop d5







						mov var, 2
						mov bx, 0

						sub dragonY, 7

						baraloop2:

						mov ah, 0ch
						mov al, 15
						mov cx, 2; height
						mov dx, dragonY	; starting y
						int 10h

						d7:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						d8:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge d8

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop d7

						sub dragonX, 3
						add dragonY, 3
						add var, 6
						inc bx
						cmp bx, 2
						jle baraloop2











						mov var, 40
						mov bx, 0

						add dragonY, 11
						add dragonX, 24

						baraloop3:

						mov ah, 0ch
						mov al, 2
						mov cx, 3; height
						mov dx, dragonY	; starting y
						int 10h

						m7:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						m8:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge m8

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop m7

						add dragonX, 3
						add dragonY, 3
						sub var, 6
						inc bx
						cmp bx, 5
						jle baraloop3







						mov var, 3
						mov bx, 0
						sub dragonY, 10
						sub dragonX, 14

						baraloop5:

						mov ah, 0ch
						mov al, 2
						mov cx, 3; height
						mov dx, dragonY	; starting y
						int 10h

						a1:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						a2:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge a2

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop a1

						sub dragonX, 3
						add dragonY, 3
						inc bx
						cmp bx, 3
						jl baraloop5








						mov var, 3
						mov bx, 0
						sub dragonY, 7
						add dragonX, 39

						baraloop6:

						mov ah, 0ch
						mov al, 2
						mov cx, 3; height
						mov dx, dragonY	; starting y
						int 10h

						a3:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						a4:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge a4

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop a3

						add dragonX, 3
						add dragonY, 3
						inc bx
						cmp bx, 2
						jl baraloop6


						mov bx, 0
						baraloop7:

						mov ah, 0ch
						mov al, 2
						mov cx, 3; height
						mov dx, dragonY	; starting y
						int 10h

						a5:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						a6:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge a6

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop a5

						sub dragonX, 3
						add dragonY, 3
						inc bx
						cmp bx, 3
						jl baraloop7








						mov bx, 0
						sub dragonX, 32
						sub dragonY, 8
						baraloop8:

						mov ah, 0ch
						mov al, 2
						mov cx, 3; height
						mov dx, dragonY	; starting y
						int 10h

						a7:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						a8:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge a8

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop a7

						add dragonX, 3
						add dragonY, 3
						inc bx
						cmp bx, 3
						jl baraloop8



						mov var, 5
						add dragonX, 10
						sub dragonY, 36


						mov ah, 0ch
						mov al, 8
						mov cx, 7; height
						mov dx, dragonY	; starting y
						int 10h

						b1:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						b2:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge b2

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop b1












						mov var, 7
						add dragonY, 2
						dec dragonX

						mov ah, 0ch
						mov al, 8
						mov cx, 13; height
						mov dx, dragonY	; starting y
						int 10h

						b3:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						b4:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge b4

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop b3






						mov var, 2
						add dragonX, 2

						mov ah, 0ch
						mov al, 14
						mov cx, 2; height
						mov dx, dragonY	; starting y
						int 10h

						b5:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						b6:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge b6

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop b5






						mov var, 8
						add dragonY, 11
						sub dragonX, 3

						mov ah, 0ch
						mov al, 2
						mov cx, 2; height
						mov dx, dragonY	; starting y
						int 10h

						b7:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						b8:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge b8

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop b7









						mov var, 2
						sub dragonY, 33
						add dragonX, 20
						mov bx, 0

						tang:

						mov ah, 0ch
						mov al, 15
						mov cx, 2; height
						mov dx, dragonY	; starting y
						int 10h

						t1:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						t2:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge t2

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop t1

						sub dragonX, 2
						add dragonY, 2
						inc bx
						cmp bx, 5
						jl tang








						sub dragonX, 22
						sub dragonY, 10
						mov bx, 0

						tang2:

						mov ah, 0ch
						mov al, 15
						mov cx, 2; height
						mov dx, dragonY	; starting y
						int 10h

						t3:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						t4:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge t4

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop t3

						add dragonX, 2
						add dragonY, 2
						inc bx
						cmp bx, 5
						jl tang2














						sub dragonX, 15
						sub dragonY, 5
						mov bx, 0

						tang3:

						mov ah, 0ch
						mov al, 15
						mov cx, 2; height
						mov dx, dragonY	; starting y
						int 10h

						t5:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						t6:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge t6

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop t5

						add dragonX, 2
						add dragonY, 2
						inc bx
						cmp bx, 5
						jl tang3







						add dragonX, 32
						sub dragonY, 11
						mov bx, 0

						tang4:

						mov ah, 0ch
						mov al, 15
						mov cx, 2; height
						mov dx, dragonY	; starting y
						int 10h

						t7:
						push cx
						mov cx, dragonX	;starting x

						mov si, var	; thickness 
						t8:
						inc cx
						int 10h
						dec si
						cmp si,0
						jge t8

						mov cx, dragonX
						inc dx
						int 10h
						int 10h
						pop cx
						loop t7

						sub dragonX, 2
						add dragonY, 2
						inc bx
						cmp bx, 5
						jl tang4


	
									mov bx, prevdragonX
									mov dragonX, bx
									mov bx, prevdragonY
									mov dragonY, bx


ret 
dragon endp



fiyah proc



									mov bx, fireX
									mov prevFX, bx
									mov bx, fireY
									mov prevFY, bx

							
									

							mov var, 15

							mov ah, 0ch
							mov al, 14
							mov cx, 3; height
							mov dx, fireY	; starting y
							int 10h

							f1:
							push cx
							mov cx, fireX	;starting x

							mov si, var	; thickness 
							f2:
							inc cx
							int 10h
							dec si
							cmp si,0
							jge f2

							mov cx, fireX
							inc dx
							int 10h
							int 10h
							pop cx
							loop f1





							sub fireY, 4
							sub fireX, 2
							add var, 4

							mov ah, 0ch
							mov al, 14
							mov cx, 4; height
							mov dx, fireY	; starting y
							int 10h

							f3:
							push cx
							mov cx, fireX	;starting x

							mov si, var	; thickness 
							f4:
							inc cx
							int 10h
							dec si
							cmp si,0
							jge f4

							mov cx, fireX
							inc dx
							int 10h
							int 10h
							pop cx
							loop f3





							sub fireY, 4
							add var, 2

							mov ah, 0ch
							mov al, 14
							mov cx, 5  ; height
							mov dx, fireY	; starting y
							int 10h

							f5:
							push cx
							mov cx, fireX	;starting x

							mov si, var	; thickness 
							f6:
							inc cx
							int 10h
							dec si
							cmp si,0
							jge f6

							mov cx, fireX
							inc dx
							int 10h
							int 10h
							pop cx
							loop f5










							sub fireY, 5
							add fireX, 3
							sub var, 3

							mov ah, 0ch
							mov al, 14
							mov cx, 5  ; height
							mov dx, fireY	; starting y
							int 10h

							f7:
							push cx
							mov cx, fireX	;starting x

							mov si, var	; thickness 
							f8:
							inc cx
							int 10h
							dec si
							cmp si,0
							jge f8

							mov cx, fireX
							inc dx
							int 10h
							int 10h
							pop cx
							loop f7








							sub fireY, 5
							add fireX, 7
							sub var, 7

							mov ah, 0ch
							mov al, 14
							mov cx, 5  ; height
							mov dx, fireY	; starting y
							int 10h

							f9:
							push cx
							mov cx, fireX	;starting x

							mov si, var	; thickness 
							f10:
							inc cx
							int 10h
							dec si
							cmp si,0
							jge f10

							mov cx, fireX
							inc dx
							int 10h
							int 10h
							pop cx
							loop f9

							sub fireY, 3
							sub var, 3

							mov ah, 0ch
							mov al, 14
							mov cx, 3 ; height
							mov dx, fireY	; starting y
							int 10h

							g1:
							push cx
							mov cx, fireX	;starting x

							mov si, var	; thickness 
							g2:
							inc cx
							int 10h
							dec si
							cmp si,0
							jge g2

							mov cx, fireX
							inc dx
							int 10h
							int 10h
							pop cx
							loop g1

							sub fireY, 3
							sub fireX, 3
							sub var, 3

							mov ah, 0ch
							mov al, 14
							mov cx, 3 ; height
							mov dx, fireY	; starting y
							int 10h

							g3:
							push cx
							mov cx, fireX	;starting x

							mov si, var	; thickness 
							g4:
							inc cx
							int 10h
							dec si
							cmp si,0
							jge g4

							mov cx, fireX
							inc dx
							int 10h
							int 10h
							pop cx
							loop g3

									mov bx, prevFX
									mov fireX, bx
									mov bx, prevFY
									mov fireY, bx

							ret 
fiyah endp


clearfiyah proc
	
	
		mov ah, 0ch
		mov al, 0
		mov cx,29	 ; height	
		mov dx, fireY	; y-start; marioY
		int 10h
		loop2:
		push cx
		mov cx, fireX	;how far from the x-start ;variable marioX
		mov si, 30   ;xaxis
		l2:
		inc cx		; thickness
		int 10h
		dec si
		cmp si, 0
		jge l2 
		mov cx, fireX	; setting col again
		inc dx	; next rowe
		int 10h
		int 10h
		pop cx
		loop loop2


ret
clearfiyah endp

fiyahdrop proc

		mov bx,dragonX
		mov fireX,bx
		mov fireY,160

		
		mov cx,50

		l8:
		push cx
				
				call fiyah
				
				sub fireX,5
				sub fireY,25
				call clearfiyah
				add fireX,5
				add fireY,25

				add fireY,2
				call fiyah

		
		pop cx
		loop l8

				


		

		

		
		

		ret
	

fiyahdrop endp
		
Cstart00 proc
		
		mov dl, 33 ;col
		mov dh, 15 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'M'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'A'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'R'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'O'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'S'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'M'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'A'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'S'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'H'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		ret
Cstart00 endp		


Cstart0 proc


		mov dl, 27 ;col
		mov dh,15 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'N'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'S'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'T'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'R'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'U'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'C'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'T'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'O'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'N'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'S'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ':'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		

		mov dl, 27 ;col
		mov dh,17 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'P'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'R'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'S'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'S'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'F'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'T'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '&'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, 'R'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'G'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'H'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'T'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, 'T'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'O'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, 'M'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'O'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'V'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h


		mov dl, 27 ;col
		mov dh,18 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'P'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'R'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'S'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'S'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, 'U'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'P'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, 'T'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'O'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, 'J'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'U'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'M'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'P'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h


		mov dl, 27 ;col
		mov dh,19 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'P'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'R'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'S'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'S'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		
		
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, 'T'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'O'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'X'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'I'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'T'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h



		ret

Cstart0 endp
		
		


Cstart1 proc

		mov dl, 35 ;col
		mov dh, 15 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'V'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '1'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h

		ret
Cstart1 endp


Cstart2 proc
		mov dl, 35 ;col
		mov dh, 15 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'V'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '2'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		ret
Cstart2 endp


Cstart3 proc
		
		mov dl, 35 ;col
		mov dh, 15 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'V'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'L'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, '3'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		ret
Cstart3 endp





Cstart4 proc
		
		mov dl, 35 ;col
		mov dh, 15 ;row
		mov bh,0
		mov ah,02h
		int 10h
		mov al, 'T'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'H'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, ' '
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'E'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'N'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		mov al, 'D'
		mov bl,0ch
		mov bh, 0
		mov ah, 0eh
		int 10h
		ret
Cstart4 endp




end main