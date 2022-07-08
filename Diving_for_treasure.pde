final int STARTSCREEN = 0;
final int GAMESCREEN = 1;
final int ENDSCREEN = 2;

int currentScreen = STARTSCREEN;

void setup() {
  size(1920, 1080);
  //fullScreen();
  
}

void draw() {
  if(currentScreen == STARTSCREEN){
    drawStartScreen();
  }
  
  else if(currentScreen == GAMESCREEN){
    updateGrid();
    
    if(AreAllCoinsCollected()){
      createNewSea();
    }
    
    drawGameScreen();
    
    checkDeaths();
  
    oxygenBarCalculation();
    
    verticalMovement();
  }
  
  else if(currentScreen == ENDSCREEN){
    drawEndScreen();
    checkClickedStart();
  }
  
}

void mouseClicked(){
  if(currentScreen == STARTSCREEN){
    checkClickedBox();
    checkClickedStart();
  }
  
  //start over button
  else if(mouseX >=  width/2 - getRectHeightEnd() && mouseX <= width/2 + getRectHeightEnd() && mouseY >= height - getRectHeightEnd() && currentScreen == ENDSCREEN){
    resetScore();
    resetLives();
    setScreen(GAMESCREEN);
    createNewSea();
  }
}

void setScreen(int screen){
  currentScreen = screen;
}
