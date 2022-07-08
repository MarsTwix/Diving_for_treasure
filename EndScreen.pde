float rectHeightEnd;

void drawEndScreen(){
  background(175,0,0); //darkred
  
  fill(0);
  textAlign(CENTER);
  textSize(64);
  text("You ran out of lives!\nSCORE: " + getScore(), width/2, height/4);
  
  //Green start over button
  rectHeightEnd = height/4;
  fill(0,255,0);
  rect(width/2 - rectHeightEnd, height - rectHeightEnd, rectHeightEnd*2, rectHeightEnd);
  fill(0);
  textSize(48);
  text("Start Over", width/2 - rectHeightEnd + rectHeightEnd, height - rectHeightEnd + rectHeightEnd/1.7);
}

float getRectHeightEnd(){
  return rectHeightEnd;
}
