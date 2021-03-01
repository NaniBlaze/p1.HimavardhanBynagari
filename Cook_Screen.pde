
int h=0;
int m=0;
int s=0;

int startTime = 0, stopTime = 0;
  boolean running = false;  

String value= "";

void Screen2(){
  /// Cooking Time ///
  fill(0);
  textSize(30);
  textAlign(CENTER);
  text (nf(h,2) + ":" + nf(m, 2) + ":" + nf(s, 2),840, 300);
  
  /// Number Pad ///
  Numberpad();

  /// Start Button ///
  rect(770,315,33,20);
  fill(200);
  textSize(10); 
  text ("Start",786, 328);
  text ("Start",786, 328);
  
  /// Cancle Button ///
  fill(0);
  rect(870,315,33,20);
  fill(200);
  textSize(9); 
  text ("Cancle",887, 328);
  text ("Cancle",887, 328);
  
 /// Clear Button ///
  fill(0);
  rect(870,417,33,20);
  fill(200);
  textSize(9); 
  text ("Clear",887, 430);
  text ("Clear",887, 430);
}


void Numberpad(){
  fill(0);
  rect(830,410,15,15);  //0
  rect(810,390,15,15);  //1 
  rect(830,390,15,15);  //2
  rect(850,390,15,15);  //3 
  rect(810,370,15,15);  //4
  rect(830,370,15,15);  //5     
  rect(850,370,15,15);  //6 
  rect(810,350,15,15);  //7
  rect(830,350,15,15);  //8 
  rect(850,350,15,15);  //9 
  
  fill(200);
  textSize(12);
  text("0", 838, 422);
  text("0", 838, 422);

  fill(200);
  textSize(12);
  text("1", 818, 402);
  text("1", 818, 402);

  fill(200);
  textSize(12);
  text("2", 838, 402);
  text("2", 838, 402);
  
  fill(200);
  textSize(12);
  text("3", 858, 402);
  text("3", 858, 402);
  
  fill(200);
  textSize(12);
  text("4", 818, 382);
  text("4", 818, 382);
  
  fill(200);
  textSize(12);
  text("5", 838, 382);
  text("5", 838, 382);
  
  fill(200);
  textSize(12);
  text("6", 858, 382);
  text("6", 858, 382);
  
  fill(200);
  textSize(12);
  text("7", 818, 362);
  text("7", 818, 362);
  
  fill(200);
  textSize(12);
  text("8", 838, 362);
  text("8", 838, 362);
  
  fill(200);
  textSize(12);
  text("9", 858, 362);
  text("9", 858, 362);
  
  fill(0);
}

void Start(){
  println("Start");
  
  println(door);
  println(cookingStarted);
  if((door=="CLOSED" && cookingStarted==1) || timerPage==1){
  println("Inside 1st if");
    doorError=0;
  screen=3;
  
  complete=false; 
  Percentage="0 %"+ " Completed";
  noStroke();  
  timer = new Timer(this,"onTimerTick","onTimerComplete");  
  timer.reset(((h*3600)+(m*60)+s)*1000,1000);  
  }
  else{
  println("inside else");
  
    screen=2;
   // cookingStarted=0;  
    doorError=1;
    
    
  }
  
 //  fill(0, 75, 0);
 //rect(275, 200,700, 300);
  
}

void Clear(){
  value="";
  h=0;
  m=0;
  s=0;
}

void Cancel(){
  screen=1;
  value="";
  h=0;
  m=0;
  s=0;
  
}
