.model medium
.stack 64
.data 

user1 db 16d
      db ?
      db 16d dup(" ")    
      
user2 db 16d
      db ?
      db 16d dup(" ") 

points_1 dw ?
points_2 dw ? 
points dw ?   

buffer_points_1 db 3,?,2 dup(?)
buffer_points_2 db 3,?,2 dup(?) 

buffer_level db 2d
             db ?
             db 2d dup("$") 
             
buffer_command db 30d
               db ?
               db 30d dup(" ")

buffer_message db 30d
		       db ?
			   db 30d dup(" ")	
               
               
parsed_command db 15d dup(" ")
             
level db ?

turn db 1h

str_ax db "ax","$"
str_bx db "bx","$"
str_cx db "cx","$"
str_dx db "dx","$"

str_si db "si","$"
str_di db "di","$"
str_sp db "sp","$"
str_bp db "bp","$"

str_AXG db "AX","$"
str_BXG db "BX","$"
str_CXG db "CX","$"
str_DXG db "DX","$"

str_SIG db "SI","$"
str_DIG db "DI","$"
str_SPG db "SP","$"
str_BPG db "BP","$"

p1_ax db "0","0","0","0","$"
p1_bx db "0","0","0","0","$" 
p1_cx db "0","0","0","0","$" 
p1_dx db "0","0","0","0","$" 

p1_si db "0","0","0","0","$"
p1_di db "0","0","0","0","$" 
p1_sp db "0","0","0","0","$" 
p1_bp db "0","0","0","0","$"

p2_ax db "0","0","0","0","$" 
p2_bx db "0","0","0","0","$" 
p2_cx db "0","0","0","0","$" 
p2_dx db "0","0","0","0","$"

p2_si db "0","0","0","0","$" 
p2_di db "0","0","0","0","$" 
p2_sp db "0","0","0","0","$" 
p2_bp db "0","0","0","0","$"

mesg_username db " Please enter your name: ","$"
mesg_initial_points db "Initial points: ","$"
mesg_end_username db "Press Enter key to continue","$"  
mesg_level db "Please enter level either 1 or 2 : ","$"
mesg_Error db "Error your turn ends","$"

startChat  db      "To start chatting press F1" , '$' 
startGame  db      "To start the game press F2" , '$' 
endProgram  db      "To end the program press ESC" , '$' 
msg_ingame_chat db "To intiate in game chat press f5","$"

inc_c db "inc","$" ; 
dec_c db "dec","$" ;
clc_c db "clc","$" ; 
mov_c db "mov","$" ;  
add_c db "add","$" ;   
sub_c db "sub","$" ;    
adc_c db "adc","$" ;     
sbb_c db "sbb","$" ;
xor_c db "xor","$" ;
and_c db "and","$" ;

push_c db "push","$"
pop_c db "pop","$"
mul_c db "mul","$"
div_c db "div","$"
imul_c db "imul","$" 

stack_p1 db 50d dup(" ")
stack_p2 db 50d dup(" ")
sp_p1 dw 0h
sp_p2 dw 0h  

forbidden_p1 db ?
forbidden_p2 db ?
mesg_forbidden_1 db "Player 1, please enter forbidden character for player 2 ","$"
mesg_forbidden_2 db "Player 2, please enter forbidden character for player 1 ","$" 
mesg_ask_which_processer db " Enter 1 to execute on your own process otherwise commadn executes on opponents","$" 
power_up_msg db "Enter 1 , 2 , 3 or 4 to use power up","$"
answer_level2 db 0h
buffer_initial_Reg db 5d
                   db ?
                   db 5d dup(" ") 

target db "1","0","5","e","$" 
Winner_1 db "Player 1 is the winner ","$"
Winner_2 db "Player 2 is the winner ","$"


regnames db "axalahbxbhblcxchcldxdhdlsibpspdi","$" ;we save the names of the registers to compare with them later 
InValidRegNameMsg db "InValid register name, you lose your turn ","$"  
SizeMismatchMsg db "Size Mismatch error, you lose your turn ","$"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;chatting module variables;;;;;;;;;;;;;;;;;;;;;;;;;;;

	Cursor_SendingX   db 4
	Cursor_SendingY   db 1
	Cursor_RecievingX db 4
	Cursor_RecievingY db 15
	StringSent        db 82 dup('$')
	Endchatmsg1       db '-To End Chatting with ','$'
	Endchatmsg2       db 'Press F3','$'
    StringRecieved db 82 dup('$')
	user1_name db "user1: "
	user2_name db "user2: "
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


.code
get_reg macro reg 

local ax_reg,bx_reg,cx_reg,dx_reg,p2_reg_ax,p2_reg_bx,p2_reg_cx,p2_reg_dx,p1_reg_ax,p1_reg_bx,p1_reg_cx,p1_reg_dx,default,fini     ; di will be set with offset correct register , takes al as "a","b", .. etc to get correct register
 
cmp reg,61h
jz ax_reg

cmp reg,62h
jz bx_reg

cmp reg,63h
jz cx_reg   

cmp reg,64h
jz dx_reg

jmp default

ax_reg: 
cmp turn,01h
jz p2_reg_ax
jnz p1_reg_ax

p2_reg_ax:
mov di,offset p2_ax
jmp fini
 
p1_reg_ax:
mov di,offset p1_ax
jmp fini

bx_reg:

cmp turn,01h
jz p2_reg_bx
jnz p1_reg_bx

p2_reg_bx:
mov di,offset p2_bx
jmp fini
 
p1_reg_bx:
mov di,offset p1_bx
jmp fini

cx_reg:

cmp turn,01h
jz p2_reg_cx
jnz p1_reg_cx

p2_reg_cx:
mov di,offset p2_cx
jmp fini
 
p1_reg_cx:
mov di,offset p1_cx
jmp fini

dx_reg:

cmp turn,01h
jz p2_reg_dx
jnz p1_reg_dx

p2_reg_dx:
mov di,offset p2_dx
jmp fini
 
p1_reg_dx:
mov di,offset p1_dx
jmp fini

default: mov di,0000h

fini:
     
endm get_reg

print macro msg1
    mov ah,09h
    lea dx, msg1
    int 21h
endm 

CursorPostion macro num
mov ah,2 
mov bh,00
mov dx,num
int 10h
endm

draw_square macro col,row,color,length,width

LOCAL l1 ,l2
mov cx,col     ;;col  
mov dx,row     ;;row
mov al,color   ;;colour
mov ah,0ch     ;;draw pixel
l1:
int 10h    ;;draw the first pixel in the line
mov bx,cx  ;;save the value of cx in bx
l2:        ;;the second loop in to draw the extension of the line   
inc cx     ;;Increase the value of cx till you reach the required length
int 10h
cmp cx,length  ;;the column where the last pixel in the line is drawn
jne l2     
mov cx,bx      ;;get the original value of cx (column) back
inc dx         ;;To draw the next horizontal line
cmp dx,width   ;;the height
jle l1
endm


draw_vertical_line macro col,row,color,length,width

LOCAL l1 ,l2
mov cx,col     ;;col  
mov dx,row     ;;row
mov al,color   ;;colour
mov ah,0ch     ;;draw pixel
l1:
int 10h    ;;draw the first pixel in the line
mov bx,dx  ;;save the value of cx in bx
l2:        ;;the second loop in to draw the extension of the line   
inc dx     ;;Increase the value of cx till you reach the required length
int 10h
cmp dx,length  ;;the column where the last pixel in the line is drawn
jne l2     
mov dx,bx      ;;get the original value of cx (column) back
inc cx         ;;To draw the next horizontal line
cmp cx,width   ;;the height
jle l1
endm

display_char macro col,row,char,color
mov  dl, col    ;Column
mov  dh, row   ;Row
mov  bh, 0    ;Display page
mov  ah, 02h  ;SetCursorPosition
int  10h

mov  al, char
mov  bl, color  ;Color is red
mov  bh, 0    ;Display page
mov  ah, 0Eh  ;Teletype
int  10h
endm

display macro x,y,color,msg,length
mov si,@data;moves to si the location in memory of the data segment

mov ah,13h;service to print string in graphic mode
mov al,0;sub-service 0 all the characters will be in the same color(bl) and cursor position is not updated after the string is written
mov bh,0;page number=always zero
mov bl,color;color of the text 
;     0000             1111
;|_ Background _| |_ Foreground _|
;

mov cx,length;length of string

mov dh,y;y coordinate
mov dl,x;x coordinate
mov es,si;moves to es the location in memory of the data segment
mov bp,offset msg;mov bp the offset of the string
int 10h

endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MAIN;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

main proc far
mov ax,@data
mov ds,ax
mov es,ax 
 
;jmp level_1   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; jump el debug

call main_menu

hlt ; change with return to os code

main endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END MAIN;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


graphics_clear_screen PROC NEAR 				;procedure to clear the screen by restarting the video mode

MOV AH,00h 						;set the configuration to video mode
MOV AL,13h 						;choose the video mode
INT 10h							;execute the configuration

MOV AH,0Bh						;set the configuration
MOV BH,00h						;to the background color
MOV BL,00h 						;choose black as background
INT 10h 						;execute the configuration

RET
graphics_clear_screen ENDP
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;MAIN MENU;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
main_menu proc near

mov ax,0600h 
mov bh,1100b ;Text color in the main menu
mov cx,00h
mov dx,184fh
int 10h
;Move the cursor to the middle of the scrren
CursorPostion 081Bh
;Print start chat msg in the main menu
print startChat
;Move the cursor to the middle of the scrren
CursorPostion 0A1Bh
;Print start chat msg in the main menu
print startGame
;Move the cursor to the middle of the scrren
CursorPostion 0C1Bh
;Print start chat msg in the main menu
print endProgram
;Check if the pressed key is f1, f2 or esc else keep waiting
getKeyPressed:
mov ah,0
int 16h
cmp ah,3Bh ;when the user press F1 move to the chatting mode
je chatmode ;TO DO
cmp ah,3Ch ;when the user press F2 start the game
je user_data ;TO DO
cmp ah,01h ;when the user press Esc end the program
je clear_screen ;TO DO
jmp getKeyPressed
clear_screen:
call clearscreen
mov ax, 4C00h ;Terminate
int 21h

