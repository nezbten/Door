
_main:

;code_door.c,13 :: 		void main() {
;code_door.c,14 :: 		trisc=0; portc=0 ;            //define portc as output
	CLRF       TRISC+0
	CLRF       PORTC+0
;code_door.c,15 :: 		trisb=0b00011111; portb=0;    //define ports B0 to B4 as input
	MOVLW      31
	MOVWF      TRISB+0
	CLRF       PORTB+0
;code_door.c,17 :: 		while(close_end == 0) motor_close=1; //check if the door is closed ??
L_main0:
	BTFSC      PORTB+0, 4
	GOTO       L_main1
	BSF        PORTC+0, 1
	GOTO       L_main0
L_main1:
;code_door.c,18 :: 		motor_close=0;                     //stop closing
	BCF        PORTC+0, 1
;code_door.c,19 :: 		while(start ==0);                  //waiting start sensor
L_main2:
	BTFSC      PORTB+0, 0
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;code_door.c,20 :: 		while(1){
L_main4:
;code_door.c,21 :: 		if(entry_sensor==1){     //entry sensor sensing
	BTFSS      PORTB+0, 1
	GOTO       L_main6
;code_door.c,22 :: 		motor_close=0;
	BCF        PORTC+0, 1
;code_door.c,23 :: 		delay_ms(500);          //waiting to open motor damage
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
;code_door.c,24 :: 		motor_open=1;    //open door
	BSF        PORTC+0, 0
;code_door.c,25 :: 		while(open_end==0);
L_main8:
	BTFSC      PORTB+0, 3
	GOTO       L_main9
	GOTO       L_main8
L_main9:
;code_door.c,26 :: 		motor_open=0;
	BCF        PORTC+0, 0
;code_door.c,27 :: 		}
L_main6:
;code_door.c,28 :: 		if(exit_sensor==1 && entry_sensor==0){       //check if the passanger in the exit and non one in the entry
	BTFSS      PORTB+0, 2
	GOTO       L_main12
	BTFSC      PORTB+0, 1
	GOTO       L_main12
L__main15:
;code_door.c,29 :: 		motor_open=0;
	BCF        PORTC+0, 0
;code_door.c,30 :: 		delay_ms(500);
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
;code_door.c,31 :: 		motor_close=1;                    //close the door
	BSF        PORTC+0, 1
;code_door.c,33 :: 		}
L_main12:
;code_door.c,34 :: 		if(close_end==1){
	BTFSS      PORTB+0, 4
	GOTO       L_main14
;code_door.c,35 :: 		motor_close=0;
	BCF        PORTC+0, 1
;code_door.c,36 :: 		}
L_main14:
;code_door.c,38 :: 		}
	GOTO       L_main4
;code_door.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
