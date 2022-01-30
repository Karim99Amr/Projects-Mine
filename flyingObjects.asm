.MODEL SMALL
.STACK 64
.DATA
    
   
	TEXT_PLAYER1 DB 'PLAYER1:','$'
	TEXT_PLAYER2 DB 'PLAYER2:','$'
	
	TIME_AUX DB 0                        ;variable used when checking if the time has changed
	WINDOW_WIDTH DW 140h                 ;the width of the window (320 pixels)
	WINDOW_HEIGHT DW 0C8h                ;the height of the window (200 pixels)
	WINDOW_BOUNDS DW 6                   ;variable used to check collisions early
	
	BOUNDARY_SIZE_X DW 02H
	BOUNDARY_SIZE_Y DW  0C8H
	
	BOUNDARY_X DW    0A0H
	BOUNDARY_Y DW    00H 
	;--------------------------------------------------------------------------------------
	;DATA PLAYER 1                       ;
	;-----------------------------------------------------------------------
	
	
	
	
	TEXT_PLAYER_ONE_POINTS_UNIT DB '0','$'    ;text with the player one points 
	TEXT_PLAYER_ONE_POINTS_TENTH DB '0','$'    ;text with the player one points
	TEXT_PLAYER_ONE_POINTS_HD DB '0','$'    ;text with the player one points
	PLAYER_ONE_POINTS DB 0
	VAR1 DB 0
	VAR2 DB 0
	
	
	
	GUN_ORIGINAL_X DW 050h              ;X position of the ball on the beginning of a game
	GUN_ORIGINAL_Y DW 0C6h               ;Y position of the ball on the beginning of a game
	GUN_X DW 050h                       ;current X position (column) of the ball
	GUN_Y DW 0C4h                        ;current Y position (line) of the ball
	GUN_SIZE_X DW 04h  	;size of the ball (how many pixels does the ball have in width and height)
	GUN_SIZE_Y DW 02h
	GUN_VELOCITY DW 05h               ;X (horizontal) velocity of the ball
	
	SHOOT_ORIGINAL_X DW 050h              ;X position of the ball on the beginning of a game
	SHOOT_ORIGINAL_Y DW 0BDh               ;Y position of the ball on the beginning of a game
	SHOOT_X DW 051h                 ;current X position of the left paddle
	SHOOT_Y DW 0BDh                 ;current Y position of the left paddle
	SHOOT_SIZE DW 02h                  ;default paddle width
	SHOOT_VELOCITY DW 08h 	;default paddle velocity
	
	TARGET_SIZE_X DW 08h                  ;default paddle width
	TARGET_SIZE_Y DW 04h
	
	TARGET_1_ORIGINAL_X DW 0A0h              ;X position of the ball on the beginning of a game
	TARGET_1_ORIGINAL_Y DW 064h               ;Y position of the ball on the beginning of a game
	TARGET_1_X DW 0A0h                       ;current X position (column) of the ball
	TARGET_1_Y DW 64h                        ;current Y position (line) of the ball
	TARGET_1_VELOCITY DW 02h               ;default paddle velocity
	
	TARGET_2_ORIGINAL_X DW 0A0h              ;X position of the ball on the beginning of a game
	TARGET_2_ORIGINAL_Y DW 06Eh               ;Y position of the ball on the beginning of a game
	TARGET_2_X DW 0A0h                       ;current X position (column) of the ball
	TARGET_2_Y DW 6Eh                        ;current Y position (line) of the ball
	TARGET_2_VELOCITY DW 0Ah               ;default paddle velocity
	
	TARGET_3_ORIGINAL_X DW 0A0h              ;X position of the ball on the beginning of a game
	TARGET_3_ORIGINAL_Y DW 078h               ;Y position of the ball on the beginning of a game
	TARGET_3_X DW 0A0h                       ;current X position (column) of the ball
	TARGET_3_Y DW 78h                        ;current Y position (line) of the ball
	TARGET_3_VELOCITY DW 04h               ;default paddle velocity
	
    TARGET_4_ORIGINAL_X DW 0A0h              ;X position of the ball on the beginning of a game
	TARGET_4_ORIGINAL_Y DW 082h               ;Y position of the ball on the beginning of a game
	TARGET_4_X DW 0A0h                       ;current X position (column) of the ball
	TARGET_4_Y DW 82h                        ;current Y position (line) of the ball
	TARGET_4_VELOCITY DW 08h               ;default paddle velocity
	
	TARGET_5_ORIGINAL_X DW 0A0h              ;X position of the ball on the beginning of a game
	TARGET_5_ORIGINAL_Y DW 08Ch               ;Y position of the ball on the beginning of a game
	TARGET_5_X DW 0A0h                       ;current X position (column) of the ball
	TARGET_5_Y DW 8Ch                        ;current Y position (line) of the ball
	TARGET_5_VELOCITY DW 06h               ;default paddle velocity 
	
	;--------------------------------------------------------------------------------------
	;DATA PLAYER 2                       ;
	;-----------------------------------------------------------------------
	
    TEXT_PLAYER_ONE_POINTS_UNIT9 DB '0','$'    ;text with the player one points 
	TEXT_PLAYER_ONE_POINTS_TENTH9 DB '0','$'    ;text with the player one points
	TEXT_PLAYER_ONE_POINTS_HD9 DB '0','$'    ;text with the player one points
	PLAYER_ONE_POINTS9 DB 0
	VAR19 DB 0
	VAR29 DB 0
	
	
	
	GUN_ORIGINAL_X9 DW 0F0h              ;X position of the ball on the beginning of a game
	GUN_ORIGINAL_Y9 DW 0C6h               ;Y position of the ball on the beginning of a game
	GUN_X9 DW 0F0h                       ;current X position (column) of the ball
	GUN_Y9 DW 0C4h                        ;current Y position (line) of the ball
	GUN_SIZE_X9 DW 04h  	;size of the ball (how many pixels does the ball have in width and height)
	GUN_SIZE_Y9 DW 02h
	GUN_VELOCITY9 DW 05h               ;X (horizontal) velocity of the ball
	
	SHOOT_ORIGINAL_X9 DW 0F0h              ;X position of the ball on the beginning of a game
	SHOOT_ORIGINAL_Y9 DW 0BDh               ;Y position of the ball on the beginning of a game
	SHOOT_X9 DW 0F1h                 ;current X position of the left paddle
	SHOOT_Y9 DW 0BDh                 ;current Y position of the left paddle
	SHOOT_SIZE9 DW 02h                  ;default paddle width
	SHOOT_VELOCITY9 DW 08h 	;default paddle velocity
	
	TARGET_SIZE_X9 DW 08h                  ;default paddle width
	TARGET_SIZE_Y9 DW 04h
	
	TARGET_1_ORIGINAL_X9 DW 140h              ;X position of the ball on the beginning of a game
	TARGET_1_ORIGINAL_Y9 DW 064h               ;Y position of the ball on the beginning of a game
	TARGET_1_X9 DW 140h                       ;current X position (column) of the ball
	TARGET_1_Y9 DW 64h                        ;current Y position (line) of the ball
	TARGET_1_VELOCITY9 DW 02h               ;default paddle velocity
	
	TARGET_2_ORIGINAL_X9 DW 140h              ;X position of the ball on the beginning of a game
	TARGET_2_ORIGINAL_Y9 DW 06Eh               ;Y position of the ball on the beginning of a game
	TARGET_2_X9 DW 140h                       ;current X position (column) of the ball
	TARGET_2_Y9 DW 6Eh                        ;current Y position (line) of the ball
	TARGET_2_VELOCITY9 DW 0Ah               ;default paddle velocity
	
	TARGET_3_ORIGINAL_X9 DW 140h              ;X position of the ball on the beginning of a game
	TARGET_3_ORIGINAL_Y9 DW 078h               ;Y position of the ball on the beginning of a game
	TARGET_3_X9 DW 140h                       ;current X position (column) of the ball
	TARGET_3_Y9 DW 78h                        ;current Y position (line) of the ball
	TARGET_3_VELOCITY9 DW 04h               ;default paddle velocity
	
    TARGET_4_ORIGINAL_X9 DW 140h              ;X position of the ball on the beginning of a game
	TARGET_4_ORIGINAL_Y9 DW 082h               ;Y position of the ball on the beginning of a game
	TARGET_4_X9 DW 140h                       ;current X position (column) of the ball
	TARGET_4_Y9 DW 82h                        ;current Y position (line) of the ball
	TARGET_4_VELOCITY9 DW 08h               ;default paddle velocity
	
	TARGET_5_ORIGINAL_X9 DW 140h              ;X position of the ball on the beginning of a game
	TARGET_5_ORIGINAL_Y9 DW 08Ch               ;Y position of the ball on the beginning of a game
	TARGET_5_X9 DW 140h                       ;current X position (column) of the ball
	TARGET_5_Y9 DW 8Ch                        ;current Y position (line) of the ball
	TARGET_5_VELOCITY9 DW 06h               ;default paddle velocity 
	
	INPUT1 DB 00H
	INPUT2 DB 00H
	
	SWITCH DB 00H
	;--------------------------------------------------------------------------------------------------
.CODE
MAIN PROC FAR
     
    MOV AX,@DATA
    MOV DS,AX
	
	MOV AX,0H
	MOV BX,0H
	MOV CX,0H
	MOV DX,0H
	
	CALL CLEAR_SCREEN 	;set initial video mode configurations
	
		
		CHECK_TIME:                      ;time checking loop
			
		    MOV AH,2Ch 					 ;get the system time
			INT 21h    					 ;CH = hour  | CL = minute   | DH = second | DL    = 1/100 seconds
			
			CMP DL,TIME_AUX  			 ;is the current time equal to the previous one(TIME_AUX)?
			JE CHECK_TIME    		     ;if it is the same, check again
			