chatmode:
call chat_mode


user_data:
mov cx,1h ; 1 -> player one turn to enter username
call clearscreen
call Userdata  
call clearscreen
mov cx,2h  ; 2-> player 2 turn to enter his data
call Userdata
call clearscreen 
call getgamepoints   ; get miminum # of points entered as it will be points for both users during game
call clearscreen

mov cx,points
mov points_1,cx
mov points_2,cx

call clearscreen 

mov ah,2h  ;setting cursor
mov bh,00h
mov dx,0000h
int 10h  

mov ah,9  ; displaying enter level msg
mov dx,offset mesg_forbidden_1
int 21h  

mov ah,00h
int 16h
mov forbidden_p2,al   

call clearscreen 

mov ah,2h  ;setting cursor
mov bh,00h
mov dx,0000h
int 10h  

mov ah,9  ; displaying enter level msg
mov dx,offset mesg_forbidden_2
int 21h  

mov ah,00h
int 16h
mov forbidden_p1,al

level_Selection: call clearscreen 
call getlevel
mov cl,level
cmp cl,1
jz level_1
cmp cl,2
jnz level_Selection
jz level_2_initial_regs

level_1:   ; checking entered level is 1,2 is over

call graphics_clear_screen
call graphicsmode
;call clearscreen 

display 24,200,0Ah,msg_ingame_chat,32


mov ah,0
int 16h 
cmp	ah,3fh	; comparing with f5
jz in_gamechat
jnz nochat




in_gamechat:


call graphics_clear_screen
call graphicsmode

display 24,199,0fh,[user1]+2,7
CursorPostion 5328
call get_message
display 24,201,0fh,[user2]+2,7
CursorPostion 5628
call get_message

call graphics_clear_screen
call graphicsmode


nochat:

;mov ah,0
;int 16h 
;cmp	ah,3eh	; comparing with f4
;jz use_power_up
;jnz no_power_up

;use_power_up:
;call graphics_clear_screen
;display 24,199,0fh,[power_up_msg]+2,64
;call graphicsmode
;mov ah,0
;int 16h 
;cmp ah,2d
;jz power_up_one 
;cmp ah,3d
;jz power_up_two 
;cmp ah,4d
;jz power_up_three 
;cmp ah,5d
;jz power_up_four
;jnz use_power_up

;power_up_one:
;call execute_on_own
;jmp no_power_up

;power_up_two:
;call execute_on_both
;jmp no_power_up

;power_up_three:
;call chng_forbidden
;jmp no_power_up

;power_up_four:
;call clear_regs
;jmp no_power_up


;no_power_up:
cmp turn , 1h
jz player1_command_turn
jnz player2_command_turn

player1_command_turn:
CursorPostion 1101h
jmp game

player2_command_turn:
CursorPostion 1115h
jmp game


game:          
call get_command
call parse_command
; proc check i=en parsed command mfihash el character
; check en el command al,1234 
call execute_pop
call execute_push
call execute_mul 
call execute_add
call execute_mov 
call execute_clc
call execute_inc
call execute_dec
call execute_sub
call execute_adc
call execute_sbb
call execute_xor
call execute_div      
call execute_imul   
; nop implemented implicitly


call next_turn  

mov cx,15d
mov di,offset parsed_command
clear_parsed: mov [di],20h
inc di
dec cx
jnz clear_parsed 


mov cx,30d
mov di,offset buffer_command
clear_buffer: mov [di],20h
inc di
dec cx
jnz clear_buffer

jmp level_1



level_2_initial_regs: ;display messages prompting to enter initaial values for ax,bx,.. p1 then ax,bx,... p2
call clearscreen
call reg_level2_initial

level_2:
call graphics_clear_screen
call graphicsmode
call check_Answer_level_2           
call get_command
call parse_command 
call check_forbidden
cmp si,0001h
jz inc_turn_2
call execute_pop
call execute_push
call execute_mul 
call execute_add
call execute_mov 
call execute_clc
call execute_inc
call execute_dec
call execute_sub
call execute_adc
call execute_sbb
call execute_xor
call execute_div      
call execute_imul   
; nop implemented implicitly

inc_turn_2: 
cmp answer_level2,1h
jnz turn_2222
call next_turn

turn_2222: 
call next_turn  

mov cx,15d
mov di,offset parsed_command
clear_parsed_2: mov [di],20h
inc di
dec cx
jnz clear_parsed_2

mov answer_level2,0h

mov cx,30d
mov di,offset buffer_command
clear_buffer_2: mov [di],20h
inc di
dec cx
jnz clear_buffer_2

mov cx,4
mov si,offset target
mov di,offset p1_ax
repe cmpsb 
jz game_finished_11

mov cx,4
mov si,offset target
mov di,offset p1_bx
repe cmpsb 
jz game_finished_11

mov cx,4
mov si,offset target
mov di,offset p1_cx
repe cmpsb 
jz game_finished_11

mov cx,4
mov si,offset target
mov di,offset p1_dx
repe cmpsb 
jz game_finished_11

mov cx,4
mov si,offset target
mov di,offset p2_ax
repe cmpsb 
jz game_finished_22

mov cx,4
mov si,offset target
mov di,offset p2_bx
repe cmpsb 
jz game_finished_22

mov cx,4
mov si,offset target
mov di,offset p2_cx
repe cmpsb 
jz game_finished_22

mov cx,4
mov si,offset target
mov di,offset p2_dx
repe cmpsb 
jz game_finished_22

jmp level_2

;;;;;;;;;;;;;;;;;;;;;;;;;;TO DO;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
game_finished_11:
call graphics_clear_screen
display 20,15, 0fh , Winner_2 , 32

call main_menu
game_finished_22:
call graphics_clear_screen
display 20,15, 0fh , Winner_1 , 32
call main_menu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


main_menu endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END MAIN MENU;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;GEAPHICS MODE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
graphicsmode proc near

;mov ah,0
;mov al,13h
;int 10h


;Player 1 Registers
display 0,3,0fh,str_AXG,2
display 0,5,0fh,str_BXG,2
display 0,7,0fh,str_CXG,2
display 0,9,0fh,str_DXG,2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_square 20,20,3h,60,30
draw_square 20,37,3h,60,47
draw_square 20,54,3h,60,64
draw_square 20,71,3h,60,81
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_square 65,20,3h,105,30
draw_square 65,37,3h,105,47
draw_square 65,54,3h,105,64
draw_square 65,71,3h,105,81
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Player 2 Registers
display 14,3,0fh,str_SIG,2
display 14,5,0fh,str_DIG,2
display 14,7,0fh,str_SPG,2
display 14,9,0fh,str_BPG,2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
display_char 19,0,'0',0fh
display_char 19,1,'1',0fh
display_char 19,2,'2',0fh
display_char 19,3,'3',0fh
display_char 19,4,'4',0fh
display_char 19,5,'5',0fh
display_char 19,6,'6',0fh
display_char 19,7,'7',0fh
display_char 19,8,'8',0fh
display_char 19,9,'9',0fh
display_char 19,10,'A',0fh
display_char 19,11,'B',0fh
display_char 19,12,'C',0fh
display_char 19,13,'D',0fh
display_char 19,14,'E',0fh
display_char 19,15,'F',0fh

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
display_char 18,0,'0',0fh
display_char 18,1,'0',0fh
display_char 18,2,'0',0fh
display_char 18,3,'0',0fh
display_char 18,4,'0',0fh
display_char 18,5,'0',0fh
display_char 18,6,'0',0fh
display_char 18,7,'0',0fh
display_char 18,8,'0',0fh
display_char 18,9,'0',0fh
display_char 18,10,'0',0fh
display_char 18,11,'0',0fh
display_char 18,12,'0',0fh
display_char 18,13,'0',0fh
display_char 18,14,'0',0fh
display_char 18,15,'0',0fh
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
display_char 17,0,'0',0fh
display_char 17,1,'0',0fh
display_char 17,2,'0',0fh
display_char 17,3,'0',0fh
display_char 17,4,'0',0fh
display_char 17,5,'0',0fh
display_char 17,6,'0',0fh
display_char 17,7,'0',0fh
display_char 17,8,'0',0fh
display_char 17,9,'0',0fh
display_char 17,10,'0',0fh
display_char 17,11,'0',0fh
display_char 17,12,'0',0fh
display_char 17,13,'0',0fh
display_char 17,14,'0',0fh
display_char 17,15,'0',0fh


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Player 2 Registers
display 21,3,0fh,str_AXG,2
display 21,5,0fh,str_BXG,2
display 21,7,0fh,str_CXG,2
display 21,9,0fh,str_DXG,2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
draw_square 185,20,5h,225,30
draw_square 185,37,5h,225,47
draw_square 185,54,5h,225,64
draw_square 185,71,5h,225,81

draw_square 230,20,5h,270,30
draw_square 230,37,5h,270,47
draw_square 230,54,5h,270,64
draw_square 230,71,5h,270,81

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
display 34,3,0fh,str_SIG,2
display 34,5,0fh,str_DIG,2
display 34,7,0fh,str_SPG,2
display 34,9,0fh,str_BPG,2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
display_char 39,0,'0',0fh
display_char 39,1,'1',0fh
display_char 39,2,'2',0fh
display_char 39,3,'3',0fh
display_char 39,4,'4',0fh
display_char 39,5,'5',0fh
display_char 39,6,'6',0fh
display_char 39,7,'7',0fh
display_char 39,8,'8',0fh
display_char 39,9,'9',0fh
display_char 39,10,'A',0fh
display_char 39,11,'B',0fh
display_char 39,12,'C',0fh
display_char 39,13,'D',0fh
display_char 39,14,'E',0fh
display_char 39,15,'F',0fh
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

display_char 38,0,'0',0fh
display_char 38,1,'0',0fh
display_char 38,2,'0',0fh
display_char 38,3,'0',0fh
display_char 38,4,'0',0fh
display_char 38,5,'0',0fh
display_char 38,6,'0',0fh
display_char 38,7,'0',0fh
display_char 38,8,'0',0fh
display_char 38,9,'0',0fh
display_char 38,10,'0',0fh
display_char 38,11,'0',0fh
display_char 38,12,'0',0fh
display_char 38,13,'0',0fh
display_char 38,14,'0',0fh
display_char 38,15,'0',0fh

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

