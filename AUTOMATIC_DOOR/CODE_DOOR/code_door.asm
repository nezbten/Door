
_main:

;CODE_DOOR.c,10 :: 		void main() {
;CODE_DOOR.c,11 :: 		trisc=0; portc=0 ;            //define portc as output
	CLRF       TRISC+0
	CLRF       PORTC+0
;CODE_DOOR.c,12 :: 		trisb=0b00011111; portb=0;    //define ports B0 to B4 as input
	MOVLW      31
	MOVWF      TRISB+0
	CLRF       PORTB+0
;CODE_DOOR.c,14 :: 		while(close_end == 0) motor_close=1; //check if the door is closed ??
L_main0:
	BTFSC      PORTB+0, 4
	GOTO       L_main1
	BSF        PORTC+0, 1
	GOTO       L_main0
L_main1:
;CODE_DOOR.c,15 :: 		motor_close=0;                     //stop closing
	BCF        PORTC+0, 1
;CODE_DOOR.c,16 :: 		while(start ==0);                  //waiting start sensor
L_main2:
	BTFSC      PORTB+0, 0
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;CODE_DOOR.c,17 :: 		while(1){
L_main4:
;CODE_DOOR.c,18 :: 		if(entry_sensor==1){     //entry sensor sensing
	BTFSS      PORTB+0, 1
	GOTO       L_main6
;CODE_DOOR.c,19 :: 		motor_close=0;
	BCF        PORTC+0, 1
;CODE_DOOR.c,20 :: 		delay_ms(500);          //waiting to open motor damage
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
	NOP
;CODE_DOOR.c,21 :: 		motor_open=1;    //open door
	BSF        PORTC+0, 0
;CODE_DOOR.c,22 :: 		while(open_end==0);
L_main8:
	BTFSC      PORTB+0, 3
	GOTO       L_main9
	GOTO       L_main8
L_main9:
;CODE_DOOR.c,23 :: 		motor_open=0;
	BCF        PORTC+0, 0
;CODE_DOOR.c,24 :: 		}
L_main6:
;CODE_DOOR.c,25 :: 		if(exit_sensor==1 && entry_sensor==0){       //check if the passanger in the exit and non one in the entry
	BTFSS      PORTB+0, 2
	GOTO       L_main12
	BTFSC      PORTB+0, 1
	GOTO       L_main12
L__main15:
;CODE_DOOR.c,26 :: 		motor_open=0;
	BCF        PORTC+0, 0
;CODE_DOOR.c,27 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
;CODE_DOOR.c,28 :: 		motor_close=1;                    //close the door
	BSF        PORTC+0, 1
;CODE_DOOR.c,30 :: 		}
L_main12:
;CODE_DOOR.c,31 :: 		if(close_end==1){
	BTFSS      PORTB+0, 4
	GOTO       L_main14
;CODE_DOOR.c,32 :: 		motor_close=0;
	BCF        PORTC+0, 1
;CODE_DOOR.c,33 :: 		}
L_main14:
;CODE_DOOR.c,35 :: 		}
	GOTO       L_main4
;CODE_DOOR.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