;           If it reaches this point, it's because the time has passed
            MOV TIME_AUX,DL              ;update time
			;CALL DELAY
			
			
			;1-CLEAR SCREEN
			
			CALL CLEAR_SCREEN            ;clear the screen by restarting the video mode  
			
			  ;2- DRAW EVERYTHING
			  CALL DRAW_BOUNDARY
			  ;--------------------------------------------------------------------------------------
	          ;DATA PLAYER 1                      ;
	          ;-----------------------------------------------------------------------
			 		 
			 CALL DRAW_GUN 
			 LOOP1:
			 

			
			
			 CALL DRAW_1_TARGET
			 
			 CALL DRAW_2_TARGET
			 
			 CALL DRAW_3_TARGET
			 
			 CALL DRAW_4_TARGET
			 
			 CALL DRAW_5_TARGET
			 
			 CALL DRAW_UI 			;draw the game User Interface
			 
			  CALL DRAW_GUN9 
			 LOOP19:
			 

			
			
			 CALL DRAW_1_TARGET9
			 
			 CALL DRAW_2_TARGET9
			 
			 CALL DRAW_3_TARGET9
			 
			 CALL DRAW_4_TARGET9
			 
			 CALL DRAW_5_TARGET9
			 
			 CALL DRAW_UI9 			;draw the game User Interface
			 
			    ; CALL MOVE_TARGET_1	
			    ; CALL MOVE_TARGET_2
			    ; CALL MOVE_TARGET_3
			    ; CALL MOVE_TARGET_4
			    ; CALL MOVE_TARGET_5
				 
				; CALL MOVE_TARGET_19	
			    ; CALL MOVE_TARGET_29
			    ; CALL MOVE_TARGET_39
			    ; CALL MOVE_TARGET_49
			    ; CALL MOVE_TARGET_59
				 
		    CMP SWITCH,00H
			
			JNE CHECK_PLAYER2_1
			
			;------------------------------------------
			  
			;------------------------------------------                                                
			   MOV AX,SHOOT_Y 
		      
		       MOV BX,GUN_Y
		       SUB BX,07H  
		       
		       CMP AX, BX
		      
		       JGE NOT_MOVING
		       JL  MOVING
		      
		     
		        MOVING:
		        
		        
		         CALL MOVE_SHOOT
		         CALL DRAW_SHOOT 
		       
		        ;3- GET WAIT TO GET INPUT FROM THE USER
				
				MOV AH,01
		         INT 16H
		         
		         JZ NO_PRESSED  
				 
				 MOV AH,00h
		         INT 16h
		         

				;scan code 
		        ;if it is move LEFT
		        CMP AL,61h ;'a'
		        JE ARROW1
		        CMP AL,41h ;'A'
		        JE ARROW1
		
		        ;if it is move RIGTH
		        CMP AL,64h ;'d'
		        JE ARROW1
		        CMP AL,44h ;'D'
		        JE ARROW1
		        
		        JNE NO_PRESSED 
		        
		        ARROW1:
		        
		         MOV INPUT1,AL
		         CALL MOVE_GUN 
		      
		       
		        CALL CLCBUFF
				
				;CALL DELAY
				;CALL DELAY
				;CALL DELAY
				;CALL DELAY



		     
		        NO_PRESSED:
		         
		      
			    CALL MOVE_TARGET_1	
			    CALL MOVE_TARGET_2
			    CALL MOVE_TARGET_3
			    CALL MOVE_TARGET_4
			    CALL MOVE_TARGET_5
			     
				 INC SWITCH
			     JMP CHECK_TIME	
		         CHECK_PLAYER2_1: JMP CHECK_PLAYER2_2
				 
				 
		        NOT_MOVING:
		       
		         ;3- GET WAIT TO GET INPUT FROM THE USER
				 
			     MOV AH,01
		         INT 16H
		         
		         JZ NO_PRESSED2  
				 ;scan code
		         MOV AH,00h
		         INT 16h  
		         ;if it is move LEFT
	             CMP AL,61h ;'a'
		         JE ARROW2
	   	         CMP AL,41h ;'A'
		         JE ARROW2
		
		         ;if it is move RIGTH
		         CMP AL,64h ;'d'
		         JE ARROW2
		         CMP AL,44h ;'D'
		         JE ARROW2
		     
		        ;if it is TAB
		        CMP AL,09h
		        JE SPACE
		        
		        
		        ARROW2:
		        
				 MOV INPUT1, AL
				 
		         CALL MOVE_GUN 
		         
		         CALL RESET_SHOOT_POSITION
				 
		         CALL CLCBUFF
				 
		       ; CALL DELAY
				;CALL DELAY
				;CALL DELAY
				;CALL DELAY


				
			     JMP NO_PRESSED2 
		        
		        SPACE:
		        
		         MOV INPUT1,AL
		         CALL MOVE_SHOOT
		         CALL DRAW_SHOOT
		         
		         CALL CLCBUFF
				 
			   ; CALL DELAY
				;CALL DELAY
				;CALL DELAY
				;CALL DELAY


				
		         NO_PRESSED2:
		        
                 CALL MOVE_TARGET_1	
			     CALL MOVE_TARGET_2
			     CALL MOVE_TARGET_3
			     CALL MOVE_TARGET_4
			     CALL MOVE_TARGET_5
				 
			     INC SWITCH
			     JMP CHECK_TIME
				CHECK_PLAYER2_2: JMP CHECK_PLAYER2 
              ;--------------------------------------------------------------------------------------
	          ;DATA PLAYER 2                     ;
	          ;-----------------------------------------------------------------------
			  
			  CHECK_PLAYER2:
			  
			
			                                                      
			;------------------------------------------                                                
			   MOV AX,SHOOT_Y9 
		      
		       MOV BX,GUN_Y9
		       SUB BX,07H  
		       
		       CMP AX, BX
		      
		       JGE NOT_MOVING9
		       JL  MOVING9
		      
		     
		        MOVING9:
		        
		        
		         CALL MOVE_SHOOT9
		         CALL DRAW_SHOOT9 
		       
		        ;3- GET WAIT TO GET INPUT FROM THE USER
				
				 MOV AH,01
		         INT 16H
		         
		         JZ NO_PRESSED9
				 
				 MOV AH,00h
		         INT 16h
		     
		        ;if it is move LEFT
		        CMP AH,4Bh ;'a'
		        JE ARROW19
				
				;if it is move RIGTH
		        CMP AH,4Dh ;'A'
		        JE ARROW19
		
		        
		        
		        JNE NO_PRESSED9 
		        
		        ARROW19:
		        
		         MOV INPUT2,AH
				 
		         CALL MOVE_GUN9 
		      
		         CALL CLCBUFF
		       
		      ;   CALL DELAY
				;CALL DELAY
				;CALL DELAY
				;CALL DELAY





				
		        NO_PRESSED9:
		         
		      
			     CALL MOVE_TARGET_19	
			     CALL MOVE_TARGET_29
			     CALL MOVE_TARGET_39
			     CALL MOVE_TARGET_49
			     CALL MOVE_TARGET_59
			     
				 DEC SWITCH
			     JMP CHECK_TIME	
		     
		        NOT_MOVING9:
		       
		         ;3- GET WAIT TO GET INPUT FROM THE USER
				 
			    
				 
			     MOV AH,01
		         INT 16H
		         
		         JZ NO_PRESSED29
				 
		         MOV AH,00h
		         INT 16h  
		        ;if it is move LEFT
		        CMP AH,4Bh ;'a'
		        JE ARROW29
				
				;if it is move RIGTH
		        CMP AH,4Dh ;'A'
		        JE ARROW29
		     
		        ;if it is SPACE
		        CMP AL,20h
		        JE SPACE9
		        
		        
		        ARROW29:
		        
				 MOV INPUT2,AH
				
		         CALL MOVE_GUN9 
		        
		         CALL RESET_SHOOT_POSITION9
		      
		         CALL CLCBUFF
				 
			;	 CALL DELAY
			;	CALL DELAY
			;	CALL DELAY
			;	CALL DELAY


				
			     JMP NO_PRESSED29 
		        
		        SPACE9:
		        
		         MOV INPUT2,AL
				 
		         CALL MOVE_SHOOT9
		         CALL DRAW_SHOOT9
				 
		         CALL CLCBUFF
				 
		    ;    CALL DELAY
			;	CALL DELAY
			;	CALL DELAY
			;	CALL DELAY


				
		        NO_PRESSED29:
		        
                 CALL MOVE_TARGET_19
			     CALL MOVE_TARGET_29
			     CALL MOVE_TARGET_39
			     CALL MOVE_TARGET_49
			     CALL MOVE_TARGET_59
			     
				 DEC SWITCH
			     JMP CHECK_TIME
				
				
				
	    RET
	MAIN ENDP
	
	
	CLEAR_SCREEN PROC NEAR               ;clear the screen by restarting the video mode
	
			MOV AH,00h                   ;set the configuration to video mode
			MOV AL,13h                   ;choose the video mode
			INT 10h    					 ;execute the configuration 
		
            MOV AH,0Bh 					 ;set the configuration
			MOV BH,00h 					 ;to the background color
			MOV BL,00h 					 ;choose black as background color
			INT 10h    					 ;execute the configuration
			
			RET
			
	CLEAR_SCREEN ENDP
	
	DRAW_GUN PROC NEAR                  
		
		MOV CX,GUN_X                    ;set the initial column (X)
		MOV DX,GUN_Y                    ;set the initial line (Y)
		
		
		DRAW_GUN_HORIZONTAL1:
		    MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,GUN_X
			PUSH AX
			PUSH DX
			CMP AX,GUN_SIZE_X
			JG DRAW_GUN_VERTICALLY
			 SUB DX,GUN_Y
			 CMP DX,00H
			 JE DRAW_GUN_1_HORIZONTAL
			 CMP DX,01H
			 JE DRAW_GUN_2_HORIZONTAL
			 CMP DX,02H
			 JE DRAW_GUN_3_HORIZONTAL
			
			
			
			 ;---------------------------------
			
			 DRAW_GUN_1_HORIZONTAL:
			
			
			 CMP AX,02H 
			 POP DX
			 JE DRAW_RED_PIXEL
			 DRAW_GUN_HORIZONTAL2:
			
			 
			 POP AX
			
			
			 INC CX
			 JMP DRAW_GUN_HORIZONTAL1
			 DRAW_RED_PIXEL:
			 MOV AH,0Ch                   ;set the configuration to writing a pixel
			 MOV AL,04h 					 ;choose white as color
			 MOV BH,00h 					 ;set the page number 
			 INT 10h			
			 JMP DRAW_GUN_HORIZONTAL2
			 ;-------------------------------------------------
			 DRAW_GUN_2_HORIZONTAL:
			  POP DX
			 CMP AX,00H
			 JE DRAW_PIXEL_1
			
			 CMP AX,04H
			 JE DRAW_PIXEL_1
			 DRAW_GUN_HORIZONTAL3:
			
			
			 POP AX
			
			 INC CX
			 JMP DRAW_GUN_HORIZONTAL1
			 DRAW_PIXEL_1:
			 MOV AH,0Ch                   ;set the configuration to writing a pixel
			 MOV AL,0Fh 					 ;choose white as color
			 MOV BH,00h 					 ;set the page number 
			 INT 10h 
			 JMP DRAW_GUN_HORIZONTAL3
			 ;----------------------------------------------------
			 DRAW_GUN_3_HORIZONTAL:
			 POP DX
			
			 MOV AH,0Ch                   ;set the configuration to writing a pixel
			 MOV AL,0Fh 					 ;choose white as color
			 MOV BH,00h 					 ;set the page number 
			 INT 10h 
			 
			
			 
			 POP AX
			
			 INC CX
			 JMP DRAW_GUN_HORIZONTAL1
			
			
			 ;----------------------------------------------------------
			
			 
			 
			 ;--------------------------------------
			 
			
			DRAW_GUN_VERTICALLY:
			MOV CX,GUN_X
			POP DX
			INC DX
			PUSH DX
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,GUN_Y
			CMP AX,GUN_SIZE_Y
			JNG DRAW_GUN_HORIZONTAL1
			
			
		
		JMP LOOP1
	DRAW_GUN ENDP
	
	DRAW_GUN9 PROC NEAR                  
		
		MOV CX,GUN_X9                    ;set the initial column (X)
		MOV DX,GUN_Y9                    ;set the initial line (Y)
		
		
		DRAW_GUN_HORIZONTAL19:
		    MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,GUN_X9
			PUSH AX
			PUSH DX
			CMP AX,GUN_SIZE_X9
			JG DRAW_GUN_VERTICALLY9
			 SUB DX,GUN_Y9
			 CMP DX,00H
			 JE DRAW_GUN_1_HORIZONTAL9
			 CMP DX,01H
			 JE DRAW_GUN_2_HORIZONTAL9
			 CMP DX,02H
			 JE DRAW_GUN_3_HORIZONTAL9
			
			
			
			 ;---------------------------------
			
			 DRAW_GUN_1_HORIZONTAL9:
			
			
			 CMP AX,02H 
			 POP DX
			 JE DRAW_RED_PIXEL9
			 DRAW_GUN_HORIZONTAL29:
			
			 
			 POP AX
			
			
			 INC CX
			 JMP DRAW_GUN_HORIZONTAL19
			 DRAW_RED_PIXEL9:
			 MOV AH,0Ch                   ;set the configuration to writing a pixel
			 MOV AL,04h 					 ;choose white as color
			 MOV BH,00h 					 ;set the page number 
			 INT 10h			
			 JMP DRAW_GUN_HORIZONTAL29
			 ;-------------------------------------------------
			 DRAW_GUN_2_HORIZONTAL9:
			  POP DX
			 CMP AX,00H
			 JE DRAW_PIXEL_19
			
			 CMP AX,04H
			 JE DRAW_PIXEL_19
			 DRAW_GUN_HORIZONTAL39:
			
			
			 POP AX
			
			 INC CX
			 JMP DRAW_GUN_HORIZONTAL19
			 DRAW_PIXEL_19:
			 MOV AH,0Ch                   ;set the configuration to writing a pixel
			 MOV AL,0Fh 					 ;choose white as color
			 MOV BH,00h 					 ;set the page number 
			 INT 10h 
			 JMP DRAW_GUN_HORIZONTAL39
			 ;----------------------------------------------------
			 DRAW_GUN_3_HORIZONTAL9:
			 POP DX
			
			 MOV AH,0Ch                   ;set the configuration to writing a pixel
			 MOV AL,0Fh 					 ;choose white as color
			 MOV BH,00h 					 ;set the page number 
			 INT 10h 
			 
			
			 
			 POP AX
			
			 INC CX
			 JMP DRAW_GUN_HORIZONTAL19
			
			
			 ;----------------------------------------------------------
			
			 
			 
			 ;--------------------------------------
			 
			
			DRAW_GUN_VERTICALLY9:
			MOV CX,GUN_X9
			POP DX
			INC DX
			PUSH DX
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,GUN_Y9
			CMP AX,GUN_SIZE_Y9
			JNG DRAW_GUN_HORIZONTAL19
			
			
		
		JMP LOOP19
	DRAW_GUN9 ENDP
	
	DRAW_SHOOT PROC NEAR 
	
		
		MOV CX,SHOOT_X                    ;set the initial column (X)
		MOV DX,SHOOT_Y                    ;set the initial line (Y)
		
		
		
		
		DRAW_SHOOT_HORIZONTAL:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,04h 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,SHOOT_X
			CMP AX,SHOOT_SIZE
			JNG DRAW_SHOOT_HORIZONTAL
			
			MOV CX,SHOOT_X 				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,SHOOT_Y
			CMP AX,SHOOT_SIZE
			JNG DRAW_SHOOT_HORIZONTAL
		
		RET
	DRAW_SHOOT ENDP
	
	DRAW_SHOOT9 PROC NEAR 
	
		
		MOV CX,SHOOT_X9                    ;set the initial column (X)
		MOV DX,SHOOT_Y9                    ;set the initial line (Y)
		
		
		
		
		DRAW_SHOOT_HORIZONTAL9:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,04h 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,SHOOT_X9
			CMP AX,SHOOT_SIZE9
			JNG DRAW_SHOOT_HORIZONTAL9
			
			MOV CX,SHOOT_X9 				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,SHOOT_Y9
			CMP AX,SHOOT_SIZE9
			JNG DRAW_SHOOT_HORIZONTAL9
		
		RET
	DRAW_SHOOT9 ENDP
	
	
	
	
	
	MOVE_SHOOT PROC NEAR
	                     
			 
			 
		 MOV AX,SHOOT_Y
