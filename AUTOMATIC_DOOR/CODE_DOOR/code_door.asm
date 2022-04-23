
_main:

;CODE_DOOR.c,10 :: 		void main() {
;CODE_DOOR.c,11 :: 		trisc=0; portc=0 ;            //define portc as output
	CLRF       TRISC+0
	CLRF       PORTC+0
;CODE_DOOR.c,12 :: 		trisb=0x11; portb=0;    //define ports B0 to B4 as input
	MOVLW      17
	MOVWF      TRISB+0
	CLRF       PORTB+0
;CODE_DOOR.c,77 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