display_char 37,0,'0',0fh
display_char 37,1,'0',0fh
display_char 37,2,'0',0fh
display_char 37,3,'0',0fh
display_char 37,4,'0',0fh
display_char 37,5,'0',0fh
display_char 37,6,'0',0fh
display_char 37,7,'0',0fh
display_char 37,8,'0',0fh
display_char 37,9,'0',0fh
display_char 37,10,'0',0fh
display_char 37,11,'0',0fh
display_char 37,12,'0',0fh
display_char 37,13,'0',0fh
display_char 37,14,'0',0fh
display_char 37,15,'0',0fh

;draw horizontal lines
draw_square  0,160,0fh,319,1
draw_square  0,130,0fh,319,1
draw_square  0,145,0fh,130,1
draw_square  160,145,0fh,290,1
;draw vertical lines
draw_vertical_line  130,0,0fh,145,50
draw_vertical_line  160,0,0fh,160,50
draw_vertical_line  290,0,0fh,145,50
draw_vertical_line  150,0,8h,130,50
draw_vertical_line  310,0,8h,130,50
;display the command entered by the first player
display 1,17,0fh,parsed_Command,15 

display 1,19,0fh,[user1]+2,16 ;display the name of the first player
display 17,18,0fh,[points_1],3 ;display the points of the first player

;display the command entered by the second player
display 21,17,0fh,parsed_Command,15

display 21,19,0fh,[user2]+2,16 ;display the name of the second player

display 37,18,0fh,[points_2],3 ;display the points of the second player


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;displaying the numbers in the registers where the parameters are the x , y coordinates , color of the text , the msg and the length of the msg
display  3,3,00111111b,p1_ax,4
display  3,5,00111111b,p1_bx,4
display  3,7,00111111b,p1_cx,4
display  3,9,00111111b,p1_dx,4

display  9,3,00111111b,p1_si,4
display  9,5,00111111b,p1_di,4
display  9,7,00111111b,p1_sp,4
display  9,9,00111111b,p1_bp,4

display  24,3,0Eh,p2_ax,4
display  24,5,0Eh,p2_bx,4
display  24,7,0Eh,p2_cx,4
display  24,9,0Eh,p2_dx,4

display  29,3,0Eh,p2_si,4
display  29,5,0Eh,p2_di,4
display  29,7,0Eh,p2_sp,4
display  29,9,0Eh,p2_bp,4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ret
graphicsmode endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;END GEAPHICS MODE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Userdata proc near
cmp cx,1h
jz one
jnz two

one:
mov ah,9  ; displaying enter user name msg
mov dx,offset mesg_username
int 21h

mov ah,0ah ; reading player username
mov dx,offset user1
int 21h

mov ah,3h ; getting cursor position
mov bh,0h
int 10h

mov dl,00h ; setting cursor
add dh,5h
mov bh,0h
mov ah,2h
int 10h

mov ah,9  ; displaying intial points msg
mov dx,offset mesg_initial_points
int 21h

mov ah,0ah ; reading player points
mov dx,offset buffer_points_1                       
int 21h

mov cl, buffer_points_1+1
cmp cl,1h
jz one_digit
jnz two_digits

one_digit: ; processing if 1 digit entered
mov cl,buffer_points_1+2
sub cl,30h
mov al,cl
cbw
mov points_1,ax
jmp cmp1

two_digits: ;processing if 2 digits entered
mov cl,buffer_points_1+2
sub cl,30h
mov al,10d
mul cl
mov cl,buffer_points_1+3
sub cl,30h
mov ch,00h
add ax,cx
mov points_1,ax  

cmp1:

mov ah,3h ; getting cursor position
mov bh,0h
int 10h

mov dl,00h ; setting cursor
add dh,5h
mov bh,0h
mov ah,2h
int 10h

mov ah,9h  ; displaying press enter msg
mov dx,offset mesg_end_username
int 21h 

jmp finished  

two:   

mov ah,9  ; displaying enter user name msg
mov dx,offset mesg_username
int 21h

mov ah,0ah ; reading player username
mov dx,offset user2
int 21h

mov ah,3h ; getting cursor position
mov bh,0h
int 10h

mov dl,00h ; setting cursor
add dh,5h
mov bh,0h
mov ah,2h
int 10h

mov ah,9  ; displaying intial points msg
mov dx,offset mesg_initial_points
int 21h

mov ah,0ah ; reading player points
mov dx,offset buffer_points_2
int 21h

mov cl, buffer_points_2+1
cmp cl,1h
jz digit
jnz two_digit

digit: ; processing if 1 digit entered
mov cl,buffer_points_2+2
sub cl,30h
mov al,cl
cbw
mov points_2,ax
jmp cmp2

two_digit: ;processing if 2 digits entered
mov cl,buffer_points_2+2
sub cl,30h
mov al,10d
mul cl
mov cl,buffer_points_2+3
sub cl,30h
mov ch,00h
add ax,cx
mov points_2,ax  

cmp2:

mov ah,3h ; getting cursor position
mov bh,0h
int 10h

mov dl,00h ; setting cursor
add dh,5h
mov bh,0h
mov ah,2h
int 10h

mov ah,9h  ; displaying press enter msg
mov dx,offset mesg_end_username
int 21h 


finished:   ; exiting when only enter is entered 
mov ah,0h
int 16h
cmp ah,1ch
jnz finished

ret

Userdata endp   

clearScreen proc near 
    
mov ah,6h   ;clearing screen
mov al,0h  
mov bh,7h
mov cx,0h
mov dx,184fh
int 10h   
    
mov dl,00h ; setting cursor
mov dh,00h
mov bh,0h
mov ah,2h
int 10h
    
ret
clearscreen endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

GetGamePoints proc near 
mov ax,points_1
mov bx,points_2

cmp ax,bx
jnc bigger 
jc smaller

bigger:
mov points,bx
jmp f

smaller:
mov points,ax

f:
    ret
getgamepoints endp   

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    

getlevel proc near 
    
mov ah,9  ; displaying enter level msg
mov dx,offset mesg_level
int 21h  

mov ah,0ah ; reading level
mov dx,offset level
int 21h   

mov cl,level+2
sub cl,30h
mov al,cl
mov level,al

ret
getlevel endp   

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

pass_space proc near  ; assumes command offset is in di  ; increments di till first non space character in command
begin: 
cmp byte ptr [di],20h
jnz done    
jz lesa

lesa:
inc di
jmp begin

done:    
ret
pass_space endp 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

get_Command proc near  ; gets input command and sets di to point to its begining
mov ah,0ah ; reading command
mov dx,offset buffer_command
int 21h
mov di,offset buffer_command+2     
ret 
get_command endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

get_message proc near
mov ah,0Ah
mov dx,offset buffer_message
int 21h
mov di,offset buffer_message+2
ret
get_message endp


parse_command proc near    
    
mov di,offset buffer_command+2
call pass_space

mov al,[di]+3
cmp al,20h

jz threelettercommand
jnz fourlettercommand

threelettercommand:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;EZZ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;cmp [di]+8,78h
;jz reg_mismatch
;jnz num_mismatch

;reg_mismatch:
;cmp [di]+5,78h
;jz cont
;jnz finish_parsing

;num_mismatch:
;cmp [di]+5,78h
;jz cont
;jnz two_nums

;two_nums:
;cmp [di]+9,20h
;jz cont
;jnz finish_parsing

;cont:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;EZZ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov cx,3
mov si,di
mov di,offset parsed_command
rep movsb   




mov [di],20h
 
push di

mov di,si

call pass_space 

mov si,di

pop di

inc di

mov cx,2
rep movsb

push di
mov di,si

call pass_space
inc di

call pass_space
mov si,di
pop di
inc di

mov cx,4
rep movsb

push di
push ax
mov al,parsed_command+9
cmp al,30h
jc space_req
jnc midfinish

space_req:
mov parsed_command+9,20h 
mov parsed_command+10,20h
jmp midfinish

midfinish:

mov al,parsed_command+10
cmp al,30h

jc space_req2
jnc finalfinish

space_req2:
mov parsed_command+10,20h

finalfinish:
pop ax
pop di
jmp finish_parsing

fourlettercommand: 

mov cx,4
mov si,di
mov di,offset parsed_command
rep movsb

mov [di],20h
 
push di

mov di,si

call pass_space 

mov si,di

pop di

inc di

mov cx,2
rep movsb 

push di
mov di,si

call pass_space
inc di

call pass_space
mov si,di
pop di
inc di

mov cx,4
rep movsb

push di
push ax
mov al,parsed_command+10
cmp al,30h
jc space_req3
jnc midfinish3

space_req3:
mov parsed_command+10,20h 
mov parsed_command+11,20h
jmp midfinish

midfinish3:

mov al,parsed_command+11
cmp al,30h

jc space_req4
jnc finalfinish2

space_req4:
mov parsed_command+11,20h

finalfinish2:
pop ax
pop di
jmp finish_parsing
 

finish_parsing:

 lea si,parsed_command
       lea di,regnames   
       mov cx,15
       Loop1:  
       mov bx,[si]  
       mov dx,[di]  
       cmp bx,dx
       JZ found  
         
       cmp bx,[si+16]
       jz next
       inc si
       loop loop1  

        next:
       inc di
       mov cx,16
       lea si,parsed_command
       loop loop1  

       ;inc turn
       jmp  level_1 
         
         
       found:
       
        lea si,parsed_command
       ;mov al,ax is the only one working?
         
       cmp parsed_command+5,78h ;make sure we have ax , bx, cx or dx
        jz norm1 
        ;if no jump occured then it must be al,ah,bl,bh,cl,ch,dl or dh

        cmp [si+8],78h ;if x is found means we have illegal command
      
        jz notnorm
     

   norm:
     
    cmp [si+5],48h ;h
      Jnz adjustH



    cmp [si+5],6ch ; l
    jz adjustL  
       ret


        norm1:
        ret
         
         
       
     
 
       notnorm:   
        
       jmp  level_1
      
      adjustH:
    
  
   lea si,parsed_command