;       Move the ball horizontally
		MOV AX,SHOOT_VELOCITY    
		SUB SHOOT_Y,AX 
		
		MOV AX,SHOOT_Y                  
		
;       Check if the ball has passed the left boundarie (BALL_X < 0 + WINDOW_BOUNDS)
;       If is colliding, restart its position		
		MOV AX,WINDOW_BOUNDS
		CMP SHOOT_Y,AX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL  RESET_1_SHOOT_POSITION1
				
		
		; maxx1 > minx2 && minx1 < maxx2 && maxy1 > miny2 && miny1 < maxy2
		; SHOOT_X > PADDLE_LEFT_X && BALL_X < PADDLE_LEFT_X + PADDLE_WIDTH 
		; && BALL_Y + BALL_SIZE > PADDLE_LEFT_Y && BALL_Y < PADDLE_LEFT_Y + PADDLE_HEIGHT
		
		;CHECK_COLLISION_WITH_TARGET_1
		;----------------------------------------------------------------------------------------------
		;;TRY TOP LEFT OF THE SHOOT
		MOV AX,SHOOT_X
		CMP AX,TARGET_1_X
		JL  NOTHING2_1  ;if there's no collision exit procedure
		

		MOV AX,TARGET_1_X
		ADD AX,TARGET_SIZE_X
		CMP SHOOT_X,AX
		JG  NOTHING2_1 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y
		CMP AX,TARGET_1_Y
		JL  NOTHING2_1  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_1_Y
		ADD AX,TARGET_SIZE_Y
		CMP SHOOT_Y,AX
		JG  NOTHING2_1 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
        JMP SET_2_SCORE_SHOOT_POSITION1
		RESET_1_SHOOT_POSITION1: JMP RESET_2_SHOOT_POSITION1
		
		;----------------------------------------------------------------------------------
		;;TRY TOP RIGHT OF THE SHOOT
		NOTHING2_1:
		
		MOV AX,SHOOT_X
		ADD AX,SHOOT_SIZE
		CMP AX,TARGET_1_X
		JL  NOTHING2_2  ;if there's no collision exit procedure
		

		MOV AX,TARGET_1_X
		ADD AX,TARGET_SIZE_X
		MOV BX,SHOOT_X
		ADD BX,SHOOT_SIZE
		CMP BX,AX
		JG  NOTHING2_2 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y
		CMP AX,TARGET_1_Y
		JL  NOTHING2_2  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_1_Y
		ADD AX,TARGET_SIZE_Y
		CMP SHOOT_Y,AX
		JG  NOTHING2_2 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
		
        SET_2_SCORE_SHOOT_POSITION1: JMP GIVE_POINT_TO_PLAYER_T1
		
		RESET_2_SHOOT_POSITION1: JMP RESET_SHOOT_POSITION1
		
		NOTHING2_2: JMP CHECK_COLLISION_WITH_TARGET_2
		
		
		;-------------------------------------------------------------------------------------------
		
		
		GIVE_POINT_TO_PLAYER_T1:		 ;give one point to the player one and reset ball position
			INC PLAYER_ONE_POINTS       ;increment player one points
			CALL RESET_SHOOT_POSITION     ;reset ball position to the center of the screen
			
			CALL UPDATE_TEXT_PLAYER_POINTS ;update the text of the player one points
			
		
		 RET
		
		 RESET_SHOOT_POSITION1:
		 CALL RESET_SHOOT_POSITION
		 
		 RET
		;---------------------------------------------------------------------------
		;--------------------------------------------------------------------------
		
		 CHECK_COLLISION_WITH_TARGET_2:
		 
		 ;;TRY TOP LEFT OF THE SHOOT
		MOV AX,SHOOT_X
		CMP AX,TARGET_2_X
		JL  NOTHING2_1_2  ;if there's no collision exit procedure
		

		MOV AX,TARGET_2_X
		ADD AX,TARGET_SIZE_X
		CMP SHOOT_X,AX
		JG  NOTHING2_1_2 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y
		CMP AX,TARGET_2_Y
		JL  NOTHING2_1_2  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_2_Y
		ADD AX,TARGET_SIZE_Y
		CMP SHOOT_Y,AX
		JG  NOTHING2_1_2 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
        JMP SET_2_SCORE_SHOOT_POSITION1_2
		
		;----------------------------------------------------------------------------------
		;;TRY TOP RIGHT OF THE SHOOT
		NOTHING2_1_2:
		
		MOV AX,SHOOT_X
		ADD AX,SHOOT_SIZE
		CMP AX,TARGET_2_X
		JL  NOTHING2_2_2  ;if there's no collision exit procedure
		

		MOV AX,TARGET_2_X
		ADD AX,TARGET_SIZE_X
		MOV BX,SHOOT_X
		ADD BX,SHOOT_SIZE
		CMP BX,AX
		JG  NOTHING2_2_2 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y
		CMP AX,TARGET_2_Y
		JL  NOTHING2_2_2  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_2_Y
		ADD AX,TARGET_SIZE_Y
		CMP SHOOT_Y,AX
		JG  NOTHING2_2_2 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
		
        SET_2_SCORE_SHOOT_POSITION1_2: JMP GIVE_POINT_TO_PLAYER_T2
		
		
		NOTHING2_2_2: JMP CHECK_COLLISION_WITH_TARGET_3
		
		
		;-------------------------------------------------------------------------------------------
		GIVE_POINT_TO_PLAYER_T2:		 ;give one point to the player one and reset ball position
			ADD PLAYER_ONE_POINTS,02H       ;increment player TWO points
			CALL RESET_SHOOT_POSITION     ;reset ball position to the center of the screen
			
			CALL UPDATE_TEXT_PLAYER_POINTS ;update the text of the player one points
			
		
		 RET
		
		;--------------------------------------------------------------------------- 
		 CHECK_COLLISION_WITH_TARGET_3:
		 
		 ;;TRY TOP LEFT OF THE SHOOT
		MOV AX,SHOOT_X
		CMP AX,TARGET_3_X
		JL  NOTHING2_1_3  ;if there's no collision exit procedure
		

		MOV AX,TARGET_3_X
		ADD AX,TARGET_SIZE_X
		CMP SHOOT_X,AX
		JG  NOTHING2_1_3 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y
		CMP AX,TARGET_3_Y
		JL  NOTHING2_1_3  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_3_Y
		ADD AX,TARGET_SIZE_Y
		CMP SHOOT_Y,AX
		JG  NOTHING2_1_3 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
        JMP SET_2_SCORE_SHOOT_POSITION1_3
		
		;----------------------------------------------------------------------------------
		;;TRY TOP RIGHT OF THE SHOOT
		NOTHING2_1_3:
		
		MOV AX,SHOOT_X
		ADD AX,SHOOT_SIZE
		CMP AX,TARGET_3_X
		JL  NOTHING2_2_3  ;if there's no collision exit procedure
		

		MOV AX,TARGET_3_X
		ADD AX,TARGET_SIZE_X
		MOV BX,SHOOT_X
		ADD BX,SHOOT_SIZE
		CMP BX,AX
		JG  NOTHING2_2_3 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y
		CMP AX,TARGET_3_Y
		JL  NOTHING2_2_3  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_3_Y
		ADD AX,TARGET_SIZE_Y
		CMP SHOOT_Y,AX
		JG  NOTHING2_2_3 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
		
        SET_2_SCORE_SHOOT_POSITION1_3: JMP GIVE_POINT_TO_PLAYER_T3
		
		
		NOTHING2_2_3: JMP CHECK_COLLISION_WITH_TARGET_4
		
		
		;-------------------------------------------------------------------------------------------
		GIVE_POINT_TO_PLAYER_T3:		 ;give one point to the player one and reset ball position
			ADD PLAYER_ONE_POINTS,03H       ;increment player TWO points
			CALL RESET_SHOOT_POSITION     ;reset ball position to the center of the screen
			
			CALL UPDATE_TEXT_PLAYER_POINTS ;update the text of the player one points
			
		
		 RET
		
		;--------------------------------------------------------------------------- 
		 CHECK_COLLISION_WITH_TARGET_4:
		 
		 ;;TRY TOP LEFT OF THE SHOOT
		MOV AX,SHOOT_X
		CMP AX,TARGET_4_X
		JL  NOTHING2_1_4  ;if there's no collision exit procedure
		

		MOV AX,TARGET_4_X
		ADD AX,TARGET_SIZE_X
		CMP SHOOT_X,AX
		JG  NOTHING2_1_4 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y
		CMP AX,TARGET_4_Y
		JL  NOTHING2_1_4  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_4_Y
		ADD AX,TARGET_SIZE_Y
		CMP SHOOT_Y,AX
		JG  NOTHING2_1_4 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
        JMP SET_2_SCORE_SHOOT_POSITION1_4
		
		;----------------------------------------------------------------------------------
		;;TRY TOP RIGHT OF THE SHOOT
		NOTHING2_1_4:
		
		MOV AX,SHOOT_X
		ADD AX,SHOOT_SIZE
		CMP AX,TARGET_4_X
		JL  NOTHING2_2_4  ;if there's no collision exit procedure
		

		MOV AX,TARGET_4_X
		ADD AX,TARGET_SIZE_X
		MOV BX,SHOOT_X
		ADD BX,SHOOT_SIZE
		CMP BX,AX
		JG  NOTHING2_2_4 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y
		CMP AX,TARGET_4_Y
		JL  NOTHING2_2_4  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_4_Y
		ADD AX,TARGET_SIZE_Y
		CMP SHOOT_Y,AX
		JG  NOTHING2_2_4 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
		
        SET_2_SCORE_SHOOT_POSITION1_4: JMP GIVE_POINT_TO_PLAYER_T4
		
		
		NOTHING2_2_4: JMP CHECK_COLLISION_WITH_TARGET_5
		
		
		;-------------------------------------------------------------------------------------------
		GIVE_POINT_TO_PLAYER_T4:		 ;give one point to the player one and reset ball position
			ADD PLAYER_ONE_POINTS,04H       ;increment player TWO points
			CALL RESET_SHOOT_POSITION     ;reset ball position to the center of the screen
			
			CALL UPDATE_TEXT_PLAYER_POINTS ;update the text of the player one points
			
		
		 RET
		
		;--------------------------------------------------------------------------- 
		 CHECK_COLLISION_WITH_TARGET_5:
		 
		 ;;TRY TOP LEFT OF THE SHOOT
		MOV AX,SHOOT_X
		CMP AX,TARGET_5_X
		JL  NOTHING2_1_5  ;if there's no collision exit procedure
		

		MOV AX,TARGET_5_X
		ADD AX,TARGET_SIZE_X
		CMP SHOOT_X,AX
		JG  NOTHING2_1_5 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y
		CMP AX,TARGET_5_Y
		JL  NOTHING2_1_5  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_5_Y
		ADD AX,TARGET_SIZE_Y
		CMP SHOOT_Y,AX
		JG  NOTHING2_1_5 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
        JMP SET_2_SCORE_SHOOT_POSITION1_5
		
		;----------------------------------------------------------------------------------
		;;TRY TOP RIGHT OF THE SHOOT
		NOTHING2_1_5:
		
		MOV AX,SHOOT_X
		ADD AX,SHOOT_SIZE
		CMP AX,TARGET_5_X
		JL  NOTHING2_2_5  ;if there's no collision exit procedure
		

		MOV AX,TARGET_5_X
		ADD AX,TARGET_SIZE_X
		MOV BX,SHOOT_X
		ADD BX,SHOOT_SIZE
		CMP BX,AX
		JG  NOTHING2_2_5 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y
		CMP AX,TARGET_5_Y
		JL  NOTHING2_2_5  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_5_Y
		ADD AX,TARGET_SIZE_Y
		CMP SHOOT_Y,AX
		JG  NOTHING2_2_5 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
		
        SET_2_SCORE_SHOOT_POSITION1_5: JMP GIVE_POINT_TO_PLAYER_T5
		
		
		NOTHING2_2_5: JMP NOTHINNG
		
		
		;-------------------------------------------------------------------------------------------
		GIVE_POINT_TO_PLAYER_T5:		 ;give one point to the player one and reset ball position
			ADD PLAYER_ONE_POINTS,05H       ;increment player TWO points
			CALL RESET_SHOOT_POSITION     ;reset ball position to the center of the screen
			
			CALL UPDATE_TEXT_PLAYER_POINTS ;update the text of the player one points
			
		
		 RET
		 
		 NOTHINNG:
		 
		 RET
		
		;--------------------------------------------------------------------------- 
	MOVE_SHOOT ENDP
	
	MOVE_SHOOT9 PROC NEAR
	                     
			 
			 
		 MOV AX,SHOOT_Y9
