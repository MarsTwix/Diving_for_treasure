final float OXYGENTIME = 15;
final float OXYGENPERPIXEL = getPlayerSize() / OXYGENTIME;

float currentOxygenTime = OXYGENTIME;
float currentTime;
float previousTime;

void drawOxygenBar(int x, int y){
  
  //the black square behind it
  strokeWeight(1);
  fill(0);
  rect(x,y,OXYGENTIME*OXYGENPERPIXEL+1, getPlayerSize()/4+1);
  
  //the lightblue oxygen
  fill(#ADD8E6);
  strokeWeight(0);
  rect(x+1,y+1,currentOxygenTime*OXYGENPERPIXEL, getPlayerSize()/4);
  
  //the timer for oxygen, this is for testing
  //fill(0);
  //textSize(32);
  //textAlign(CENTER);
  //text(nf(currentOxygenTime, 0, 3) + " SEC", width/2, 32);
}

boolean isOxygenDepleted(){
  return currentOxygenTime <= 0; 
}

void setCurrentOxygenTime(float time){
  currentOxygenTime = time; 
}

float getCurrentOxygenTime(){
  return currentOxygenTime; 
}
void subtractOxygenTime(float subtraction){
  currentOxygenTime -= subtraction;
}

void restoreOxygen(){
  currentOxygenTime = OXYGENTIME;
}

void setCurrentTime(float time){
  currentTime = time; 
}

float getCurrentTime(){
  return currentTime;
}

void setPreviousTime(float time){
  previousTime = time; 
}

float getPreviousTime(){
  return previousTime; 
}
