  
import processing.sound.*;
SoundFile file;
SoundFile Fan;

DigitalClock digitalClock;
int j=1;
int k=1;
int screen=1;
int time;
int sPlay=0;
int wait = 1000;
boolean tick = false;
int PRCooking=0;
String Percentage="0 %"+ " Cooking Completed";
int ventFan=0;
int lights=0;
int lightsPlay=0;
int cookingPage=0;
int timerPage=0;
String door="CLOSED";
int cookingStarted=0;
int doorError=0;
int autoCook=0;
int autoDeforst=0;
int warm=0;
String displayMessage="";

void setup(){
  time = millis();
  size(1200,600);
  digitalClock = new DigitalClock(40, 840, 240);
  timer = new Timer(this,"onTimerTick","onTimerComplete"); 
  Fan = new SoundFile(this, "Vent Fan.wav");
  file = new SoundFile(this, "cooking.wav");
  }

void draw(){   
  
  /// Microwave Design///
  microwaveDesign(); 
 
   /// Microwave Main Screen///
  microwaveMainScreen();

if(screen==2){
  Screen2();
  if(cookingStarted==1){
  displayMessage="Manual Cooking";
  textSize(11);
  }
  if(timerPage==1){
      displayMessage="Timer";
      textSize(15);
  }
  
  fill(128,255,0);
  text(displayMessage, 713, 275,50,50);
  text(displayMessage,713, 275,50,50);
  fill(100);
}

if(screen==1)
{
   Tick();
   
}
if(screen==3){
 
  drawTimer();
  fill(0);
  rect(765, 280,150,30);
  fill(200);
  textSize(11);
  text(Percentage, 765, 290,150,30);
  text(Percentage,765, 290,150,30);
  fill(100);
  
  if(cookingStarted==1 && autoCook==0 && autoDeforst==0 && warm==0){
  displayMessage="Manual Cooking";
  textSize(11);
  }
  else if(timerPage==1&& autoCook==0 && autoDeforst==0 && warm==0){
      displayMessage="Timer";
      textSize(15);
  }
  else{
        displayMessage="";

  }
  
  fill(128,255,0);
  text(displayMessage, 713, 275,50,50);
  text(displayMessage,713, 275,50,50);
  fill(100);
}


 }


void microwaveDesign(){
  if(lights==0){
 
  stroke(0);
  strokeWeight(3);
 rect(275, 200,700, 300);
  strokeWeight(1);
   stroke(0);
  }
  else{
    
    fill (100);
   strokeWeight(3);
   stroke(255,255,77);   
   rect(275, 200,700, 300);
   strokeWeight(1);
   stroke(0);
  }
  
 if(cookingPage==1){
 fill(204,204,0); 
  quad(700, 260, 305, 260, 305, 460, 700, 460);
 }
 else{
   stroke(10);
   fill(100);
 quad(700, 260, 305, 260, 305, 460, 700, 460);
 }
  stroke(126);
  line(700, 200, 700, 500);
  /// Door ///
  fill(0);
  quad(700, 280, 680, 260, 680, 460, 700, 430);
  
  if(door=="OPEN"){
    fill(0,75,0);
  rect(680, 280,20, 150);
  fill(200);
  textSize(20);
  text(door, 680, 295,20,150);
  text(door, 680, 295,20,150);
  }
  else{
    fill(179,48,0);
  rect(680, 280,20, 150);
  fill(200);
  textSize(16.7);
   text(door, 680, 280,18,160);
  text(door, 680, 280,18,160);
  }
  
  if(doorError==1){
  //fill(0);
  //rect(765, 250,150,25);
  textSize(13);
  fill(139,0,0);
  text("Kindly Close The Door", 765, 255,150,28);
  text("Kindly Close The Door",765, 255,150,28);
  fill(0);
  }
  else{
  //fill(100);
  //rect(765, 250,150,25);
  //fill(100);
  //textSize(11);
  //text("Kindly Close The Door", 765, 255,150,28);
  //fill(0);
  
  if(autoCook==1){
  textSize(12);
  fill(128,255,0);
  text("Auto Cook", 715, 275,32,50);
  text("Auto Cook",715, 275,32,50);
  fill(0);
  }
   else if(autoDeforst==1){
  textSize(10);
   fill(128,255,0);
  text("Auto Deforst", 715, 275,37,50);
  text("Auto Deforst",715, 275,37,50);
  fill(0);
  }
    else if(warm==1){
  textSize(13); 
  fill(128,255,0);
  text("Warm", 715, 285,37,50);
  text("Warm",715, 285,37,50);
  fill(0);
  }
  
  }
  /// Borders ///
   strokeWeight(3);
   line(750,340,750,450);
   line(920,340,920,450);
   line(750,450,920,450);
   strokeWeight(1);  
   
  ///Clock///
  fill(0);
  digitalClock.getTime();
  digitalClock.display();

}
void microwaveMainScreen(){
   
  if(screen==1){
  ///Cook///
  fill(0);
  rect(780,287,120,40);
  fill(200);
  textSize(32);
  text("Cook", 840, 320);
  fill(100);
  
 /// Auto Cooking options ///  
  
 
  fill(0);
  ellipse(725, 360,40, 30);
  fill(200);
  textSize(9);
  text("Auto Cook", 711, 348,30,30);
  text("Auto Cook", 711, 348,30,30);

  fill(0);
  ellipse(725, 395,43, 30);
  fill(200);
  textSize(9);
  text("Auto Deforst", 707, 382,40,30);
  text("Auto Deforst", 707, 382,40,30);
  
  fill(0);
  ellipse(725, 430,40, 30);
  fill(200);
  textSize(9);
  text("Warm", 711, 425,30,30);
  text("Warm", 711, 425,30,30);
  
  }

     /// Clock Settings ///
   
   fill(0);
  ellipse(950, 360,40, 30);
  fill(200);
  textSize(9);
  text("Timer", 935, 353,30,30);
  text("Timer", 935, 353,30,30);
   
   /// Fan Options ///
  if(ventFan==0){
   fill(0);
  ellipse(790, 470,60, 30);
  fill(200);
  textSize(9);
  text("Vent Fan", 777, 460,30,30);
  text("Vent Fan", 777, 460,30,30);
  Fan.stop();
  sPlay=0;
  }
  if(ventFan==1){
   fill(0, 75, 0);
  ellipse(790, 470,60, 30);
  fill(200);
  textSize(9);
  text("Vent Fan", 777, 460,30,30);
  text("Vent Fan", 777, 460,30,30);
  if(sPlay==0){
    sPlay=1;
    Fan.play();
  }
  }
  
   /// Light Options ///
  if(lights==0){
  fill(0);
  ellipse(880, 470,60, 30);
  fill(200);
  textSize(9);
  text("Lights", 865, 465,30,30);
  text("Lights", 865, 465,30,30);
  }
  if(lights==1){
   fill(0, 75, 0);
  ellipse(880, 470,60, 30);
  fill(200);
  textSize(9);
  text("Lights", 865, 465,30,30);
  text("Lights", 865, 465,30,30);
  }
}