;       Move the ball horizontally
		MOV AX,SHOOT_VELOCITY9    
		SUB SHOOT_Y9,AX 
		
		MOV AX,SHOOT_Y9                  
		
;       Check if the ball has passed the left boundarie (BALL_X < 0 + WINDOW_BOUNDS)
;       If is colliding, restart its position		
		MOV AX,WINDOW_BOUNDS
		CMP SHOOT_Y9,AX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL  RESET_1_SHOOT_POSITION19
		
		MOV AX,WINDOW_BOUNDS
		MOV BX,0A0H
		ADD BX,AX
		CMP SHOOT_X9,BX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL  RESET_1_SHOOT_POSITION19
		; maxx1 > minx2 && minx1 < maxx2 && maxy1 > miny2 && miny1 < maxy2
		; SHOOT_X > PADDLE_LEFT_X && BALL_X < PADDLE_LEFT_X + PADDLE_WIDTH 
		; && BALL_Y + BALL_SIZE > PADDLE_LEFT_Y && BALL_Y < PADDLE_LEFT_Y + PADDLE_HEIGHT
		
		;CHECK_COLLISION_WITH_TARGET_1
		;----------------------------------------------------------------------------------------------
		;;TRY TOP LEFT OF THE SHOOT
		MOV AX,SHOOT_X9
		CMP AX,TARGET_1_X9
		JL  NOTHING2_19  ;if there's no collision exit procedure
		

		MOV AX,TARGET_1_X9
		ADD AX,TARGET_SIZE_X9
		CMP SHOOT_X9,AX
		JG  NOTHING2_19 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y9
		CMP AX,TARGET_1_Y9
		JL  NOTHING2_19  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_1_Y9
		ADD AX,TARGET_SIZE_Y9
		CMP SHOOT_Y9,AX
		JG  NOTHING2_19 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
        JMP SET_2_SCORE_SHOOT_POSITION19
		RESET_1_SHOOT_POSITION19: JMP RESET_2_SHOOT_POSITION19
		
		;----------------------------------------------------------------------------------
		;;TRY TOP RIGHT OF THE SHOOT
		NOTHING2_19:
		
		MOV AX,SHOOT_X9
		ADD AX,SHOOT_SIZE9
		CMP AX,TARGET_1_X9
		JL  NOTHING2_29  ;if there's no collision exit procedure
		

		MOV AX,TARGET_1_X9
		ADD AX,TARGET_SIZE_X9
		MOV BX,SHOOT_X9
		ADD BX,SHOOT_SIZE9
		CMP BX,AX
		JG  NOTHING2_29 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y9
		CMP AX,TARGET_1_Y9
		JL  NOTHING2_29  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_1_Y9
		ADD AX,TARGET_SIZE_Y9
		CMP SHOOT_Y9,AX
		JG  NOTHING2_29 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
		
        SET_2_SCORE_SHOOT_POSITION19: JMP GIVE_POINT_TO_PLAYER_T19
		
		RESET_2_SHOOT_POSITION19: JMP RESET_SHOOT_POSITION19
		
		NOTHING2_29: JMP CHECK_COLLISION_WITH_TARGET_29
		
		
		;-------------------------------------------------------------------------------------------
		
		
		GIVE_POINT_TO_PLAYER_T19:		 ;give one point to the player one and reset ball position
			INC PLAYER_ONE_POINTS9       ;increment player one points
			CALL RESET_SHOOT_POSITION9    ;reset ball position to the center of the screen
			
			CALL UPDATE_TEXT_PLAYER_POINTS9 ;update the text of the player one points
			
		
		 RET
		
		 RESET_SHOOT_POSITION19:
		 CALL RESET_SHOOT_POSITION9
		 
		 RET
		;---------------------------------------------------------------------------
		;--------------------------------------------------------------------------
		
		 CHECK_COLLISION_WITH_TARGET_29:
		 
		 ;;TRY TOP LEFT OF THE SHOOT
		MOV AX,SHOOT_X9
		CMP AX,TARGET_2_X9
		JL  NOTHING2_1_29  ;if there's no collision exit procedure
		

		MOV AX,TARGET_2_X9
		ADD AX,TARGET_SIZE_X9
		CMP SHOOT_X9,AX
		JG  NOTHING2_1_29 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y9
		CMP AX,TARGET_2_Y9
		JL  NOTHING2_1_29  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_2_Y9
		ADD AX,TARGET_SIZE_Y9
		CMP SHOOT_Y9,AX
		JG  NOTHING2_1_29 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
        JMP SET_2_SCORE_SHOOT_POSITION1_29
		
		;----------------------------------------------------------------------------------
		;;TRY TOP RIGHT OF THE SHOOT
		NOTHING2_1_29:
		
		MOV AX,SHOOT_X9
		ADD AX,SHOOT_SIZE9
		CMP AX,TARGET_2_X9
		JL  NOTHING2_2_29  ;if there's no collision exit procedure
		

		MOV AX,TARGET_2_X9
		ADD AX,TARGET_SIZE_X9
		MOV BX,SHOOT_X9
		ADD BX,SHOOT_SIZE9
		CMP BX,AX
		JG  NOTHING2_2_29 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y9
		CMP AX,TARGET_2_Y9
		JL  NOTHING2_2_29  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_2_Y9
		ADD AX,TARGET_SIZE_Y9
		CMP SHOOT_Y9,AX
		JG  NOTHING2_2_29 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
		
        SET_2_SCORE_SHOOT_POSITION1_29: JMP GIVE_POINT_TO_PLAYER_T29
		
		
		NOTHING2_2_29: JMP CHECK_COLLISION_WITH_TARGET_39
		
		
		;-------------------------------------------------------------------------------------------
		GIVE_POINT_TO_PLAYER_T29:		 ;give one point to the player one and reset ball position
			ADD PLAYER_ONE_POINTS9,02H       ;increment player TWO points
			CALL RESET_SHOOT_POSITION9     ;reset ball position to the center of the screen
			
			CALL UPDATE_TEXT_PLAYER_POINTS9 ;update the text of the player one points
			
		
		 RET
		
		;--------------------------------------------------------------------------- 
		 CHECK_COLLISION_WITH_TARGET_39:
		 
		 ;;TRY TOP LEFT OF THE SHOOT
		MOV AX,SHOOT_X9
		CMP AX,TARGET_3_X9
		JL  NOTHING2_1_39  ;if there's no collision exit procedure
		

		MOV AX,TARGET_3_X9
		ADD AX,TARGET_SIZE_X9
		CMP SHOOT_X9,AX
		JG  NOTHING2_1_39 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y9
		CMP AX,TARGET_3_Y9
		JL  NOTHING2_1_39  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_3_Y9
		ADD AX,TARGET_SIZE_Y9
		CMP SHOOT_Y9,AX
		JG  NOTHING2_1_39 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
        JMP SET_2_SCORE_SHOOT_POSITION1_39
		
		;----------------------------------------------------------------------------------
		;;TRY TOP RIGHT OF THE SHOOT
		NOTHING2_1_39:
		
		MOV AX,SHOOT_X9
		ADD AX,SHOOT_SIZE9
		CMP AX,TARGET_3_X9
		JL  NOTHING2_2_39  ;if there's no collision exit procedure
		

		MOV AX,TARGET_3_X9
		ADD AX,TARGET_SIZE_X9
		MOV BX,SHOOT_X9
		ADD BX,SHOOT_SIZE9
		CMP BX,AX
		JG  NOTHING2_2_39 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y9
		CMP AX,TARGET_3_Y9
		JL  NOTHING2_2_39  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_3_Y9
		ADD AX,TARGET_SIZE_Y9
		CMP SHOOT_Y9,AX
		JG  NOTHING2_2_39 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
		
        SET_2_SCORE_SHOOT_POSITION1_39: JMP GIVE_POINT_TO_PLAYER_T39
		
		
		NOTHING2_2_39: JMP CHECK_COLLISION_WITH_TARGET_49
		
		
		;-------------------------------------------------------------------------------------------
		GIVE_POINT_TO_PLAYER_T39:		 ;give one point to the player one and reset ball position
			ADD PLAYER_ONE_POINTS9,03H       ;increment player TWO points
			CALL RESET_SHOOT_POSITION9     ;reset ball position to the center of the screen
			
			CALL UPDATE_TEXT_PLAYER_POINTS9 ;update the text of the player one points
			
		
		 RET
		
		;--------------------------------------------------------------------------- 
		 CHECK_COLLISION_WITH_TARGET_49:
		 
		 ;;TRY TOP LEFT OF THE SHOOT
		MOV AX,SHOOT_X9
		CMP AX,TARGET_4_X9
		JL  NOTHING2_1_49 ;if there's no collision exit procedure
		

		MOV AX,TARGET_4_X9
		ADD AX,TARGET_SIZE_X9
		CMP SHOOT_X9,AX
		JG  NOTHING2_1_49 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y9
		CMP AX,TARGET_4_Y9
		JL  NOTHING2_1_49 ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_4_Y9
		ADD AX,TARGET_SIZE_Y9
		CMP SHOOT_Y9,AX
		JG  NOTHING2_1_49 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
        JMP SET_2_SCORE_SHOOT_POSITION1_49
		
		;----------------------------------------------------------------------------------
		;;TRY TOP RIGHT OF THE SHOOT
		NOTHING2_1_49:
		
		MOV AX,SHOOT_X9
		ADD AX,SHOOT_SIZE9
		CMP AX,TARGET_4_X9
		JL  NOTHING2_2_49  ;if there's no collision exit procedure
		

		MOV AX,TARGET_4_X9
		ADD AX,TARGET_SIZE_X9
		MOV BX,SHOOT_X9
		ADD BX,SHOOT_SIZE9
		CMP BX,AX
		JG  NOTHING2_2_49 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y9
		CMP AX,TARGET_4_Y9
		JL  NOTHING2_2_49  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_4_Y9
		ADD AX,TARGET_SIZE_Y9
		CMP SHOOT_Y9,AX
		JG  NOTHING2_2_49 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
		
        SET_2_SCORE_SHOOT_POSITION1_49: JMP GIVE_POINT_TO_PLAYER_T49
		
		
		NOTHING2_2_49: JMP CHECK_COLLISION_WITH_TARGET_59
		
		
		;-------------------------------------------------------------------------------------------
		GIVE_POINT_TO_PLAYER_T49:		 ;give one point to the player one and reset ball position
			ADD PLAYER_ONE_POINTS9,04H       ;increment player TWO points
			CALL RESET_SHOOT_POSITION9     ;reset ball position to the center of the screen
			
			CALL UPDATE_TEXT_PLAYER_POINTS9 ;update the text of the player one points
			
		
		 RET
		
		;--------------------------------------------------------------------------- 
		 CHECK_COLLISION_WITH_TARGET_59:
		 
		 ;;TRY TOP LEFT OF THE SHOOT
		MOV AX,SHOOT_X9
		CMP AX,TARGET_5_X9
		JL  NOTHING2_1_59  ;if there's no collision exit procedure
		

		MOV AX,TARGET_5_X9
		ADD AX,TARGET_SIZE_X9
		CMP SHOOT_X9,AX
		JG  NOTHING2_1_59 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y9
		CMP AX,TARGET_5_Y9
		JL  NOTHING2_1_59  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_5_Y9
		ADD AX,TARGET_SIZE_Y9
		CMP SHOOT_Y9,AX
		JG  NOTHING2_1_59 ;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
        JMP SET_2_SCORE_SHOOT_POSITION1_59
		
		;----------------------------------------------------------------------------------
		;;TRY TOP RIGHT OF THE SHOOT
		NOTHING2_1_59:
		
		MOV AX,SHOOT_X9
		ADD AX,SHOOT_SIZE9
		CMP AX,TARGET_5_X9
		JL  NOTHING2_2_59 ;if there's no collision exit procedure
		

		MOV AX,TARGET_5_X9
		ADD AX,TARGET_SIZE_X9
		MOV BX,SHOOT_X9
		ADD BX,SHOOT_SIZE9
		CMP BX,AX
		JG  NOTHING2_2_59 ;if there's no collision exit procedure
		
		MOV AX,SHOOT_Y9
		CMP AX,TARGET_5_Y9
		JL  NOTHING2_2_59  ;if there's no collision exit procedure
		
		
		MOV AX,TARGET_5_Y9
		ADD AX,TARGET_SIZE_Y9
		CMP SHOOT_Y9,AX
		JG  NOTHING2_2_59;if there's no collision exit procedure
		
