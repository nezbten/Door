
//#define start portb.b0
//#define entry_sensor portb.b1
//#define exit_sensor portb.b2
//#define open_end portb.b3
//#define close_end portb.b4
//#define motor_open portc.b0
//#define motor_close portc.b1
#define inside_switch portb.b0
#define outside_switch portb.b1
#define garage_open portc.b0
#define garage_close portc.b1
#define led_green  portc.b3
#define led_red portc.b2
 unsigned char i;
void main() {
trisc=0; portc=0 ;            //define portc as output
trisb=0x11; portb=0;    //define ports B0 to B4 as input

/*
*********************************SIMPLE OPNENING DOOR***************************************
while(close_end == 0) motor_close=1; //check if the door is closed ??
motor_close=0;                     //stop closing
while(start ==0);                  //waiting start sensor
while(1){
if(entry_sensor==1){     //entry sensor sensing
 motor_close=0;
 delay_ms(500);          //waiting to open motor damage
 motor_open=1;    //open door
 while(open_end==0);
 motor_open=0;
}
if(exit_sensor==1 && entry_sensor==0){       //check if the passanger in the exit and non one in the entry
motor_open=0;
delay_ms(500);
motor_close=1;                    //close the door

}
if(close_end==1){
motor_close=0;
}

} */
//*********************************************************************************
//*********************************************************************************
//******************************COMPLEX DOOR*************************************
/*while(start==0);
while(1){
loop: if(entry_sensor == 1 || exit_sensor == 1 ){
open: motor_open=1;
      while(open_end==0);
      motor_open=0;
      delay_ms(5000);
      motor_close=1;
check: if(close_end == 1 ){
       motor_close=0;
       delay_ms(1000);
  goto loop;
}
if(entry_sensor== 1|| exit_sensor==1){
    motor_close=0;
    delay_ms(1000);
    goto open;

}
goto check;
}


}
*///**************************************************************************************************
//******************************************************************************************************
//********************************** automatic garage***************************************************
 /*  sequence of operation:
 1:garage closed
 2:when switch pressed
 3:dooropening + green lamp flash 20 s
 4:door stop open + all lamps on(30s)
 5:door closing + red lamp flash (20 s)
 same operation when otehr inside switch is pressed
 */

  trisc=0; portc=0;
  trisb=0b00000011; portb=0;
  loop :
  if(inside_switch==0||outside_switch==0){
  garage_open=1;               //motor open garage
  for(i=0;i<20;i++){          //green led flash 20 s
  led_green = ~led_green;
  delay_ms(1000);
  }
  garage_open=0;
  led_green=1;                 //green led on
  led_red=1;                   //red led on
  delay_ms(30000);            //wait 30 s
  garage_close=1;             //motor close garage
  led_green=0;                 //green led off
  for(i=0;i<20;i++){     //red led flash for 20s
  led_red = ~led_red;
  delay_ms(1000);
  }
  garage_close=0;     //motor stop closing
  led_red=0; //red led off
  
  }
  goto loop;
 
 }






