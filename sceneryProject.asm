; clear the screen 
; using BIOS mode with subroutines that provide graphical and textual features
mov ax,0600h ;scroll the screen
mov bh,07 ;normal attribute
mov cx,0000 ;from row=00,column=00
mov dx,184fh ;to row=18h, column=4fh
int 10h ;invoke the interrupt to clear screen to clear screen

mov ah,00 ;set video mode:: graphical mode. 40x25. 256 colors. 320x200 pixels. 1 page.
mov al,13h ;mode=13(CGA High resolution) with wide spectrum of colors
int 10h ;invoke the interrupt to change mode | DONE!

; Start drawing house
; top horizontal line (house) 
mov cx,130 ;start line at col=130
mov dx,75 ;row=75
L1: mov ah,0ch ;ah=0ch to draw a line  0ch: function to plot pixel
mov al,07h ;pixels=light grey
int 10h ;invoke the interrupt to draw the line
inc cx ;increment the horizontal position
cmp cx,216 ;draw line until column=216
jnz L1 
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; bottom horizontal line (house)
mov cx,130
mov dx,125
L2: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,216
jnz L2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; left vertical line (house)
mov cx,130
mov dx,75
L3: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,125
jnz L3  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; right vertical line (house)
mov cx,216
mov dx,75
L4: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,126
jnz L4  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; left roof line (house)
mov cx,130
mov dx,75
L5: mov ah,0ch
mov al,07h
int 10h
inc cx
dec dx
cmp cx,173
cmp dx,32
jnz L5  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; right roof line (house)
mov cx,173
mov dx,32
L6: mov ah,0ch
mov al,07h
int 10h
inc cx
inc dx
cmp cx,216
cmp dx,75
jnz L6 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;!!House Outline Finished!! 

; Draw the Door
; left door line (house)
mov cx,164
mov dx,125
D1: mov ah,0ch
mov al,07h
int 10h
dec dx
cmp dx,100
jnz D1  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; right door line (house)
mov cx,182
mov dx,125
D2: mov ah,0ch
mov al,07h
int 10h
dec dx
cmp dx,100
jnz D2  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; top door line (house)
mov cx,164
mov dx,100
D3: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,183
jnz D3 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;!!Door Finished!!
; Draw two Windows
; left window vert line1 (house)
mov cx,136
mov dx,85
W1: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,105
jnz W1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; left window vert line2 (house)
mov cx,146
mov dx,85
W2: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,105
jnz W2 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;left window vert line3 (house)
mov cx,156
mov dx,85
W3: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,105
jnz W3 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; right window vert line1 (house)
mov cx,190
mov dx,85
W4: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,105
jnz W4 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; right window vert line2 (house)
mov cx,200
mov dx,85
W5: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,105
jnz W5 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; left window vert line3 (house)
mov cx,210
mov dx,85
W6: mov ah,0ch
mov al,07h
int 10h
inc dx
cmp dx,105
jnz W6 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; window horz line1 (house)
mov cx,136
mov dx,85
W7: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,156
jnz W7 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov cx,190 ;this line continues for the second window at column=190
mov dx,85
W8: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,210
jnz W8 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; window horz line2 (house)
mov cx,136
mov dx,95
W9: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,156
jnz W9 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov cx,190
mov dx,95
W12: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,210
jnz W12 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; window horz line3 (house)
mov cx,136
mov dx,105
W10: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,157
jnz W10  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
mov cx,190
mov dx,105
W11: mov ah,0ch
mov al,07h
int 10h
inc cx
cmp cx,211
jnz W11
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Windows Finished
;!!House Finished!!  