;       If it reaches this point, the ball is colliding with the left paddle
		
        SET_2_SCORE_SHOOT_POSITION1_59: JMP GIVE_POINT_TO_PLAYER_T59
		
		
		NOTHING2_2_59: JMP NOTHINNG9
		
		
		;-------------------------------------------------------------------------------------------
		GIVE_POINT_TO_PLAYER_T59:		 ;give one point to the player one and reset ball position
			ADD PLAYER_ONE_POINTS9,05H       ;increment player TWO points
			CALL RESET_SHOOT_POSITION9     ;reset ball position to the center of the screen
			
			CALL UPDATE_TEXT_PLAYER_POINTS9 ;update the text of the player one points
			
		
		 RET
		 
		 NOTHINNG9:
		 
		 RET
		
		;--------------------------------------------------------------------------- 
	MOVE_SHOOT9 ENDP
	
	RESET_SHOOT_POSITION PROC NEAR        ;restart ball position to the original position
		
		MOV AX,GUN_X
		ADD AX,01H
		MOV SHOOT_X,AX
		
		
		
		MOV AX,GUN_Y
		SUB AX,07H
		MOV SHOOT_Y,AX
		
		
		RET
	RESET_SHOOT_POSITION ENDP
	
	RESET_SHOOT_POSITION9 PROC NEAR        ;restart ball position to the original position
		
		MOV AX,GUN_X9
		ADD AX,01H
		MOV SHOOT_X9,AX
		
		
		
		MOV AX,GUN_Y9
		SUB AX,07H
		MOV SHOOT_Y9,AX
		
		
		RET
	RESET_SHOOT_POSITION9 ENDP
	
	
	DELAY PROC NEAR
	
	MOV CX,60000D
	PASS2: LOOP PASS2
	RET
	DELAY ENDP 
	
	MOVE_GUN PROC NEAR               ;process movement of the paddles
		
		
		;check which key is being pressed (AL = ASCII character)
		;MOV AH,00h
		;INT 16h
		
		;if it is 'w' or 'W' move up
		CMP INPUT1,61h ;'w'
		JE MOVE_GUN_LEFT
		CMP INPUT1,41h ;'W'
		JE MOVE_GUN_LEFT
		
		;if it is 's' or 'S' move down
		CMP INPUT1,64h ;'s'
		JE MOVE_GUN_RIGHT
		CMP INPUT1,44h ;'S'
		JE MOVE_GUN_RIGHT
		JMP EXIT_GUN_MOVEMENT
		
		MOVE_GUN_LEFT:
			MOV AX,GUN_VELOCITY
			SUB GUN_X,AX
			
			MOV AX,WINDOW_BOUNDS
			CMP GUN_X,AX
			JL FIX_GUN_LEFT_POSITION
			JMP EXIT_GUN_MOVEMENT
			
			FIX_GUN_LEFT_POSITION:
				MOV GUN_X,AX
				JMP EXIT_GUN_MOVEMENT
			
		MOVE_GUN_RIGHT:
			MOV AX,GUN_VELOCITY
			ADD GUN_X,AX
			
			
		
			MOV AX,WINDOW_BOUNDS
			MOV BX,0A0H
		    SUB BX,AX
			CMP GUN_X,BX
			JG FIX_GUN_RIGHT_POSITION
			
			JMP EXIT_GUN_MOVEMENT
			
			FIX_GUN_RIGHT_POSITION:
				MOV GUN_X,BX
				JMP EXIT_GUN_MOVEMENT
		
		
		
		EXIT_GUN_MOVEMENT:
		
			RET
		
	MOVE_GUN ENDP
	
	MOVE_GUN9 PROC NEAR               ;process movement of the paddles
		
		
		;check which key is being pressed (AL = ASCII character)
		;MOV AH,00h
		;INT 16h
		
		;if it is 'w' or 'W' move up
		CMP INPUT2,4Bh ;'w'
		JE MOVE_GUN_LEFT9
		CMP INPUT2,4Dh ;'W'
		JE MOVE_GUN_RIGHT9
		JMP EXIT_GUN_MOVEMENT9
		
		MOVE_GUN_LEFT9:
			MOV AX,GUN_VELOCITY9
			SUB GUN_X9,AX
			
			MOV AX,WINDOW_BOUNDS
			MOV BX,0A0H
		    ADD BX,AX	
			CMP GUN_X9,BX
			JL FIX_GUN_LEFT_POSITION9
			JMP EXIT_GUN_MOVEMENT9
			
			FIX_GUN_LEFT_POSITION9:
				MOV GUN_X9,BX
				JMP EXIT_GUN_MOVEMENT9
			
		MOVE_GUN_RIGHT9:
			MOV AX,GUN_VELOCITY9
			ADD GUN_X9,AX
			
			
		
			MOV AX,WINDOW_WIDTH
			MOV BX,WINDOW_BOUNDS
		    SUB AX,BX
			CMP GUN_X9,AX
			JG FIX_GUN_RIGHT_POSITION9
			
			JMP EXIT_GUN_MOVEMENT9
			
			FIX_GUN_RIGHT_POSITION9:
				MOV GUN_X9,AX
				JMP EXIT_GUN_MOVEMENT9
		
		
		
		EXIT_GUN_MOVEMENT9:
		
			RET
		
	MOVE_GUN9 ENDP
	
	DRAW_1_TARGET PROC NEAR 
	
		
		MOV CX,TARGET_1_X                    ;set the initial column (X)
		MOV DX,TARGET_1_Y                   ;set the initial line (Y)
		
		
		
		
		DRAW_TARGET_1_HORIZONTAL:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,0Fh 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,TARGET_1_X
			CMP AX,TARGET_SIZE_X
			JNG DRAW_TARGET_1_HORIZONTAL
			
			MOV CX,TARGET_1_X 				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,TARGET_1_Y
			CMP AX,TARGET_SIZE_Y
			JNG DRAW_TARGET_1_HORIZONTAL
		
		RET
	DRAW_1_TARGET ENDP
	
	DRAW_1_TARGET9 PROC NEAR 
	
		
		MOV CX,TARGET_1_X9                    ;set the initial column (X)
		MOV DX,TARGET_1_Y9                   ;set the initial line (Y)
		
		
		
		
		DRAW_TARGET_1_HORIZONTAL9:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,0Fh 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,TARGET_1_X9
			CMP AX,TARGET_SIZE_X9
			JNG DRAW_TARGET_1_HORIZONTAL9
			
			MOV CX,TARGET_1_X9 				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,TARGET_1_Y9
			CMP AX,TARGET_SIZE_Y9
			JNG DRAW_TARGET_1_HORIZONTAL9
		
		RET
	DRAW_1_TARGET9 ENDP
	
	DRAW_2_TARGET PROC NEAR 
	
		
		MOV CX,TARGET_2_X                    ;set the initial column (X)
		MOV DX,TARGET_2_Y                   ;set the initial line (Y)
		
		
		
		
		DRAW_TARGET_2_HORIZONTAL:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,08h 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,TARGET_2_X
			CMP AX,TARGET_SIZE_X
			JNG DRAW_TARGET_2_HORIZONTAL
			
			MOV CX,TARGET_2_X 				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,TARGET_2_Y
			CMP AX,TARGET_SIZE_Y
			JNG DRAW_TARGET_2_HORIZONTAL
		
		RET
	DRAW_2_TARGET ENDP
	
	DRAW_2_TARGET9 PROC NEAR 
	
		
		MOV CX,TARGET_2_X9                    ;set the initial column (X)
		MOV DX,TARGET_2_Y9                   ;set the initial line (Y)
		
		
		
		
		DRAW_TARGET_2_HORIZONTAL9:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,08h 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,TARGET_2_X9
			CMP AX,TARGET_SIZE_X9
			JNG DRAW_TARGET_2_HORIZONTAL9
			
			MOV CX,TARGET_2_X9 				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,TARGET_2_Y9
			CMP AX,TARGET_SIZE_Y9
			JNG DRAW_TARGET_2_HORIZONTAL9
		
		RET
	DRAW_2_TARGET9 ENDP
	
	DRAW_3_TARGET PROC NEAR 
	
		
		MOV CX,TARGET_3_X                    ;set the initial column (X)
		MOV DX,TARGET_3_Y                   ;set the initial line (Y)
		
		
		
		
		DRAW_TARGET_3_HORIZONTAL:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,03h 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,TARGET_3_X
			CMP AX,TARGET_SIZE_X
			JNG DRAW_TARGET_3_HORIZONTAL
			
			MOV CX,TARGET_3_X 				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,TARGET_3_Y
			CMP AX,TARGET_SIZE_Y
			JNG DRAW_TARGET_3_HORIZONTAL
		
		RET
	DRAW_3_TARGET ENDP
	
	DRAW_3_TARGET9 PROC NEAR 
	
		
		MOV CX,TARGET_3_X9                    ;set the initial column (X)
		MOV DX,TARGET_3_Y9                   ;set the initial line (Y)
		
		
		
		
		DRAW_TARGET_3_HORIZONTAL9:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,03h 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,TARGET_3_X9
			CMP AX,TARGET_SIZE_X9
			JNG DRAW_TARGET_3_HORIZONTAL9
			
			MOV CX,TARGET_3_X9 				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,TARGET_3_Y9
			CMP AX,TARGET_SIZE_Y9
			JNG DRAW_TARGET_3_HORIZONTAL9
		
		RET
	DRAW_3_TARGET9 ENDP
	
	DRAW_4_TARGET PROC NEAR 
	
		
		MOV CX,TARGET_4_X                    ;set the initial column (X)
		MOV DX,TARGET_4_Y                   ;set the initial line (Y)
		
		
		
		
		DRAW_TARGET_4_HORIZONTAL:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,04h 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,TARGET_4_X
			CMP AX,TARGET_SIZE_X
			JNG DRAW_TARGET_4_HORIZONTAL
			
			MOV CX,TARGET_4_X 				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,TARGET_4_Y
			CMP AX,TARGET_SIZE_Y
			JNG DRAW_TARGET_4_HORIZONTAL
		
		RET
	DRAW_4_TARGET ENDP
	
	DRAW_4_TARGET9 PROC NEAR 
	
		
		MOV CX,TARGET_4_X9                    ;set the initial column (X)
		MOV DX,TARGET_4_Y9                   ;set the initial line (Y)
		
		
		
		
		DRAW_TARGET_4_HORIZONTAL9:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,04h 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,TARGET_4_X9
			CMP AX,TARGET_SIZE_X9
			JNG DRAW_TARGET_4_HORIZONTAL9
			
			MOV CX,TARGET_4_X9 				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,TARGET_4_Y9
			CMP AX,TARGET_SIZE_Y9
			JNG DRAW_TARGET_4_HORIZONTAL9
		
		RET
	DRAW_4_TARGET9 ENDP
	
	DRAW_5_TARGET PROC NEAR 
	
		
		MOV CX,TARGET_5_X                    ;set the initial column (X)
		MOV DX,TARGET_5_Y                   ;set the initial line (Y)
		
		
		
		
		DRAW_TARGET_5_HORIZONTAL:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,02h 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,TARGET_5_X
			CMP AX,TARGET_SIZE_X
			JNG DRAW_TARGET_5_HORIZONTAL
			
			MOV CX,TARGET_5_X 				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,TARGET_5_Y
			CMP AX,TARGET_SIZE_Y
			JNG DRAW_TARGET_5_HORIZONTAL
		
		RET
	DRAW_5_TARGET ENDP
	
	DRAW_5_TARGET9 PROC NEAR 
	
		
		MOV CX,TARGET_5_X9                    ;set the initial column (X)
		MOV DX,TARGET_5_Y9                   ;set the initial line (Y)
		
		
		
		
		DRAW_TARGET_5_HORIZONTAL9:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,02h 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,TARGET_5_X9
			CMP AX,TARGET_SIZE_X9
			JNG DRAW_TARGET_5_HORIZONTAL9
			
			MOV CX,TARGET_5_X9 				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,TARGET_5_Y9
			CMP AX,TARGET_SIZE_Y9
			JNG DRAW_TARGET_5_HORIZONTAL9
		
		RET
	DRAW_5_TARGET9 ENDP
	
	MOVE_TARGET_1 PROC NEAR
	                     
			 
			 
		MOV AX,TARGET_1_X
