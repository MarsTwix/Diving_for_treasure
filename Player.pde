final float PLAYERSIZE = 50;

int lives = 3;
int score = 0;

float playerX;
float playerY;

void drawPlayer(){
  strokeWeight(5);
  fill(#ffffff);
  circle(playerX, playerY, PLAYERSIZE);
}

void spawnPlayer(){
  setPlayerCoords(width/2, int(getSurfaceY()));
  setGoesBelow(false);
  restoreOxygen();
}

void death(){
  lives--;
  if(lives == 0){
    setScreen(ENDSCREEN);
  }
}

void setPlayerCoords(float x, float y){
  playerX = x;
  playerY = y;
}

float getPlayerX(){
  return playerX; 
}

float getPlayerY(){
  return playerY; 
}

float getPlayerSize(){
  return PLAYERSIZE; 
}

void subtractLives(){
  lives--;
}

int getLives(){
  return lives;
}

void addPoints(){
  score += 50;
}

int getScore(){
  return score; 
}