mov ax,[si+7]
mov [si+9],AL
mov [si+10],ah
ret
;jmp theend
 





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

adjustL:
 ; lea si,parsed_command
;mov ax,[si+7]
;mov [si+9],al
;mov [si+10],ah

ret
parse_command endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

convert_lower_Case_3 proc near ; converting a 4 letter command to all lower case

push di
push cx
mov cx,3h

myloop:
mov ah,[di]
or ah,20h
mov [di],ah
inc di
dec cx
jnz myloop

pop cx
pop di
 
ret
convert_lower_Case_3 endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;     

transfer_reg_to_memory proc near  ; put offset string in di and register in ax
mov bx,100h
div bx
mov bh,10h 
mov ah,00h
div bh

call convert_hex_to_ascii

mov [di],al

mov al,ah

call convert_hex_to_ascii
mov [di+1],al

mov al,dl
mov ah,00h 

mov bh,10h
div bh

call convert_hex_to_Ascii 
mov [di+2],al

mov al,ah  

call convert_hex_to_ascii
mov [di+3],al
 
ret   
transfer_reg_to_memory endp 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

convert_hex_to_ascii proc near  ;hex value in al->ascii in al
cmp al,10d
jc small

add al,57h
jmp finish_convert

small:
add al,30h

finish_convert:
ret
convert_hex_to_ascii endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

transfer_meomry_to_reg proc near  ; put offset string in di and register to be updated is ax 
    
mov al,byte ptr [di]
call convert_ascii_to_hex
mov ah,00h
mov bx,1000h
mul bx
mov cx,ax

mov al,byte ptr [di]+1
call convert_ascii_to_hex
mov ah,00h
mov bx,100h
mul bx
add cx,ax

mov al,byte ptr [di]+2   
call convert_ascii_to_hex
mov ah,00h
mov bh,10h
mul bh
add cx,ax

mov al,byte ptr [di]+3     
call convert_ascii_to_hex
mov ah,00h
add cx,ax

mov ax,cx

ret   
transfer_meomry_to_reg endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

convert_ascii_to_hex proc near
cmp al,40h
jc num

sub al,57h
jmp finish_convert2 

num:
sub al,30h
jmp finish_convert2

finish_convert2:    
ret
convert_ascii_to_hex endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

clear_regs proc near ;power up :  clear all registers
push ax
push di
    
mov ax,0000h
mov di,offset p1_ax
call transfer_reg_to_memory

mov ax,0000h
mov di,offset p1_bx
call transfer_reg_to_memory

mov ax,0000h
mov di,offset p1_cx
call transfer_reg_to_memory

mov ax,0000h
mov di,offset p1_dx
call transfer_reg_to_memory

mov ax,0000h
mov di,offset p2_ax
call transfer_reg_to_memory

mov ax,0000h
mov di,offset p2_bx
call transfer_reg_to_memory

mov ax,0000h
mov di,offset p2_cx
call transfer_reg_to_memory

mov ax,0000h
mov di,offset p2_dx
call transfer_reg_to_memory

pop di
pop ax
      
ret
clear_regs endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

next_turn proc near
    
mov al,turn
inc al
mov ah,00h

mov cl,2h
div cl

cmp ah,00h
jz playerturn2
jnz playerturn1

playerturn1:
mov al,01h
jmp finish_turn

playerturn2:
mov al,02h
jmp finish_turn

finish_turn:
mov turn,al
ret
next_turn endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

execute_inc proc near

mov si,offset parsed_command
mov di,offset inc_c
mov cx,3

repe cmpsb 

jnz finished_executing

inc si 

mov al,[si]  

get_reg al

push di
call transfer_meomry_to_reg
pop di

cmp parsed_command+5,68h
jz h_reg 
inc ax
jmp not_h

h_reg:
inc ah

not_h:

call transfer_reg_to_memory

finished_executing:  

ret
    
execute_inc endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  

execute_dec proc near

mov si,offset parsed_command
mov di,offset dec_c
mov cx,3

repe cmpsb 

jnz finished_executing_dec

inc si 

mov al,[si]  

get_reg al

push di
call transfer_meomry_to_reg
pop di

cmp parsed_command+5,68h
jz ha_reg 
dec ax
jmp nota_h

ha_reg:
dec ah

nota_h:

call transfer_reg_to_memory

finished_executing_dec:  

ret
    
execute_dec endp


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   

execute_clc proc near

mov si,offset parsed_command
mov di,offset clc_c
mov cx,3

repe cmpsb 

jnz finished_executing_clc

clc

finished_executing_clc:

ret
    
execute_clc endp                                                         

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  

execute_mov proc near

mov si,offset parsed_command
mov di,offset mov_c
mov cx,3

repe cmpsb 

jnz finished_executing_mov

inc si 

mov al,[si]  

get_reg al       

mov si, offset parsed_command + 7  ;awl el value

push di ; di shila awl string bta3 el regisetr el mfrood nsht8l 3lih
call transfer_meomry_to_reg
pop di     

mov bx,ax ; hna el register 7tana fi el bx 3sahn get value bt8ir ax 


cmp parsed_command + 8,67h
jnc register_input
jc value_input

register_input:

push bx
push di
mov al, parsed_command + 7   
get_reg al
push di
call transfer_meomry_to_reg
pop di
pop di 
pop bx


cmp parsed_command + 8,68h
jz hia_h__
jnz msh_h__

hia_h__:
cmp parsed_command + 5,68h
jnz first_op_l

mov bh,ah
mov ax,bx
jmp call_reg

first_op_l:
mov bl,ah
mov ax,bx

jmp call_reg

msh_h__:
cmp parsed_command + 8,6ch
jz hia_l__
jnz hia_x__

hia_l__: 
cmp parsed_command + 5,6ch
jnz first_op_h
mov bl,al
mov ax,bx
jmp call_reg

first_op_h: 
mov bh,al
mov ax,bx

jmp call_reg

hia_x__:
jmp call_reg

value_input:

push di
mov di,si 
push bx
call getvalue
pop bx
pop di

cmp parsed_Command+5,68h
jnz msh_h_
jz hia_h_

msh_h_:
cmp parsed_Command+5,6Ch
jnz hia_x
jz hia_l 

hia_x:
jmp call_reg   

hia_l:  
mov bl,al
mov ax,bx
jmp call_reg

hia_h_:
mov bh,al
mov ax,bx
jmp call_reg

call_reg:
call transfer_reg_to_memory

finished_executing_mov:
ret
execute_mov endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

execute_add proc near

mov si,offset parsed_command
mov di,offset add_c
mov cx,3

repe cmpsb 

jnz finished_executing_add

inc si 

mov al,[si]  

get_reg al       

mov si, offset parsed_command + 7  ;awl el value

push di ; di shila awl string bta3 el regisetr el mfrood nsht8l 3lih
call transfer_meomry_to_reg
pop di     

mov bx,ax ; hna el register 7tana fi el bx 3sahn get value bt8ir ax 


cmp parsed_command + 8,67h
jnc register_input_1
jc value_input_1

register_input_1:

push bx
push di
mov al, parsed_command + 7   
get_reg al
push di
call transfer_meomry_to_reg
pop di
pop di 
pop bx


cmp parsed_command + 8,68h
jz hia_h__1
jnz msh_h__1

hia_h__1:
cmp parsed_command + 5,68h
jnz first_op_l1

add bh,ah
mov ax,bx
jmp call_reg1

first_op_l1:
add bl,ah
mov ax,bx

jmp call_reg1
            
msh_h__1:
cmp parsed_command + 8,6ch
jz hia_l__1
jnz hia_x__1

hia_l__1: 
cmp parsed_command + 5,6ch
jnz first_op_h1
add bl,al
mov ax,bx
jmp call_reg1

first_op_h1: 
add bh,al
mov ax,bx

jmp call_reg1

hia_x__1:
add bx,ax
mov ax,bx
jmp call_reg1

value_input_1:

push di
mov di,si 
push bx
call getvalue
pop bx
pop di

cmp parsed_Command+5,68h
jnz msh_h_1
jz hia_h_1

msh_h_1:
cmp parsed_Command+5,6Ch
jnz hia_x1
jz hia_l1 

hia_x1:
add bx,ax
mov ax,bx
jmp call_reg1   

hia_l1:  
add bl,al
mov ax,bx
jmp call_reg1

hia_h_1:
add bh,al
mov ax,bx
jmp call_reg1

call_reg1:
call transfer_reg_to_memory

finished_executing_add:
ret
execute_add endp  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

execute_sub proc near

mov si,offset parsed_command
mov di,offset sub_c
mov cx,3

repe cmpsb 

jnz finished_executing_sub

inc si 

mov al,[si]  

get_reg al       

mov si, offset parsed_command + 7  ;awl el value

push di ; di shila awl string bta3 el regisetr el mfrood nsht8l 3lih
call transfer_meomry_to_reg
pop di     

mov bx,ax ; hna el register 7tana fi el bx 3sahn get value bt8ir ax 


cmp parsed_command + 8,67h
jnc register_input_2
jc value_input_2

register_input_2:

push bx
push di
mov al, parsed_command + 7   
get_reg al
push di
call transfer_meomry_to_reg
pop di
pop di 
pop bx


cmp parsed_command + 8,68h
jz hia_h__2
jnz msh_h__2

hia_h__2:
cmp parsed_command + 5,68h
jnz first_op_l2

sub bh,ah
mov ax,bx
jmp call_reg2

first_op_l2:
sub bl,ah
mov ax,bx

jmp call_reg2
            
msh_h__2:
cmp parsed_command + 8,6ch
jz hia_l__2
jnz hia_x__2

hia_l__2: 
cmp parsed_command + 5,6ch
jnz first_op_h2
sub bl,al
mov ax,bx
jmp call_reg2

first_op_h2: 
sub bh,al
mov ax,bx

jmp call_reg2

hia_x__2:
sub bx,ax
mov ax,bx
jmp call_reg2

value_input_2:

push di
mov di,si 
push bx
call getvalue
pop bx
pop di