;       Move the ball horizontally
		MOV AX,TARGET_1_VELOCITY    
		SUB TARGET_1_X,AX 
		
		MOV AX,TARGET_1_X                  
		
;       Check if the ball has passed the left boundarie (BALL_X < 0 + WINDOW_BOUNDS)
;       If is colliding, restart its position		
		MOV AX,WINDOW_BOUNDS
		CMP TARGET_1_X,AX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL RESET_TARGET_1_POSITION1
		RET
		
		 RESET_TARGET_1_POSITION1:
		 CALL RESET_TARGET_1_POSITION
	
			RET
	MOVE_TARGET_1 ENDP
	
	MOVE_TARGET_19 PROC NEAR
	                     
			 
			 
		MOV AX,TARGET_1_X9
;       Move the ball horizontally
		MOV AX,TARGET_1_VELOCITY9    
		SUB TARGET_1_X9,AX 
		
		MOV AX,TARGET_1_X9                  
		
;       Check if the ball has passed the left boundarie (BALL_X < 0 + WINDOW_BOUNDS)
;       If is colliding, restart its position		
		MOV AX,WINDOW_BOUNDS
		ADD AX,0A0H
		CMP TARGET_1_X9,AX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL RESET_TARGET_1_POSITION19
		RET
		
		 RESET_TARGET_1_POSITION19:
		 CALL RESET_TARGET_1_POSITION9
	
			RET
	MOVE_TARGET_19 ENDP
	
	RESET_TARGET_1_POSITION PROC NEAR        ;restart ball position to the original position
		
		MOV AX,TARGET_1_ORIGINAL_X
		MOV TARGET_1_X,AX
		
		
		
		MOV AX,TARGET_1_ORIGINAL_Y
		MOV TARGET_1_Y,AX
		
		
		RET
	RESET_TARGET_1_POSITION ENDP
	
	RESET_TARGET_1_POSITION9 PROC NEAR        ;restart ball position to the original position
		
		MOV AX,TARGET_1_ORIGINAL_X9
		MOV TARGET_1_X9,AX
		
		
		
		MOV AX,TARGET_1_ORIGINAL_Y9
		MOV TARGET_1_Y9,AX
		
		
		RET
	RESET_TARGET_1_POSITION9 ENDP
	
	MOVE_TARGET_2 PROC NEAR
	                     
			 
			 
		MOV AX,TARGET_2_X
