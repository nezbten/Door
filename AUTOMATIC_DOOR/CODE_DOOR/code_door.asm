
_main:

;CODE_DOOR.c,16 :: 		void main() {
;CODE_DOOR.c,17 :: 		trisc=0; portc=0 ;            //define portc as output
	CLRF       TRISC+0
	CLRF       PORTC+0
;CODE_DOOR.c,18 :: 		trisb=0x11; portb=0;    //define ports B0 to B4 as input
	MOVLW      17
	MOVWF      TRISB+0
	CLRF       PORTB+0
;CODE_DOOR.c,83 :: 		trisc=0; portc=0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;CODE_DOOR.c,84 :: 		trisb=0b00000011; portb=0;
	MOVLW      3
	MOVWF      TRISB+0
	CLRF       PORTB+0
;CODE_DOOR.c,85 :: 		loop :
___main_loop:
;CODE_DOOR.c,86 :: 		if(inside_switch==0||outside_switch==0){
	BTFSS      PORTB+0, 0
	GOTO       L__main12
	BTFSS      PORTB+0, 1
	GOTO       L__main12
	GOTO       L_main2
L__main12:
;CODE_DOOR.c,87 :: 		garage_open=1;               //motor open garage
	BSF        PORTC+0, 0
;CODE_DOOR.c,88 :: 		for(i=0;i<20;i++){          //green led flash 20 s
	CLRF       _i+0
L_main3:
	MOVLW      20
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;CODE_DOOR.c,89 :: 		led_green = ~led_green;
	MOVLW      8
	XORWF      PORTC+0, 1
;CODE_DOOR.c,90 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;CODE_DOOR.c,88 :: 		for(i=0;i<20;i++){          //green led flash 20 s
	INCF       _i+0, 1
;CODE_DOOR.c,91 :: 		}
	GOTO       L_main3
L_main4:
;CODE_DOOR.c,92 :: 		garage_open=0;
	BCF        PORTC+0, 0
;CODE_DOOR.c,93 :: 		led_green=1;                 //green led on
	BSF        PORTC+0, 3
;CODE_DOOR.c,94 :: 		led_red=1;                   //red led on
	BSF        PORTC+0, 2
;CODE_DOOR.c,95 :: 		delay_ms(30000);            //wait 30 s
	MOVLW      2
	MOVWF      R10+0
	MOVLW      49
	MOVWF      R11+0
	MOVLW      98
	MOVWF      R12+0
	MOVLW      69
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	DECFSZ     R10+0, 1
	GOTO       L_main7
;CODE_DOOR.c,96 :: 		garage_close=1;             //motor close garage
	BSF        PORTC+0, 1
;CODE_DOOR.c,97 :: 		led_green=0;                 //green led off
	BCF        PORTC+0, 3
;CODE_DOOR.c,98 :: 		for(i=0;i<20;i++){     //red led flash for 20s
	CLRF       _i+0
L_main8:
	MOVLW      20
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;CODE_DOOR.c,99 :: 		led_red = ~led_red;
	MOVLW      4
	XORWF      PORTC+0, 1
;CODE_DOOR.c,100 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
	NOP
;CODE_DOOR.c,98 :: 		for(i=0;i<20;i++){     //red led flash for 20s
	INCF       _i+0, 1
;CODE_DOOR.c,101 :: 		}
	GOTO       L_main8
L_main9:
;CODE_DOOR.c,102 :: 		garage_close=0;     //motor stop closing
	BCF        PORTC+0, 1
;CODE_DOOR.c,103 :: 		led_red=0; //red led off
	BCF        PORTC+0, 2
;CODE_DOOR.c,105 :: 		}
L_main2:
;CODE_DOOR.c,106 :: 		goto loop;
	GOTO       ___main_loop
;CODE_DOOR.c,108 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