cmp parsed_Command+5,68h
jnz msh_h_2
jz hia_h_2

msh_h_2:
cmp parsed_Command+5,6Ch
jnz hia_x2
jz hia_l2 

hia_x2:
sub bx,ax
mov ax,bx
jmp call_reg2   

hia_l2:  
sub bl,al
mov ax,bx
jmp call_reg2

hia_h_2:
sub bh,al
mov ax,bx
jmp call_reg2

call_reg2:
call transfer_reg_to_memory

finished_executing_sub:
ret
execute_sub endp  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

execute_adc proc near

mov si,offset parsed_command
mov di,offset adc_c
mov cx,3

repe cmpsb 

jnz finished_executing_adc

inc si 

mov al,[si]  

get_reg al       

mov si, offset parsed_command + 7  ;awl el value

push di ; di shila awl string bta3 el regisetr el mfrood nsht8l 3lih
call transfer_meomry_to_reg
pop di     

mov bx,ax ; hna el register 7tana fi el bx 3sahn get value bt8ir ax 


cmp parsed_command + 8,67h
jnc register_input_3
jc value_input_3

register_input_3:

push bx
push di
mov al, parsed_command + 7   
get_reg al
push di
call transfer_meomry_to_reg
pop di
pop di 
pop bx


cmp parsed_command + 8,68h
jz hia_h__3
jnz msh_h__3

hia_h__3:
cmp parsed_command + 5,68h
jnz first_op_l3

adc bh,ah
mov ax,bx
jmp call_reg3

first_op_l3:
adc bl,ah
mov ax,bx

jmp call_reg3
            
msh_h__3:
cmp parsed_command + 8,6ch
jz hia_l__3
jnz hia_x__3

hia_l__3: 
cmp parsed_command + 5,6ch
jnz first_op_h3
adc bl,al
mov ax,bx
jmp call_reg3

first_op_h3: 
adc bh,al
mov ax,bx

jmp call_reg3

hia_x__3:
adc bx,ax
mov ax,bx
jmp call_reg3

value_input_3:

push di
mov di,si 
push bx
call getvalue
pop bx
pop di

cmp parsed_Command+5,68h
jnz msh_h_3
jz hia_h_3

msh_h_3:
cmp parsed_Command+5,6Ch
jnz hia_x3
jz hia_l3 

hia_x3:
adc bx,ax
mov ax,bx
jmp call_reg3   

hia_l3:  
adc bl,al
mov ax,bx
jmp call_reg3

hia_h_3:
adc bh,al
mov ax,bx
jmp call_reg3

call_reg3:
call transfer_reg_to_memory

finished_executing_adc:
ret
execute_adc endp  
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

execute_sbb proc near

mov si,offset parsed_command
mov di,offset sbb_c
mov cx,3

repe cmpsb 

jnz finished_executing_sbb

inc si 

mov al,[si]  

get_reg al       

mov si, offset parsed_command + 7  ;awl el value

push di ; di shila awl string bta3 el regisetr el mfrood nsht8l 3lih
call transfer_meomry_to_reg
pop di     

mov bx,ax ; hna el register 7tana fi el bx 3sahn get value bt8ir ax 


cmp parsed_command + 8,67h
jnc register_input_4
jc value_input_4

register_input_4:

push bx
push di
mov al, parsed_command + 7   
get_reg al
push di
call transfer_meomry_to_reg
pop di
pop di 
pop bx


cmp parsed_command + 8,68h
jz hia_h__4
jnz msh_h__4

hia_h__4:
cmp parsed_command + 5,68h
jnz first_op_l4

sbb bh,ah
mov ax,bx
jmp call_reg4

first_op_l4:
sbb bl,ah
mov ax,bx

jmp call_reg4
            
msh_h__4:
cmp parsed_command + 8,6ch
jz hia_l__4
jnz hia_x__4

hia_l__4: 
cmp parsed_command + 5,6ch
jnz first_op_h4
sbb bl,al
mov ax,bx
jmp call_reg4

first_op_h4: 
sbb bh,al
mov ax,bx

jmp call_reg4

hia_x__4:
sbb bx,ax
mov ax,bx
jmp call_reg4

value_input_4:

push di
mov di,si 
push bx
call getvalue
pop bx
pop di

cmp parsed_Command+5,68h
jnz msh_h_4
jz hia_h_4

msh_h_4:
cmp parsed_Command+5,6Ch
jnz hia_x4
jz hia_l4 

hia_x4:
sbb bx,ax
mov ax,bx
jmp call_reg4   

hia_l4:  
sbb bl,al
mov ax,bx
jmp call_reg4

hia_h_4:
sbb bh,al
mov ax,bx
jmp call_reg4

call_reg4:
call transfer_reg_to_memory

finished_executing_sbb:
ret
execute_sbb endp  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

execute_xor proc near

mov si,offset parsed_command
mov di,offset xor_c
mov cx,3

repe cmpsb 

jnz finished_executing_xor

inc si 

mov al,[si]  

get_reg al       

mov si, offset parsed_command + 7  ;awl el value

push di ; di shila awl string bta3 el regisetr el mfrood nsht8l 3lih
call transfer_meomry_to_reg
pop di     

mov bx,ax ; hna el register 7tana fi el bx 3sahn get value bt8ir ax 


cmp parsed_command + 8,67h
jnc register_input_5
jc value_input_5

register_input_5:

push bx
push di
mov al, parsed_command + 7   
get_reg al
push di
call transfer_meomry_to_reg
pop di
pop di 
pop bx


cmp parsed_command + 8,68h
jz hia_h__5
jnz msh_h__5

hia_h__5:
cmp parsed_command + 5,68h
jnz first_op_l5

xor bh,ah
mov ax,bx
jmp call_reg5

first_op_l5:
xor bl,ah
mov ax,bx

jmp call_reg5
            
msh_h__5:
cmp parsed_command + 8,6ch
jz hia_l__5
jnz hia_x__5

hia_l__5: 
cmp parsed_command + 5,6ch
jnz first_op_h5
xor bl,al
mov ax,bx
jmp call_reg5

first_op_h5: 
xor bh,al
mov ax,bx

jmp call_reg5

hia_x__5:
xor bx,ax
mov ax,bx
jmp call_reg5

value_input_5:

push di
mov di,si 
push bx
call getvalue
pop bx
pop di

cmp parsed_Command+5,68h
jnz msh_h_5
jz hia_h_5

msh_h_5:
cmp parsed_Command+5,6Ch
jnz hia_x5
jz hia_l5 

hia_x5:
xor bx,ax
mov ax,bx
jmp call_reg5   

hia_l5:  
xor bl,al
mov ax,bx
jmp call_reg5

hia_h_5:
xor bh,al
mov ax,bx
jmp call_reg5

call_reg5:
call transfer_reg_to_memory

finished_executing_xor:
ret
execute_xor endp 
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

execute_and proc near

mov si,offset parsed_command
mov di,offset and_c
mov cx,3

repe cmpsb 

jnz finished_executing_and

inc si 

mov al,[si]  

get_reg al       

mov si, offset parsed_command + 7  ;awl el value

push di ; di shila awl string bta3 el regisetr el mfrood nsht8l 3lih
call transfer_meomry_to_reg
pop di     

mov bx,ax ; hna el register 7tana fi el bx 3sahn get value bt8ir ax 


cmp parsed_command + 8,67h
jnc register_input_6
jc value_input_6

register_input_6:

push bx
push di
mov al, parsed_command + 7   
get_reg al
push di
call transfer_meomry_to_reg
pop di
pop di 
pop bx


cmp parsed_command + 8,68h
jz hia_h__6
jnz msh_h__6

hia_h__6:
cmp parsed_command + 5,68h
jnz first_op_l6

and bh,ah
mov ax,bx
jmp call_reg6

first_op_l6:
and bl,ah
mov ax,bx

jmp call_reg6
            
msh_h__6:
cmp parsed_command + 8,6ch
jz hia_l__6
jnz hia_x__6

hia_l__6: 
cmp parsed_command + 5,6ch
jnz first_op_h6
and bl,al
mov ax,bx
jmp call_reg6

first_op_h6: 
and bh,al
mov ax,bx

jmp call_reg6

hia_x__6:
and bx,ax
mov ax,bx
jmp call_reg6

value_input_6:

push di
mov di,si 
push bx
call getvalue
pop bx
pop di

cmp parsed_Command+5,68h
jnz msh_h_6
jz hia_h_6

msh_h_6:
cmp parsed_Command+5,6Ch
jnz hia_x6
jz hia_l6 

hia_x6:
and bx,ax
mov ax,bx
jmp call_reg6   

hia_l6:  
and bl,al
mov ax,bx
jmp call_reg6

hia_h_6:
and bh,al
mov ax,bx
jmp call_reg6

call_reg6:
call transfer_reg_to_memory

finished_executing_and:
ret
execute_and endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

execute_mul proc near

mov si,offset parsed_command
mov di,offset mul_c
mov cx,3

repe cmpsb 

jnz finished_executing_mul

cmp parsed_command + 4,61h
jnc register_input_7
jc value_input_7

register_input_7:

push bx
mov al, parsed_command + 4   
get_reg al
push di
call transfer_meomry_to_reg
pop di 
pop bx

mov bx,ax ; register operand submitted here

mov al,"a"
push bx ; get_reg changes value of bx
get_reg al
push di
call transfer_meomry_to_reg
pop di
pop bx

cmp parsed_command + 5,68h
jz hia_h__7
jnz msh_h__7

hia_h__7:
mul bh
jmp call_reg7
            
msh_h__7:
cmp parsed_command + 5,6ch
jz hia_l__7
jnz hia_x__7

hia_l__7:
mul bl
jmp call_reg7

hia_x__7:
mul bx

push bx
push di
push ax
mov al,"d"
get_reg al
mov ax,dx
call transfer_reg_to_memory
pop ax
pop di
pop bx

jmp call_reg7

value_input_7:

cmp parsed_command + 6,20h
jnz four_digits_7
jz two_digits_7  

four_digits_7:
mov al,"a"
get_reg al
push di ; saving reg a
call transfer_meomry_to_reg
pop di

