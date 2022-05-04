#line 1 "C:/Users/pc/Desktop/door/AUTOMATIC_DOOR/CODE_DOOR/CODE_DOOR.c"
#line 15 "C:/Users/pc/Desktop/door/AUTOMATIC_DOOR/CODE_DOOR/CODE_DOOR.c"
 unsigned char i;
void main() {
trisc=0; portc=0 ;
trisb=0x11; portb=0;
#line 83 "C:/Users/pc/Desktop/door/AUTOMATIC_DOOR/CODE_DOOR/CODE_DOOR.c"
 trisc=0; portc=0;
 trisb=0b00000011; portb=0;
 loop :
 if( portb.b0 ==0|| portb.b1 ==0){
  portc.b0 =1;
 for(i=0;i<20;i++){
  portc.b3  = ~ portc.b3 ;
 delay_ms(1000);
 }
  portc.b0 =0;
  portc.b3 =1;
  portc.b2 =1;
 delay_ms(30000);
  portc.b1 =1;
  portc.b3 =0;
 for(i=0;i<20;i++){
  portc.b2  = ~ portc.b2 ;
 delay_ms(1000);
 }
  portc.b1 =0;
  portc.b2 =0;

 }
 goto loop;

 }
