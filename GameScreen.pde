final int EMPTY = 0;
final int PLAYER = 1;
final int OXYGEN = 2;
final int MINE = 3;
final int COIN = 4;

//makes movement more smooth
void keyPressed(){
  
  if(keyCode==RIGHT)
    verticalKeys[0]=true;
    
  if(keyCode==LEFT)
    verticalKeys[1]=true;
}

//makes movement more smooth
void keyReleased()
{
  
  if(keyCode==RIGHT)
    verticalKeys[0]=false;
  if(keyCode==LEFT)
    verticalKeys[1]=false;
    
    //Grab butten, so it can't be spammed/hold on
  if(keyCode == ENTER && isOnItem(OXYGEN)){
    setRemoved(getOnItem(OXYGEN), true);
    restoreOxygen();
  }
  
  if(keyCode == ENTER && isOnItem(COIN)){
    setRemoved(getOnItem(COIN), true);
    addPoints();
  }
} 

//setting up some default variables
void setVars(){
  setSurfaceY(height/5.0);
  setGroundY(height/10.0*9.0);
  setGridVars();
  fillItems();
  createEmptyGrid();
  createAllItemsPositions();
}

void createAllItemsPositions(){
  createItemsPositions(OXYGEN, itemPositions);
  createItemsPositions(MINE, itemPositions);
  createItemsPositions(COIN, itemPositions); 
}

void drawGameScreen(){
  background(#87ceeb);
  stroke(0);
  drawSurface();
  drawGround();
  drawPlayer();
  drawOxygenBar(int(getPlayerX() - getPlayerSize()/2), int(getPlayerY() - getPlayerSize()));
  drawItems();
  //drawGrid(); //This is for testing if the grid works
  
  fill(0);
  textAlign(CENTER);
  textSize(32);
  text("Lives: "+getLives(),width/2,40);
  text("Score: "+getScore(),width/2,80);
}

void checkDeaths(){
  if(isOnItem(MINE)){
    setRemoved(getOnItem(MINE), true);
    death();
    spawnPlayer();
  }
  
  if (isOxygenDepleted()) {
    death();
    spawnPlayer();
  }
}

void oxygenBarCalculation(){
  

  //oxygen only deplets below sea surface
  if (getPlayerY() > getSurfaceY() + getPlayerSize()/2) {
    setCurrentTime(millis()/1000.0);
    subtractOxygenTime(getCurrentTime() - getPreviousTime());
    setPreviousTime(getCurrentTime());
  } 
  
  else {
    setPreviousTime(millis()/1000.0);
  }
}

void verticalMovement(){
 movePlayerVertical();
  if(keyPressed){
    setVerticalDirection(keyCode);
    movePlayerHorizontal();
  } 
}

boolean AreAllCoinsCollected(){
  boolean AllCoinsCollected = true;
  boolean[] collectedCoins = getCollectedCoins();
  for(int i = 0; i < collectedCoins.length; i++){
    if(collectedCoins[i] == false){
      AllCoinsCollected = false;
      break;
    }
  }
  return AllCoinsCollected;
}

void createNewSea(){
  setRemovedItems(false);
  createEmptyGrid();
  createAllItemsPositions();
  spawnPlayer();
}

void resetScore(){
  score = 0;
}

void resetLives(){
  lives = 3;
}