push di ; saving reg a
push ax
mov di, offset parsed_command + 4
call getvalue
mov bx,ax
pop ax
pop di

mul bx

call transfer_reg_to_memory

mov al,"d"
get_reg al
mov ax,dx
jmp call_reg7

two_digits_7:  
mov parsed_command +7 ,20h
mov parsed_command +8 ,20h
mov di,offset parsed_command + 4    ; getting operand to bx
call getvalue
mov bx,ax

mov al,"a"
push bx
get_reg al
push di     ; saving address of a
call transfer_meomry_to_reg
pop di 
pop bx

mul bl

jmp call_reg7

call_reg7:
call transfer_reg_to_memory

finished_executing_mul:
ret
execute_mul endp
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

execute_div proc near

mov si,offset parsed_command
mov di,offset div_c
mov cx,3

repe cmpsb 

jnz finished_executing_div

cmp parsed_command + 4,61h
jnc register_input_8
jc value_input_8

register_input_8:

push bx
mov al, parsed_command + 4   
get_reg al
push di
call transfer_meomry_to_reg
pop di 
pop bx

mov bx,ax ; register operand submitted here

mov al,"a"
push bx ; get_reg changes value of bx
get_reg al
push di
call transfer_meomry_to_reg
pop di
pop bx

cmp parsed_command + 5,68h
jz hia_h__8
jnz msh_h__8

hia_h__8:
div bh
jmp call_reg8
            
msh_h__8:
cmp parsed_command + 5,6ch
jz hia_l__8
jnz hia_x__8

hia_l__8:
div bl
jmp call_reg8

hia_x__8:
div bx

push bx
push di
push ax
mov al,"d"
get_reg al
mov ax,dx
call transfer_reg_to_memory
pop ax
pop di
pop bx

jmp call_reg8

value_input_8:

cmp parsed_command + 6,20h
jnz four_digits_8
jz two_digits_8  

four_digits_8:
mov al,"a"
get_reg al
push di ; saving reg a
call transfer_meomry_to_reg
pop di

push di ; saving reg a
push ax
mov di, offset parsed_command + 4
call getvalue
mov bx,ax
pop ax
pop di

div bx

call transfer_reg_to_memory

mov al,"d"
get_reg al
mov ax,dx
jmp call_reg8

two_digits_8:  
mov parsed_command +7 ,20h
mov parsed_command +8 ,20h
mov di,offset parsed_command + 4    ; getting operand to bx
call getvalue
mov bx,ax

mov al,"a"
push bx
get_reg al
push di     ; saving address of a
call transfer_meomry_to_reg
pop di 
pop bx

div bl

jmp call_reg8

call_reg8:
call transfer_reg_to_memory

finished_executing_div:
ret
execute_div endp
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

execute_imul proc near

mov si,offset parsed_command
mov di,offset imul_c
mov cx,4

repe cmpsb 

jnz finished_executing_imul

cmp parsed_command + 5,61h
jnc register_input_9
jc value_input_9

register_input_9:

push bx
mov al, parsed_command + 5   
get_reg al
push di
call transfer_meomry_to_reg
pop di 
pop bx

mov bx,ax ; register operand submitted here

mov al,"a"
push bx ; get_reg changes value of bx
get_reg al
push di
call transfer_meomry_to_reg
pop di
pop bx

cmp parsed_command + 6,68h
jz hia_h__9
jnz msh_h__9

hia_h__9:
imul bh
jmp call_reg9
            
msh_h__9:
cmp parsed_command + 6,6ch
jz hia_l__9
jnz hia_x__9

hia_l__9:
imul bl
jmp call_reg9

hia_x__9:
imul bx

push bx
push di
push ax
mov al,"d"
get_reg al
mov ax,dx
call transfer_reg_to_memory
pop ax
pop di
pop bx

jmp call_reg9

value_input_9:

cmp parsed_command + 7,20h
jnz four_digits_9
jz two_digits_9  

four_digits_9:
mov al,"a"
get_reg al
push di ; saving reg a
call transfer_meomry_to_reg
pop di

push di ; saving reg a
push ax
mov di, offset parsed_command + 5
call getvalue
mov bx,ax
pop ax
pop di

imul bx

call transfer_reg_to_memory

mov al,"d"
get_reg al
mov ax,dx
jmp call_reg9

two_digits_9:  
mov parsed_command +8 ,20h
mov parsed_command +9 ,20h
mov di,offset parsed_command + 5    ; getting operand to bx
call getvalue
mov bx,ax

mov al,"a"
push bx
get_reg al
push di     ; saving address of a
call transfer_meomry_to_reg
pop di 
pop bx

imul bl

jmp call_reg9

call_reg9:
call transfer_reg_to_memory

finished_executing_imul:
ret
execute_imul endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

execute_push proc near 
    
mov si,offset parsed_command
mov di,offset push_c
mov cx,4
repe cmpsb 

jnz finished_executing_push

mov si,offset parsed_command + 5
mov di,offset str_ax
mov cx,2h
repe cmpsb

jz is_Ax

mov si,offset parsed_command + 5
mov di,offset str_bx
mov cx,2h
repe cmpsb

jz is_bx  

mov si,offset parsed_command + 5
mov di,offset str_cx
mov cx,2h
repe cmpsb

jz is_cx

mov si,offset parsed_command + 5
mov di,offset str_bx
mov cx,2h
repe cmpsb

jz is_dx
jnz error_push

is_ax:    ; operand is ax

mov al,"a"    ; getting correct reg
get_reg al
call transfer_meomry_to_reg   ; putting reg in ax

cmp turn,1h     ; checking turn to see which player's stack to use
jz p2_regs_0
jnz p1_regs_0

p2_regs_0:
mov cx,sp_p2   ; sp points to first empty place in stack
mov di,offset stack_p2
add di,cx

mov [di],ah
inc sp_p2
inc di

mov [di],al
inc sp_p2

jmp finished_executing_push 

p1_regs_0:
mov cx,sp_p1
mov di,offset stack_p1
add di,cx

mov [di],ah
inc sp_p1
inc di

mov [di],al
inc sp_p1

jmp finished_executing_push 

is_bx:

mov al,"b"
get_reg al
call transfer_meomry_to_reg

cmp turn,1h
jz p2_regs_1
jnz p1_regs_1

p2_regs_1:
mov cx,sp_p2
mov di,offset stack_p2
add di,cx

mov [di],ah
inc sp_p2
inc di

mov [di],al
inc sp_p2

jmp finished_executing_push 

p1_regs_1:
mov cx,sp_p1
mov di,offset stack_p1
add di,cx

mov [di],ah
inc sp_p1
inc di

mov [di],al
inc sp_p1 

jmp finished_executing_push  

is_cx:

mov al,"c"
get_reg al
call transfer_meomry_to_reg

cmp turn,1h
jz p2_regs_2
jnz p1_regs_2

p2_regs_2:
mov cx,sp_p2
mov di,offset stack_p2
add di,cx

mov [di],ah
inc sp_p2
inc di

mov [di],al
inc sp_p2

jmp finished_executing_push 

p1_regs_2:
mov cx,sp_p1
mov di,offset stack_p1
add di,cx

mov [di],ah
inc sp_p1
inc di

mov [di],al
inc sp_p1 

jmp finished_executing_push

is_dx:

mov al,"d"
get_reg al
call transfer_meomry_to_reg

cmp turn,1h
jz p2_regs_3
jnz p1_regs_3

p2_regs_3:
mov cx,sp_p2
mov di,offset stack_p2
add di,cx

mov [di],ah
inc sp_p2
inc di

mov [di],al
inc sp_p2

jmp finished_executing_push 

p1_regs_3:
mov cx,sp_p1
mov di,offset stack_p1
add di,cx

mov [di],ah
inc sp_p1
inc di

mov [di],al
inc sp_p1 

jmp finished_executing_push

error_push:
; display error msg

finished_executing_push:
ret
execute_push endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

execute_pop proc near 
    
mov si,offset parsed_command
mov di,offset pop_c
mov cx,3
repe cmpsb 

jnz fini_pop

mov si,offset parsed_command + 4
mov di,offset str_ax
mov cx,2h
repe cmpsb

jz is_Ax1

mov si,offset parsed_command + 4
mov di,offset str_bx
mov cx,2h
repe cmpsb

jz is_bx1  

mov si,offset parsed_command + 4
mov di,offset str_cx
mov cx,2h
repe cmpsb

jz is_cx1

mov si,offset parsed_command + 4
mov di,offset str_dx
mov cx,2h
repe cmpsb
jz is_dx1  

jnz error_pop

is_ax1:    ; operand is ax

cmp turn,1h     ; checking turn to see which player's stack to use
jz p2_regs_4
jnz p1_regs_4

p2_regs_4:

cmp sp_p2,0h
jz error_pop

dec sp_p2   ; sp points to first empty place in stack
mov di,offset stack_p2
mov cx,sp_p2
add di,cx

mov al,[di]

dec sp_p2
dec di

mov ah,[di]

jmp finished_executing_pop 

p1_regs_4: 

cmp sp_p1,0h
jz error_pop

dec sp_p1
mov cx,sp_p1
mov di,offset stack_p1
add di,cx

mov al,[di]

dec sp_p1
dec di

mov ah,[di]

jmp finished_executing_pop 

is_bx1:    ; operand is ax

cmp turn,1h     ; checking turn to see which player's stack to use
jz p2_regs_5
jnz p1_regs_5

p2_regs_5:

cmp sp_p2,0h
jz error_pop

dec sp_p2   ; sp points to first empty place in stack
mov di,offset stack_p2
mov cx,sp_p2
add di,cx

mov al,[di]

dec sp_p2
dec di

mov ah,[di]

jmp finished_executing_pop 

p1_regs_5: 

cmp sp_p1,0h
jz error_pop

dec sp_p1
mov cx,sp_p1
mov di,offset stack_p1
add di,cx

mov al,[di]

dec sp_p1
dec di

mov ah,[di]

jmp finished_executing_pop 

is_cx1:    ; operand is ax

cmp turn,1h     ; checking turn to see which player's stack to use
jz p2_regs_6
jnz p1_regs_6

