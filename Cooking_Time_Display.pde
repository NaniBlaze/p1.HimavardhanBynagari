Timer timer;
boolean complete=false;

void drawTimer(){  
  pushStyle();  
  fill(0);
  strokeWeight(2);
  ellipse(840, 380,90,90);
  fill(192,0,0);
  noStroke();
  pushMatrix();
  translate(50,50);
  rotate(radians(-90));
  arc(-330, 790, 90, 90, 0, timer.progress * TWO_PI, PIE);
  popMatrix();
  popStyle();
  
  if(timer.progress==1.0){    
  fill(0, 75, 0);
  ellipse(840, 380,90,90);
  }
  
  if(complete==false){
  fill(0);
  rect(763, 420,40,25);
  fill(200);
  textSize(9);
  text("Pause / Resume", 763, 420,40,20);
  text("Pause / Resume", 763, 420,40,30);
  
  fill(0);
  rect(869, 420,40,25);
  fill(200);
  textSize(11);
  text("Stop", 870, 424,40,30);
  text("Stop", 870, 424,40,30);
  }
  else{
  fill(0);
  rect(869, 419,40,28);
  fill(200);
  textSize(8);
  text("Home Screen", 869, 423,40,30);
  text("Home Screen", 869, 423,40,30);
  }
  
}

public void onTimerTick(){
  Percentage=(int)(timer.progress * 100)+" %"+ " Completed";
   
}

public void onTimerComplete(){
  complete=true;
  println("complete");
  
  if(cookingPage==1){
    println("SoUND");
    file = new SoundFile(this, "cooking.wav");
  file.play();
  }
  else{
    file = new SoundFile(this, "timer.wav");
    file.play();
  }
  cookingPage=0;
  
}

import java.lang.reflect.Method;
// utility timer class
class Timer implements Runnable{
  // is the timer still ticking or on hold ?
  boolean isPaused = false;
  // is the thread still running ?
  boolean isRunning = true;

  // how close are we to completion (0.0 = 0 %, 1.0 = 100%)
  float progress = 0.0;
  // a reference to the time in ms since the start of the timer or reset
  long now;
  // default duration
  long duration = 10000;
  // default tick interval
  long tickInterval = 1000;
  // time at pause
  long pauseTime;

  // reference to the main sketch
  PApplet parent;
  // function to call on each tick
  Method onTick;
  // function to call when timer has completed
  Method onComplete;

  Timer(PApplet parent,String onTickFunctionName,String onCompleteFunctionName){
    this.parent = parent;
    // try to store a reference to the tick function based on its name
    try{
      onTick = parent.getClass().getMethod(onTickFunctionName);
    }catch(Exception e){
      e.printStackTrace();
    }

    // try to store a reference to the complete function based on its name
    try{
      onComplete = parent.getClass().getMethod(onCompleteFunctionName);
    }catch(Exception e){
      e.printStackTrace();
    }
    // auto-pause
    isPaused = true;
    // get millis since the start of the program
    now = System.currentTimeMillis();
    // start the thread (processes run())
    new Thread(this).start();
  }

  // start a new stop watch with new settings
  void reset(long newDuration,long newInterval){
    duration = newDuration;
    tickInterval = newInterval;
    now = System.currentTimeMillis();
    progress = 0;
    isPaused = false;
    println("resetting for ",newDuration,"ticking every",newInterval);
  } 

  // cancel an existing timer
  void cancel(){
    isPaused = true;
    progress = 0.0;
    isRunning = false;
    Clear();    
  cookingPage=0;
  timerPage=0;
  }

  void pause(){
    isPaused = true;
    pauseTime = (System.currentTimeMillis() - now); 
   println("----------"+ timerPage );
    if(timerPage==0){
  cookingPage=0;
    }
  }
  void resume(){
    now = System.currentTimeMillis() - pauseTime;
    isPaused = false;
   if(timerPage==0){
  cookingPage=1;
    }  
  }

  public void run(){
    while(isRunning){

      try{
          //sleep per tick interval
          Thread.sleep(tickInterval);
          // if we're still going
          if(!isPaused){
            // get the current millis
            final long millis = System.currentTimeMillis();
            // update how far we're into this duration
            progress = ((millis - now) / (float)duration);  
            if(progress >= 1.0){
              timer.progress=1.0;
            }
            // call the tick function
            if(onTick != null){
              try{
                onTick.invoke(parent);
              }catch(Exception e){
                e.printStackTrace();
              }
            }
            // if we've made, pause the timer and call on complete
            if(progress >= 1.0){
             
              isPaused = true;
              // call on complete
              if(onComplete != null){
              try{
                  onComplete.invoke(parent);
                }catch(Exception e){
                  e.printStackTrace();
                }
              }
            }
          }
        }catch(InterruptedException e){
          println(e.getMessage());
        }
      }
    }

}