;       Move the ball horizontally
		MOV AX,TARGET_2_VELOCITY    
		SUB TARGET_2_X,AX 
		
		MOV AX,TARGET_2_X                  
		
;       Check if the ball has passed the left boundarie (BALL_X < 0 + WINDOW_BOUNDS)
;       If is colliding, restart its position		
		MOV AX,WINDOW_BOUNDS
		CMP TARGET_2_X,AX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL RESET_TARGET_2_POSITION1
		RET
		
		 RESET_TARGET_2_POSITION1:
		 CALL RESET_TARGET_2_POSITION
	
			RET
	MOVE_TARGET_2 ENDP
	
	MOVE_TARGET_29 PROC NEAR
	                     
			 
			 
		MOV AX,TARGET_2_X9
;       Move the ball horizontally
		MOV AX,TARGET_2_VELOCITY9    
		SUB TARGET_2_X9,AX 
		
		MOV AX,TARGET_2_X9                  
		
;       Check if the ball has passed the left boundarie (BALL_X < 0 + WINDOW_BOUNDS)
;       If is colliding, restart its position		
		MOV AX,WINDOW_BOUNDS
		ADD AX,0A0H
		CMP TARGET_2_X9,AX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL RESET_TARGET_2_POSITION19
		RET
		
		 RESET_TARGET_2_POSITION19:
		 CALL RESET_TARGET_2_POSITION9
	
			RET
	MOVE_TARGET_29 ENDP
	
	RESET_TARGET_2_POSITION PROC NEAR        ;restart ball position to the original position
		
		MOV AX,TARGET_2_ORIGINAL_X
		MOV TARGET_2_X,AX
		
		
		
		MOV AX,TARGET_2_ORIGINAL_Y
		MOV TARGET_2_Y,AX
		
		
		RET
	RESET_TARGET_2_POSITION ENDP
	
	RESET_TARGET_2_POSITION9 PROC NEAR        ;restart ball position to the original position
		
		MOV AX,TARGET_2_ORIGINAL_X9
		MOV TARGET_2_X9,AX
		
		
		
		MOV AX,TARGET_2_ORIGINAL_Y9
		MOV TARGET_2_Y9,AX
		
		
		RET
	RESET_TARGET_2_POSITION9 ENDP
	
	MOVE_TARGET_3 PROC NEAR
	                     
			 
			 
		MOV AX,TARGET_3_X
;       Move the ball horizontally
		MOV AX,TARGET_3_VELOCITY    
		SUB TARGET_3_X,AX 
		
		MOV AX,TARGET_3_X                  
		
;       Check if the ball has passed the left boundarie (BALL_X < 0 + WINDOW_BOUNDS)
;       If is colliding, restart its position		
		MOV AX,WINDOW_BOUNDS
		CMP TARGET_3_X,AX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL RESET_TARGET_3_POSITION1
		RET
		
		 RESET_TARGET_3_POSITION1:
		 CALL RESET_TARGET_3_POSITION
	
			RET
	MOVE_TARGET_3 ENDP
	
	MOVE_TARGET_39 PROC NEAR
	                     
			 
			 
		MOV AX,TARGET_3_X9
;       Move the ball horizontally
		MOV AX,TARGET_3_VELOCITY9    
		SUB TARGET_3_X9,AX 
		
		MOV AX,TARGET_3_X9                  
		
;       Check if the ball has passed the left boundarie (BALL_X < 0 + WINDOW_BOUNDS)
;       If is colliding, restart its position		
		MOV AX,WINDOW_BOUNDS
		ADD AX,0A0H
		CMP TARGET_3_X9,AX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL RESET_TARGET_3_POSITION19
		RET
		
		 RESET_TARGET_3_POSITION19:
		 CALL RESET_TARGET_3_POSITION9
	
			RET
	MOVE_TARGET_39 ENDP
	
	RESET_TARGET_3_POSITION PROC NEAR        ;restart ball position to the original position
		
		MOV AX,TARGET_3_ORIGINAL_X
		MOV TARGET_3_X,AX
		
		
		
		MOV AX,TARGET_3_ORIGINAL_Y
		MOV TARGET_3_Y,AX
		
		
		RET
	RESET_TARGET_3_POSITION ENDP
	
	RESET_TARGET_3_POSITION9 PROC NEAR        ;restart ball position to the original position
		
		MOV AX,TARGET_3_ORIGINAL_X9
		MOV TARGET_3_X9,AX
		
		
		
		MOV AX,TARGET_3_ORIGINAL_Y9
		MOV TARGET_3_Y9,AX
		
		
		RET
	RESET_TARGET_3_POSITION9 ENDP
	
	MOVE_TARGET_4 PROC NEAR
	                     
			 
			 
		MOV AX,TARGET_4_X
;       Move the ball horizontally
		MOV AX,TARGET_4_VELOCITY    
		SUB TARGET_4_X,AX 
		
		MOV AX,TARGET_4_X                  
		
;       Check if the ball has passed the left boundarie (BALL_X < 0 + WINDOW_BOUNDS)
;       If is colliding, restart its position		
		MOV AX,WINDOW_BOUNDS
		CMP TARGET_4_X,AX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL RESET_TARGET_4_POSITION1
		RET
		
		 RESET_TARGET_4_POSITION1:
		 CALL RESET_TARGET_4_POSITION
	
			RET
	MOVE_TARGET_4 ENDP
	
	MOVE_TARGET_49 PROC NEAR
	                     
			 
			 
		MOV AX,TARGET_4_X9
;       Move the ball horizontally
		MOV AX,TARGET_4_VELOCITY9    
		SUB TARGET_4_X9,AX 
		
		MOV AX,TARGET_4_X9                  
		
;       Check if the ball has passed the left boundarie (BALL_X < 0 + WINDOW_BOUNDS)
;       If is colliding, restart its position		
		MOV AX,WINDOW_BOUNDS
		ADD AX,0A0H
		CMP TARGET_4_X9,AX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL RESET_TARGET_4_POSITION19
		RET
		
		 RESET_TARGET_4_POSITION19:
		 CALL RESET_TARGET_4_POSITION9
	
			RET
	MOVE_TARGET_49 ENDP
	
	RESET_TARGET_4_POSITION PROC NEAR        ;restart ball position to the original position
		
		MOV AX,TARGET_4_ORIGINAL_X
		MOV TARGET_4_X,AX
		
		
		
		MOV AX,TARGET_4_ORIGINAL_Y
		MOV TARGET_4_Y,AX
		
		
		RET
	RESET_TARGET_4_POSITION ENDP
	
	RESET_TARGET_4_POSITION9 PROC NEAR        ;restart ball position to the original position
		
		MOV AX,TARGET_4_ORIGINAL_X9
		MOV TARGET_4_X9,AX
		
		
		
		MOV AX,TARGET_4_ORIGINAL_Y9
		MOV TARGET_4_Y9,AX
		
		
		RET
	RESET_TARGET_4_POSITION9 ENDP
	
	MOVE_TARGET_5 PROC NEAR
	                     
			 
			 
		MOV AX,TARGET_5_X
;       Move the ball horizontally
		MOV AX,TARGET_5_VELOCITY    
		SUB TARGET_5_X,AX 
		
		MOV AX,TARGET_5_X                  
		