p2_regs_6:

cmp sp_p2,0h
jz error_pop

dec sp_p2   ; sp points to first empty place in stack
mov di,offset stack_p2
mov cx,sp_p2
add di,cx

mov al,[di]

dec sp_p2
dec di

mov ah,[di]

jmp finished_executing_pop 

p1_regs_6: 

cmp sp_p1,0h
jz error_pop

dec sp_p1
mov cx,sp_p1
mov di,offset stack_p1
add di,cx

mov al,[di]

dec sp_p1
dec di

mov ah,[di]

jmp finished_executing_pop 

is_dx1:    ; operand is ax

cmp turn,1h     ; checking turn to see which player's stack to use
jz p2_regs_8
jnz p1_regs_8

p2_regs_8:

cmp sp_p2,0h
jz error_pop

dec sp_p2   ; sp points to first empty place in stack
mov di,offset stack_p2
mov cx,sp_p2
add di,cx

mov al,[di]

dec sp_p2
dec di

mov ah,[di]

jmp finished_executing_pop 

p1_regs_8: 

cmp sp_p1,0h
jz error_pop

dec sp_p1
mov cx,sp_p1
mov di,offset stack_p1
add di,cx

mov al,[di]

dec sp_p1
dec di

mov ah,[di]

jmp finished_executing_pop 

error_pop:
; display error msg
jmp fini_pop

finished_executing_pop:

push ax
mov al,parsed_command + 4
get_reg al   
pop ax
call transfer_reg_to_memory

fini_pop:
ret
execute_pop endp 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                                                                         
getvalue proc near
cmp [di+3],20h
jz threedigit

mov al,byte ptr [di]
call convert_ascii_to_hex
mov ah,00h
mov bx,1000h
mul bx
mov cx,ax

mov al,byte ptr [di]+1
call convert_ascii_to_hex
mov ah,00h
mov bx,100h
mul bx
add cx,ax

mov al,byte ptr [di]+2   
call convert_ascii_to_hex
mov ah,00h
mov bh,10h
mul bh
add cx,ax

mov al,byte ptr [di]+3     
call convert_ascii_to_hex
mov ah,00h
add cx,ax

mov ax,cx

jmp finished_get_value

threedigit:           
cmp [di+2],20h
jz twodigit

mov cx,0000h

mov al,byte ptr [di]+0
call convert_ascii_to_hex
mov ah,00h
mov bx,100h
mul bx
add cx,ax

mov al,byte ptr [di]+1   
call convert_ascii_to_hex
mov ah,00h
mov bh,10h
mul bh
add cx,ax

mov al,byte ptr [di]+2     
call convert_ascii_to_hex
mov ah,00h
add cx,ax

mov ax,cx

jmp finished_get_value
 
twodigit:   
 
mov al,[di]+1
cmp al,20h
jz onedigit

mov cx,0000h
mov al,byte ptr [di]+0   
call convert_ascii_to_hex
mov ah,00h
mov bh,10h
mul bh
add cx,ax

mov al,byte ptr [di]+1     
call convert_ascii_to_hex
mov ah,00h
add cx,ax

mov ax,cx 

jmp finished_get_value 

onedigit:  

mov cx,0000h
mov al,byte ptr [di]+0     
call convert_ascii_to_hex
mov ah,00h
add cx,ax

mov ax,cx

finished_get_value: 
ret   
getvalue endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

check_forbidden proc near
    
cmp turn,1h ; if turn = 1 , player 1 can't use forbidden character assigned to him
jz check_with_forbidden_1 
jnz check_with_forbidden_2

check_with_forbidden_1:

mov bl,forbidden_p1
mov cx,15d
mov di, offset parsed_command
jmp check_0

check_with_forbidden_2: 
mov bl,forbidden_p2
mov cx,15d
mov di, offset parsed_command

check_0:
cmp [di],bl  ; bl contains forbidden character, if found jump to set si to 1 else continue checking
jz forbidden_found

inc di
dec cx
jnz check_0
jmp forbidden_not_found   

forbidden_found:
mov si,0001h
jmp finished_forbidden

forbidden_not_found:
mov si,0000h 
    
finished_forbidden:    
ret   
check_forbidden endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

check_Answer_level_2 proc near
     
call clearscreen 

mov ah,2h  ;setting cursor
mov bh,00h
mov dx,0000h
int 10h  

mov ah,9  ; displaying enter level msg
mov dx,offset mesg_ask_which_processer
int 21h  

mov ah,00h
int 16h

sub al,30h
mov answer_level2,al

cmp answer_level2,1h
jz need_to_turn 
jnz finished_checking_level2

need_to_turn:
call next_turn

finished_checking_level2:
ret    
check_Answer_level_2 endp  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
reg_level2_initial proc near  
    
mov ah,0ah ; reading value
mov dx,offset buffer_initial_Reg
int 21h
mov di,offset buffer_initial_Reg+2

call getvalue
mov di,offset p1_ax
call transfer_reg_to_memory 

mov cx,5d
mov di,offset buffer_initial_Reg+2
clear_buffer_initial_Reg: mov [di],20h
inc di
dec cx
jnz clear_buffer_initial_Reg

mov ah,0ah ; reading value
mov dx,offset buffer_initial_Reg
int 21h
mov di,offset buffer_initial_Reg+2

call getvalue
mov di,offset p1_bx
call transfer_reg_to_memory   

mov cx,5d
mov di,offset buffer_initial_Reg+2
clear_buffer_initial_Reg1: mov [di],20h
inc di
dec cx
jnz clear_buffer_initial_Reg1

mov ah,0ah ; reading value
mov dx,offset buffer_initial_Reg
int 21h
mov di,offset buffer_initial_Reg+2

call getvalue
mov di,offset p1_cx
call transfer_reg_to_memory   

mov cx,5d
mov di,offset buffer_initial_Reg+2
clear_buffer_initial_Reg2: mov [di],20h
inc di
dec cx
jnz clear_buffer_initial_Reg2

mov ah,0ah ; reading value
mov dx,offset buffer_initial_Reg
int 21h
mov di,offset buffer_initial_Reg+2

call getvalue
mov di,offset p1_dx
call transfer_reg_to_memory   

mov cx,5d
mov di,offset buffer_initial_Reg+2
clear_buffer_initial_Reg3: mov [di],20h
inc di
dec cx
jnz clear_buffer_initial_Reg3

mov ah,0ah ; reading value
mov dx,offset buffer_initial_Reg
int 21h
mov di,offset buffer_initial_Reg+2

call getvalue
mov di,offset p2_ax
call transfer_reg_to_memory   

mov cx,5d
mov di,offset buffer_initial_Reg+2
clear_buffer_initial_Reg4: mov [di],20h
inc di
dec cx
jnz clear_buffer_initial_Reg4

mov ah,0ah ; reading value
mov dx,offset buffer_initial_Reg
int 21h
mov di,offset buffer_initial_Reg+2
call getvalue
mov di,offset p2_bx
call transfer_reg_to_memory  

mov cx,5d
mov di,offset buffer_initial_Reg+2
clear_buffer_initial_Reg5: mov [di],20h
inc di
dec cx
jnz clear_buffer_initial_Reg5

mov ah,0ah ; reading value
mov dx,offset buffer_initial_Reg
int 21h
mov di,offset buffer_initial_Reg+2

call getvalue
mov di,offset p2_cx
call transfer_reg_to_memory 
                              
mov cx,5d
mov di,offset buffer_initial_Reg+2
clear_buffer_initial_Reg6: mov [di],20h
inc di
dec cx
jnz clear_buffer_initial_Reg6                              
                              
mov ah,0ah ; reading value
mov dx,offset buffer_initial_Reg
int 21h
mov di,offset buffer_initial_Reg+2

call getvalue
mov di,offset p2_dx
call transfer_reg_to_memory

ret
reg_level2_initial endp                                                                         
                                                                         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; chatting module edits ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