void mousePressed(){
  
  /// Open/Close Door ///
  //quad(700, 280, 680, 260, 680, 460, 700, 430);
  
   if(mouseY<(430)&& mouseY>280 && mouseX<(700)&&mouseX>680){    
     
     if(screen==3){
     if(door=="CLOSED"){
       door="OPEN";
       if(PRCooking==0 && cookingStarted==1){
       timer.pause();     
       PRCooking=1;
       }
     }
     else{       
       door="CLOSED";
       println("*********"+PRCooking+"******"+cookingStarted);
        if (PRCooking==1 && cookingStarted==1){     
       timer.resume();
        PRCooking=0;
        }
     }
     }
     else{
     if(door=="CLOSED"){
       door="OPEN";
       if(PRCooking==0 && doorError==2){
       timer.pause();     
       PRCooking=1;
       }
     }
     else{       
       door="CLOSED";
       println("*********"+PRCooking+"******"+cookingStarted);
        if (PRCooking==1 && doorError==2){     
       timer.resume();
        PRCooking=0;
        }
     }
     }
     
     
      
    } 
    
  /// Fan Click ///
   if(dist(mouseX,mouseY,790,470)<25){
     if(ventFan==0){
      ventFan=1;
     }
     else{
     ventFan=0;
     }
    }
    
    /// Lights Click ///
    if(dist(mouseX,mouseY,880,470)<25){
     if(lights==0){
      lights=1;
     }
     else{
     lights=0;
     }
    } 
    /// Timer Click ///
    if(dist(mouseX,mouseY,950, 360)<18){
      screen=2; 
      Clear();  
      timerPage=1;
      cookingPage=0;
      autoCook=0;
      autoDeforst=0;
      warm=0;
    }
    
  
  if(screen==1){    
    
    ///Cook CLICK///
    if(mouseY<(287+40)&& mouseY>287 && mouseX<(780+120)&&mouseX>780){
      screen=2;
      cookingStarted=1;
      
      
    } 
    /// Auto Cook Click /// 
    if(dist(mouseX,mouseY,725, 360)<18){   
      if(door=="CLOSED"){
        doorError=0;
        autoCook=1;
        cookingStarted=1;
       cookingPage=1;
       timerPage=0;
       screen=3;
       complete=false; 
        Percentage="0 %"+ " Completed";
      noStroke();  
      timer = new Timer(this,"onTimerTick","onTimerComplete");  
      timer.reset(120*1000,1000);  
  textSize(13);
  fill(139,0,0);
  text("Auto Cook", 765, 255,150,28);
  text("Auto Cook",765, 255,150,28);
  fill(0);
      }
       else{
        screen=1;
    cookingStarted=0;
      doorError=1;
      }
    }
     /// Auto Deforst Click /// 
    if(dist(mouseX,mouseY,725, 395)<18){
      if(door=="CLOSED"){
        doorError=0;
                cookingStarted=1;
 autoDeforst=1;
      
      cookingPage=1;
       timerPage=0;
      screen=3;
       complete=false; 
      Percentage="0 %"+ " Completed";
      noStroke();  
      timer = new Timer(this,"onTimerTick","onTimerComplete");  
      timer.reset(30*60*1000,1000);   
      }
      else{
        screen=1;
    cookingStarted=0;
      doorError=1;
      }
    } 
    /// Warm Click /// 
    if(dist(mouseX,mouseY,725, 430)<18){
      if(door=="CLOSED"){
        doorError=0;
                cookingStarted=1;

      warm=1;
      cookingPage=1;
       timerPage=0;
      screen=3;
       complete=false; 
      Percentage="0 %"+ " Completed";
      noStroke();  
      timer = new Timer(this,"onTimerTick","onTimerComplete");  
      timer.reset(30*1000,1000);
    }
       else{
        screen=1;
    cookingStarted=0;
      doorError=1;
      }
    }
    
    
  }
  if(screen==2){
    
    /// Number key click ///
    
    if(mouseY<(410+15)&& mouseY>410 && mouseX<(830+15)&&mouseX>830){
    value+=0;
    }
    if(mouseY<(390+15)&& mouseY>390 && mouseX<(810+15)&&mouseX>810){
    value+=1;
    }
    if(mouseY<(390+15)&& mouseY>390 && mouseX<(830+15)&&mouseX>830){
    value+=2;
    }
    if(mouseY<(390+15)&& mouseY>390 && mouseX<(850+15)&&mouseX>850){
    value+=3;
    }
    if(mouseY<(370+15)&& mouseY>370 && mouseX<(810+15)&&mouseX>810){
     value+=4;
    }
    if(mouseY<(370+15)&& mouseY>370 && mouseX<(830+15)&&mouseX>830){
     value+=5;
    }
    if(mouseY<(370+15)&& mouseY>370 && mouseX<(850+15)&&mouseX>850){
     value+=6;
    }
    if(mouseY<(350+15)&& mouseY>350 && mouseX<(810+15)&&mouseX>810){
     value+=7;
    }
    if(mouseY<(350+15)&& mouseY>350 && mouseX<(830+15)&&mouseX>830){
     value+=8;
    }
    if(mouseY<(350+15)&& mouseY>350 && mouseX<(850+15)&&mouseX>850){
     value+=9;
    }
    if(value!=""){
     String _value="";
     if(value.length()<=6){
      
      String _zeroValue="";
      for (int i=0;i<6-value.length();i++){
        _zeroValue+=0;
      }
       _value =_zeroValue+value;
       println(_value);
    }
    else if (value.length()>6){
      _value=value.substring(value.length()-6,value.length());
      println(">7 value");
      print(_value);    
    }
    
    h=Integer.parseInt(_value.substring(0,2));
    m=Integer.parseInt(_value.substring(2,4));
    s=Integer.parseInt(_value.substring(4,6));
    
  }
    
    /// Cancle click ///
   if(mouseY<(315+20)&& mouseY>315 && mouseX<(870+33)&&mouseX>870){
    Cancel();
    doorError=0;
    cookingPage=0;
    timerPage=0;
    cookingStarted=0;
    
    }
    
     /// Clear click ///
   if(mouseY<(417+20)&& mouseY>417 && mouseX<(870+33)&&mouseX>870){
    Clear();
    }
    
    /// Start Click  ///
    if(mouseY<(315+20)&& mouseY>315 && mouseX<(770+33)&&mouseX>770){
    Start();    
    if(timerPage==1 || doorError==1 ){    
      cookingPage=0;    
    }
    else{
          cookingPage=1;
        }
    
    }
  }  
  
  if(screen==3){
      /// Stop Cooking Click  ///
    if(mouseY<(424+30)&& mouseY>424 && mouseX<(863+40)&&mouseX>863){
      timer.cancel();
      screen=1;
      doorError=0;
      cookingStarted=0;
      autoCook=0;
      autoDeforst=0;
      warm=0;
      print("============================="+cookingStarted);
      file.stop();
      
    }
     /// Pause/Resume cooking Click  ///
    if(mouseY<(420+30)&& mouseY>420 && mouseX<(763+40)&&mouseX>763){      
      if(PRCooking==0){
        timer.pause();
        PRCooking=1;
      }
      else{
      timer.resume();
      PRCooking=0;
      }
      
      
    }
  }
  
    
}

void Tick(){
 if(millis() - time >= wait)
  {
    tick = !tick;
    time = millis();
  }
  strokeWeight(4);
  stroke(15);
  line(840,350,tick ? 800 : 880,420);
  fill(100);
  strokeWeight(1);

}