;       Check if the ball has passed the left boundarie (BALL_X < 0 + WINDOW_BOUNDS)
;       If is colliding, restart its position		
		MOV AX,WINDOW_BOUNDS
		CMP TARGET_5_X,AX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL RESET_TARGET_5_POSITION1
		RET
		
		 RESET_TARGET_5_POSITION1:
		 CALL RESET_TARGET_5_POSITION
	
			RET
	MOVE_TARGET_5 ENDP
	
	MOVE_TARGET_59 PROC NEAR
	                     
			 
			 
		MOV AX,TARGET_5_X9
;       Move the ball horizontally
		MOV AX,TARGET_5_VELOCITY9    
		SUB TARGET_5_X9,AX 
		
		MOV AX,TARGET_5_X9                  
		
;       Check if the ball has passed the left boundarie (BALL_X < 0 + WINDOW_BOUNDS)
;       If is colliding, restart its position		
		MOV AX,WINDOW_BOUNDS
		ADD AX,0A0H
		CMP TARGET_5_X9,AX                    ;BALL_X is compared with the left boundarie of the screen (0 + WINDOW_BOUNDS)          
		JL RESET_TARGET_5_POSITION19
		RET
		
		 RESET_TARGET_5_POSITION19:
		 CALL RESET_TARGET_5_POSITION9
	
			RET
	MOVE_TARGET_59 ENDP
	
	RESET_TARGET_5_POSITION PROC NEAR        ;restart ball position to the original position
		
		MOV AX,TARGET_5_ORIGINAL_X
		MOV TARGET_5_X,AX
		
		
		
		MOV AX,TARGET_5_ORIGINAL_Y
		MOV TARGET_5_Y,AX
		
		
		RET
	RESET_TARGET_5_POSITION ENDP
	
	RESET_TARGET_5_POSITION9 PROC NEAR        ;restart ball position to the original position
		
		MOV AX,TARGET_5_ORIGINAL_X9
		MOV TARGET_5_X9,AX
		
		
		
		MOV AX,TARGET_5_ORIGINAL_Y9
		MOV TARGET_5_Y9,AX
		
		
		RET
	RESET_TARGET_5_POSITION9 ENDP
	
	DRAW_UI PROC NEAR
		
;       Draw the points of the left player (player one)
		
		
;      
	    MOV AH,02h                       ;set cursor position
		MOV BH,00h                       ;set page number
		MOV DH,02h                       ;set row 
		MOV DL,00h						 ;set column
		INT 10h							 
		
		MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
		LEA DX,TEXT_PLAYER1    ;give DX a pointer to the string TEXT_PLAYER_ONE_POINTS
		INT 21h                        ;print the string 
		MOV AH,02h                       ;set cursor position
		MOV BH,00h                       ;set page number
		MOV DH,02h                       ;set row 
		MOV DL,08h						 ;set column
		INT 10h							 
		
		MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
		LEA DX,TEXT_PLAYER_ONE_POINTS_HD    ;give DX a pointer to the string TEXT_PLAYER_ONE_POINTS
		INT 21h                        ;print the string
		
		MOV AH,02h                       ;set cursor position
		MOV BH,00h                       ;set page number
		MOV DH,02h                       ;set row 
		MOV DL,09h						 ;set column
		INT 10h							 
		
		MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
		LEA DX,TEXT_PLAYER_ONE_POINTS_TENTH    ;give DX a pointer to the string TEXT_PLAYER_ONE_POINTS
		INT 21h                          ;print the string  
		
		MOV AH,02h                       ;set cursor position
		MOV BH,00h                       ;set page number
		MOV DH,02h                       ;set row 
		MOV DL,0Ah						 ;set column
		INT 10h							 
		
		MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
		LEA DX,TEXT_PLAYER_ONE_POINTS_UNIT    ;give DX a pointer to the string TEXT_PLAYER_ONE_POINTS
		INT 21h                          ;print the string 
		 
		
		RET
	DRAW_UI ENDP 
	
	DRAW_UI9 PROC NEAR
		
;       Draw the points of the left player (player one)
		
		
;      
		MOV AH,02h                       ;set cursor position
		MOV BH,00h                       ;set page number
		MOV DH,05h                       ;set row 
		MOV DL,0A0h						 ;set column
		INT 10h							 
		
		MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
		LEA DX,TEXT_PLAYER2    ;give DX a pointer to the string TEXT_PLAYER_ONE_POINTS
		INT 21h                        ;print the string
		
		MOV AH,02h                       ;set cursor position
		MOV BH,00h                       ;set page number
		MOV DH,05h                       ;set row 
		MOV DL,0A8h						 ;set column
		INT 10h							 
		
		MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
		LEA DX,TEXT_PLAYER_ONE_POINTS_HD9    ;give DX a pointer to the string TEXT_PLAYER_ONE_POINTS
		INT 21h                        ;print the string
		
		MOV AH,02h                       ;set cursor position
		MOV BH,00h                       ;set page number
		MOV DH,05h                       ;set row 
		MOV DL,0A9h						 ;set column
		INT 10h							 
		
		MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
		LEA DX,TEXT_PLAYER_ONE_POINTS_TENTH9    ;give DX a pointer to the string TEXT_PLAYER_ONE_POINTS
		INT 21h                          ;print the string  
		
		MOV AH,02h                       ;set cursor position
		MOV BH,00h                       ;set page number
		MOV DH,05h                       ;set row 
		MOV DL,0AAh						 ;set column
		INT 10h							 
		
		MOV AH,09h                       ;WRITE STRING TO STANDARD OUTPUT
		LEA DX,TEXT_PLAYER_ONE_POINTS_UNIT9    ;give DX a pointer to the string TEXT_PLAYER_ONE_POINTS
		INT 21h                          ;print the string 
		 
		
		RET
	DRAW_UI9 ENDP 
	
	UPDATE_TEXT_PLAYER_POINTS PROC NEAR
		
	    XOR AX,AX
		MOV AL,PLAYER_ONE_POINTS
		
		CMP AL,0AH 
		JL UNIT
		JGE TENTH 
		
		UNIT:
		
		ADD AL,30h
		MOV [TEXT_PLAYER_ONE_POINTS_UNIT],AL
		RET
		
		TENTH:
		
		CMP AL,64H
		JL TENTH2
		JGE HUNDERED
		
		TENTH2:
		MOV BH,0AH
		DIV BH  
		
		
		ADD AL,30h
		MOV [TEXT_PLAYER_ONE_POINTS_TENTH],AL
		
		
		
		ADD AH,30h
		MOV [TEXT_PLAYER_ONE_POINTS_UNIT],AH 
		
		RET
		
		HUNDERED: 
		
		MOV BH,0AH
		DIV BH
		
		MOV VAR1,AL
		MOV VAR2,AH 
		
		MOV AL,VAR1
		
		MOV AH,00 
		
		MOV BH,0AH 
		DIV BH
		
		ADD AL,30h
		MOV [TEXT_PLAYER_ONE_POINTS_HD],AL
		
		MOV AL,VAR2
		
		MOV AH,00 
		
		MOV BH,0AH 
		DIV BH
		 
		ADD AL,30h
		
		MOV [TEXT_PLAYER_ONE_POINTS_TENTH],AL
		
		
		
		ADD AH,30h
		MOV [TEXT_PLAYER_ONE_POINTS_UNIT],AH 
		
		RET
	UPDATE_TEXT_PLAYER_POINTS ENDP
	
	UPDATE_TEXT_PLAYER_POINTS9 PROC NEAR
		
	    XOR AX,AX
		MOV AL,PLAYER_ONE_POINTS9
		
		CMP AL,0AH 
		JL UNIT9
		JGE TENTH9 
		
		UNIT9:
		
		ADD AL,30h
		MOV [TEXT_PLAYER_ONE_POINTS_UNIT9],AL
		RET
		
		TENTH9:
		
		CMP AL,64H
		JL TENTH29
		JGE HUNDERED9
		
		TENTH29:
		MOV BH,0AH
		DIV BH  
		
		
		ADD AL,30h
		MOV [TEXT_PLAYER_ONE_POINTS_TENTH9],AL
		
		
		
		ADD AH,30h
		MOV [TEXT_PLAYER_ONE_POINTS_UNIT9],AH 
		
		RET
		
		HUNDERED9: 
		
		MOV BH,0AH
		DIV BH
		
		MOV VAR19,AL
		MOV VAR29,AH 
		
		MOV AL,VAR19
		
		MOV AH,00 
		
		MOV BH,0AH 
		DIV BH
		
		ADD AL,30h
		MOV [TEXT_PLAYER_ONE_POINTS_HD9],AL
		
		MOV AL,VAR29
		
		MOV AH,00 
		
		MOV BH,0AH 
		DIV BH
		 
		ADD AL,30h
		
		MOV [TEXT_PLAYER_ONE_POINTS_TENTH9],AL
		
		
		
		ADD AH,30h
		MOV [TEXT_PLAYER_ONE_POINTS_UNIT9],AH 
		
		RET
	UPDATE_TEXT_PLAYER_POINTS9 ENDP
	
	
	 DRAW_BOUNDARY PROC NEAR 
	
		
		MOV CX,BOUNDARY_X                   ;set the initial column (X)
		MOV DX,BOUNDARY_Y                    ;set the initial line (Y)
		
		
		
		
		DRAW_BOUNDARY_HORIZONTAL7:
			MOV AH,0Ch                   ;set the configuration to writing a pixel
			MOV AL,0Eh 					 ;choose white as color
			MOV BH,00h 					 ;set the page number 
			INT 10h    					 ;execute the configuration
			
			INC CX     					 ;CX = CX + 1
			MOV AX,CX          	  		 ;CX - BALL_X > BALL_SIZE (Y -> We go to the next line,N -> We continue to the next column
			SUB AX,BOUNDARY_X
			CMP AX,BOUNDARY_SIZE_X
			JNG DRAW_BOUNDARY_HORIZONTAL7
			
			MOV CX,BOUNDARY_X				 ;the CX register goes back to the initial column
			INC DX       				 ;we advance one line
			
			MOV AX,DX             		 ;DX - BALL_Y > BALL_SIZE (Y -> we exit this procedure,N -> we continue to the next line
			SUB AX,BOUNDARY_Y
			CMP AX,BOUNDARY_SIZE_Y
			JNG DRAW_BOUNDARY_HORIZONTAL7
		
		RET
	DRAW_BOUNDARY ENDP
	
CLCBUFF  PROC NEAR
    
    PUSH AX
    
CHECKBUFF:  

      MOV AH,1
      INT 16H
      JZ EXIT
       
      MOV AH,0
      INT 16H
      JMP CHECKBUFF
      
  EXIT:
      POP AX
      RET
      
CLCBUFF  ENDP 
	
END MAIN  
						