chat_mode proc near

	                           mov  ax,@data
	                           mov  ds,ax

	                           mov  ax,0012h
	                           int  10h
	                           call PortInit
	                           call DrawingChatScreen

	NewString:                 
	                           mov  bx,0
	                           mov  ah,2
	                           mov  dh,Cursor_SendingY
	                           mov  dl,Cursor_SendingX
	                           int  10h                       	;Reset Cursor to new writing position
	AGAIN1:                    mov  ah,2
	                           mov  dh,Cursor_SendingY
	                           mov  dl,Cursor_SendingX
	                           int  10h                       	;Reset Cursor to new writing position
	                           mov  ah,01
	                           int  16h                       	;Check if key pressed
	                           JZ   AGAINRec                  	;if no key pressed go check if we recieved any char
	                           Mov  ah,0
	                           int  16h                       	;get key pressed
	                           CMP  Ah,3Dh                    	;if pressed key is escape exit program
	                           JE   Exit
	                           mov  StringSent[bx],al         	;else move entered character even if Enter to StringSent variable
	                           CMP  al,0Dh                    	;compare entered char to enter
	                           JE   Send                      	;if Enter Send the String
	                           CMP  al,08h
	                           JNE  NoBackSpace               	;if key pressed not backspace jump to storing it
	                           cmp  bx,0
	                           JE   AGAIN1                    	;else if key is backspace but we are at start of screen jump to get next character
	                           dec  bx
	                           dec  Cursor_SendingX
	                           mov  ah,2
	                           mov  dh,Cursor_SendingY
	                           mov  dl,Cursor_SendingX
	                           int  10h                       	;if key is backspace we dec the Cursor position in x and move cursor to this position
	                           mov  ah,2
	                           mov  dl,' '
	                           int  21h                       	;print empty space on screen as if user deleted wrong char
	                           mov  ah,2
	                           mov  dh,Cursor_SendingY
	                           mov  dl,Cursor_SendingX
	                           int  10h                       	;after printing the space we need to go back to its position to overwrite it
	                           JMP  AGAIN1
	NoBackSpace:               
	                           inc  bx
	                           push bx
	                           mov  ah,9
	                           mov  bh,0
	                           mov  cx,1
	                           mov  bl,0FBh
	                           int  10h                       	;print char on screen with colour
	                           pop  bx                        	;return bx original value
	                           inc  Cursor_SendingX           	;move cursor to next line
	                           cmp  Cursor_SendingX,80
	                           JAE  SendEndX
	                           JMP  AGAIN1                    	;Take new key
	SendEndX:                  
	                           mov  StringSent[bx],0Dh

	Send:                      
	                           call CheckSendingEndofScreenY
	                           mov  Cursor_SendingX,4
	                           mov  bx,0
	AGAIN:                     
	                           mov  dx , 3FDH                 	; Line Status Register
	                           In   al , dx                   	;Read Line Status
	                           AND  al , 00100000b
	                           JZ   AGAIN                     	;if line not empty loop until we can send

	                           mov  dx , 3F8H                 	; Transmit data register
	                           mov  al,StringSent[bx]         	;mov StringSent to be sent
	                           inc  bx                        	;inc bx to get next character to send

	                           out  dx , al
	                           CMP  al,0Dh                    	;compare last character sent to Enter
	                           JE   NewString                 	;if Enter jump to get a new String
	                           JMP  AGAIN                     	;else loop until we send all characters

   

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	RecieveNew:                
	                           mov  bx,0                      	; Reset bx to read a new string
	                           mov  ah,2
	                           mov  dh,Cursor_RecievingY
	                           mov  dl,Cursor_RecievingX
	                           int  10h                       	;Reset Cursor to new writing position
	;Check that Data Ready
	AGAINRec:                  
	                           mov  ah,2
	                           mov  dh,Cursor_RecievingY
	                           mov  dl,Cursor_RecievingX
	                           int  10h                       	;Reset Cursor to new writing position
	                           mov  dx , 3FDH                 	; Line Status Register
	                           in   al , dx
	                           AND  al , 1
	                           JZ   AGAIN1                    	;if line is not empty we check if key pressed
	                           mov  dx , 03F8H                	;go to recieve mode
	                           in   al , dx
	                           mov  StringRecieved[bx],al     	;move character to StringRecieved
	                           inc  bx
	                           cmp  al,0Dh                    	;if next character to be printed is Enter print the string and reset to recieve new
	                           JE   Print12
	                           JMP  AGAINRec                  	;else go retrieve next character
	Print12:                     
	                           mov  StringRecieved[bx],'$'    	;move $ to the last position for printing
	                           mov  ah,09
	                           mov  dx, offset StringRecieved
	                           int  21h
	                           call CheckRecievingEndofScreenY
	                           mov  Cursor_RecievingX,4
	                           JMP  RecieveNew                	;after printing the string go recieve a new one


	Exit:                      
	                           Mov  ah,4ch                    	;terminate program
	                           int  21h
chat_mode endp

DrawingChatScreen proc
	                           mov  ah,2
	                           mov  dh,0
	                           mov  dl,0
	                           int  10h                       	;Reset Cursor to new writing position
	                           mov  ah,09
	                           mov  dx, offset user1		;typing the player name
	                           int  21h
	                           mov  ah,2
	                           mov  dl,':'
	                           int  21h
	;Wrting p1 name
	                           mov  ah,2
	                           mov  dh,14
	                           mov  dl,0
	                           int  10h                       	;Reset Cursor to new writing position
	                           mov  ah,09
	                           mov  dx, offset user2
	                           int  21h
	                           mov  ah,2
	                           mov  dl,':'
	                           int  21h
	;Wrting p2 name
	                           mov  ah,2
	                           mov  dh,13
	                           mov  dl,0
	                           int  10h                       	;Reset Cursor to new writing position
	                           mov  ah,9
	                           mov  bh,0
	                           mov  cx,79						;no. of times the character will be drawn by
	                           mov  bl,0FBh						;color
	                           mov  al,45
	                           int  10h                       	;print middle line on screen with colour
	;First Line drawn
	                           mov  ah,2
	                           mov  dh,27
	                           mov  dl,0
	                           int  10h                       	;Reset Cursor to new writing position
	                           mov  ah,9
	                           mov  bh,0
	                           mov  cx,79
	                           mov  bl,0FDh
	                           mov  al,45
	                           int  10h                       	;print lower line on screen with colour
	;Second line drawn
	                           mov  ah,2
	                           mov  dh,28
	                           mov  dl,0
	                           int  10h                       	;Reset Cursor to new writing position
	                           mov  ah,09
	                           mov  dx, offset Endchatmsg1
	                           int  21h
	                           mov  ah,09
	                           mov  dx, offset user2
	                           int  21h
	                           mov  ah,09
	                           mov  dx, offset Endchatmsg2
	                           int  21h
	                           ret
DrawingChatScreen endp

PortInit proc
	                           mov  dx,3fbh                   	; Line Control Register
	                           mov  al,10000000b              	;Set Divisor Latch Access Bit
	                           out  dx,al

	;Set LSB byte of the Baud Rate Divisor Latch register.
	                           mov  dx,3f8h
	                           mov  al,0ch
	                           out  dx,al

	;Set MSB byte of the Baud Rate Divisor Latch register.
	                           mov  dx,3f9h
	                           mov  al,00h
	                           out  dx,al

	                           mov  dx,3fbh
	                           mov  al,00011011b              	;0:Access to Receiver buffer, Transmitter buffer 0:Set Break disabled 011:Even Parity 0:One Stop Bit 11:8bits
	                           out  dx,al
	                           ret
PortInit endp
CheckSendingEndofScreenY proc
	                           cmp  Cursor_SendingY,12
	                           JL   nextLine
	                           mov  ah,6                      	; function 6
	                           mov  al,1                      	; scroll by 1 line
	                           mov  bh,0                      	; normal video attribute
	                           mov  ch,1                      	; upper left Y
	                           mov  cl,0                      	; upper left X
	                           mov  dh,12                     	; lower right Y
	                           mov  dl,79                     	; lower right X
	                           int  10h
	                           JMP  ENDcheckscreenY
	nextLine:                  
	                           inc  Cursor_SendingY
	ENDcheckscreenY:           
	                           ret
CheckSendingEndofScreenY endp

CheckRecievingEndofScreenY proc
	                           cmp  Cursor_RecievingY,26
	                           JL   nextLineRec
	                           mov  ah,6                      	; function 6
	                           mov  al,1                      	; scroll by 1 line
	                           mov  bh,0                      	; normal video attribute
	                           mov  ch,15                     	; upper left Y
	                           mov  cl,0                      	; upper left X
	                           mov  dh,26                     	; lower right Y
	                           mov  dl,79                     	; lower right X
	                           int  10h
	                           JMP  ENDcheckscreenRecY
	nextLineRec:               
	                           inc  Cursor_RecievingY
	ENDcheckscreenRecY:        
	                           ret
CheckRecievingEndofScreenY endp

chng_forbidden proc near ;power up :  change forbidden character
push ax
push di

cmp turn,01h
jz p1_turn1
jnz p2_turn1

p1_turn1:
cmp points_1,8d
jc finished_executing_pu1
sub points_1,8d             

mov ah,9  ; displaying enter level msg
mov dx,offset mesg_forbidden_1
int 21h  

mov ah,00h
int 16h
mov forbidden_p2,al 

jmp finished_executing_pu1  

p2_turn1:

cmp points_2,8d
jc finished_executing_pu1
sub points_2,8d

mov ah,9  ; displaying enter level msg
mov dx,offset mesg_forbidden_2
int 21h  

mov ah,00h
int 16h
mov forbidden_p1,al  

finished_executing_pu1:

pop di
pop ax
      
ret
chng_forbidden endp              

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 

execute_on_own proc near ;power up :  change forbidden character
    
push ax
push di

cmp turn,01h
jz p1_turn2
jnz p2_turn2

p1_turn2:
cmp points_1,5d
jc finished_executing_pu2
sub points_1,5d             

call next_turn

mov answer_level2,1h

jmp finished_executing_pu2  

p2_turn2:

cmp points_2,5d
jc finished_executing_pu2
sub points_2,5d  

call next_turn

mov answer_level2,1h

finished_executing_pu2:

pop di
pop ax      
ret

execute_on_own endp   
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

execute_on_both proc near 
    
cmp turn,01h
jz p1_turn3
jnz p2_turn3 

p1_turn3: 
cmp points_1,3d
jc finished_executing_pu3
sub points_1,3d  
           
call get_command
call parse_command 
call check_forbidden
cmp si,0001h
;jz inc_turn
; proc check i=en parsed command mfihash el character
; check en el command al,1234 
call execute_pop
call execute_push
call execute_mul 
call execute_add
call execute_mov 
call execute_clc
call execute_inc
call execute_dec
call execute_sub
call execute_adc
call execute_sbb
call execute_xor
call execute_div      
call execute_imul

call next_turn

call execute_pop
call execute_push
call execute_mul 
call execute_add
call execute_mov 
call execute_clc
call execute_inc
call execute_dec
call execute_sub
call execute_adc
call execute_sbb
call execute_xor
call execute_div      
call execute_imul   

call next_turn

mov cx,15d
mov di,offset parsed_command
clear_parsed_8: mov [di],20h
inc di
dec cx
jnz clear_parsed_8
mov answer_level2,0h

;add buffer clearing

jmp finished_executing_pu3

p2_turn3:
cmp points_2,3d
jc finished_executing_pu3
sub points_2,3d 

call execute_pop
call execute_push
call execute_mul 
call execute_add
call execute_mov 
call execute_clc
call execute_inc
call execute_dec
call execute_sub
call execute_adc
call execute_sbb
call execute_xor
call execute_div      
call execute_imul

call next_turn

call execute_pop
call execute_push
call execute_mul 
call execute_add
call execute_mov 
call execute_clc
call execute_inc
call execute_dec
call execute_sub
call execute_adc
call execute_sbb
call execute_xor
call execute_div      
call execute_imul 

call next_turn

mov cx,15d
mov di,offset parsed_command
clear_parsed_9: mov [di],20h
inc di
dec cx
jnz clear_parsed_9
mov answer_level2,0h
; clear buffer

finished_executing_pu3:
ret
execute_on_both endp       


                                                                         
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
end main                                                                   
