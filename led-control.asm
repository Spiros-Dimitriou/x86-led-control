	       
; Initial assembler source file for FLT-8086

		assume cs:CODE, ds:CODE, es:CODE
		org	0050h:0100h
	
INIT:	MOV AL,99H
		OUT 07,AL
		MOV AL,0
		OUT 03,AL

START:	IN AL,01
		CMP AL,05H
		JB TABST1
		JMP TABST

TABST:	CLD
		MOV SI,OFFSET TABLE
		MOV BL,4

LOOP:	LODSB
		OUT 03,AL
		LODSB
		MOV DL,AL
		CALL DELAY
		DEC BL
		JNZ LOOP
		JMP START
		
		
DELAY: 	MOV CX,27000
DEL1:	DEC CX
		JNZ DEL1
		DEC DL
		JNZ DELAY
		RET

TABLE	DB 82H,180
		DB 84H,30
		DB 28H,50
		DB 48H,30


TABST1:	CLD
		MOV SI,OFFSET TABLE1
		MOV BL,2

LOOP1:	LODSB
		OUT 03,AL
		LODSB
		MOV DL,AL
		CALL DELAY
		DEC BL
		JNZ LOOP1
		JMP START

TABLE1	DB 04H,10
		DB 00H,10

END