; Draw the path
; left path top (path)
mov cx,164
mov dx,126
pthLT: mov ah,0ch
mov al,0ch ;pixels=light red
int 10h
dec cx
inc dx
cmp cx,144
cmp dx,146
jnz pthLT 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; right path top (path)
mov cx,182
mov dx,126
pthRT: mov ah,0ch
mov al,0ch
int 10h
dec cx
inc dx
cmp cx,162
cmp dx,146
jnz pthRT
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; left path middle (path)
mov cx,144
mov dx,146
pthLM: mov ah,0ch
mov al,0ch
int 10h
inc dx
cmp dx,166
jnz pthLM   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; right path middle (path)
mov cx,162
mov dx,146
pthRM: mov ah,0ch
mov al,0ch
int 10h
inc dx
cmp dx,166
jnz pthRM 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; left path bottom (path)
mov cx,144
mov dx,166
pthLB: mov ah,0ch
mov al,0ch
int 10h
dec cx
inc dx
cmp cx,114
cmp dx,196
jnz pthLB  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; right path bottom (path)
mov cx,162
mov dx,166
pthRB: mov ah,0ch
mov al,0ch
int 10h
dec cx
inc dx
cmp cx,132
cmp dx,196
jnz pthRB  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;!!Path Finished!!
; Draw the tree
; left trunk base (tree)
mov cx,40
mov dx,135
treLTB: mov ah,0ch
mov al,06h ;pixels=brown
int 10h
inc cx
dec dx
cmp cx,55
cmp dx,120
jnz treLTB 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; right trunk base (tree)
mov cx,86
mov dx,135
treRTB: mov ah,0ch
mov al,06h
int 10h
dec cx
dec dx
cmp cx,71
cmp dx,120
jnz treRTB  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; left trunk vert (tree)
mov cx,55
mov dx,120
treLTV: mov ah,0ch
mov al,06h
int 10h
dec dx
cmp dx,80
jnz treLTV 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; right trunk vert (tree)
mov cx,71
mov dx,120
treRTV: mov ah,0ch
mov al,06h
int 10h
dec dx
cmp dx,80
jnz treRTV  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; I like pine trees
mov dx,80
mov bx,101
DrwTree: ;draws a green pine tree with a 3 nested jump commands
mov cx,126
sub cx,bx ;keeps green tree symmetrical
GrTree: mov ah,0ch
mov al,02h ;pixels=green
int 10h
inc cx
cmp cx,bx
jnz GrTree  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cmp bx,65 ;when bx reaches a predetermined value (size of green tree)
jle break ;loop exits
sub dx,3 ;moves green line up
sub bx,2 ;makes tree narrow on each pass
jmp DrwTree
break:
;!!Tree Finished!!
; Draw the sun
mov dx,15 ;establish initial position of sun (top left pixel)
mov bx,278
mov cx,278
mov ds,cx
;draw the top half of the sun
DrwSunT:
mov cx,ds ;cx gets cleared when the loop repeats so value needs to be stored
sub cx,3 ;start the yellow line further to the left each pass
mov ds,cx ;stores cx value for next pass
DrwSunTp: mov ah,0ch
mov al,0eh ;pixels=yellow
int 10h
inc cx
cmp cx,bx
jnz DrwSunTp  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cmp dx,22 ;when the sun has drawn 7 rows breaks to the middle section
je break2
inc dx ;move the line to be colored yellow down one row
add bx,3 ;makes the sun wider each pass
jmp DrwSunT ;repeats the loop with new dx, bx and cx values
break2:
;draw sun middle
DrwSunM:
inc dx ;draws a rectangular middle section
mov cx,ds ;remembers how long to make the yellow line on each pass
DrwSunMp: mov ah,0ch
mov al,0eh
int 10h
inc cx
cmp cx,bx
jnz DrwSunMp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cmp dx,36 ;jumps to the bottom section when 13 rect rows have been drawn
je break3
jmp DrwSunM
break3:
;draw bottom of sun
DrwSunB:
inc dx ;similar to top part of sun
mov cx,ds
add cx,3 ;each pass line starts further to the right
mov ds,cx
sub bx,3 ;each pass line gets shorter
DrwSunBp: mov ah,0ch
mov al,0eh
int 10h
inc cx
cmp cx,bx
jnz DrwSunBp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
cmp dx,43 ;after 7 more rows each narrower than prev (upside triangle)
je breakfinal ;graphic program jumps for the last time
jmp DrwSunB:
breakfinal: ;returns control to the op. system
; sun finished