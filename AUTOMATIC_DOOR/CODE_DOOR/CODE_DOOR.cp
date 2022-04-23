#line 1 "C:/Users/pc/Desktop/door/AUTOMATIC_DOOR/CODE_DOOR/CODE_DOOR.c"









void main() {
trisc=0; portc=0 ;
trisb=0b00011111; portb=0;

while( portb.b4  == 0)  portc.b1 =1;
 portc.b1 =0;
while( portb.b0  ==0);
while(1){
if( portb.b1 ==1){
  portc.b1 =0;
 delay_ms(500);
  portc.b0 =1;
 while( portb.b3 ==0);
  portc.b0 =0;
}
if( portb.b2 ==1 &&  portb.b1 ==0){
 portc.b0 =0;
delay_ms(500);
 portc.b1 =1;

}
if( portb.b4 ==1){
 portc.b1 =0;
}

}

}
