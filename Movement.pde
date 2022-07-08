final float SPEEDX = 3;
final float SPEEDY = 2;

boolean[] verticalKeys = new boolean[2];

boolean goesBelow = false;
boolean hitSide = false;

void setGoesBelow(boolean bool){
  goesBelow = bool;
}

void setVerticalDirection(int keyCode){
  if(keyCode == UP && hitSide){
    goesBelow = false;
  }
  else if(keyCode == DOWN && hitSide){
    goesBelow = true;
  }
}

void movePlayerVertical(){
  if(!goesBelow && playerY + SPEEDY >= getSurfaceY()){
    //playerY -= SPEEDY;
    setPlayerCoords(getPlayerX(), getPlayerY() - SPEEDY);
    hitSide = false;
  }
  else if(goesBelow && playerY + SPEEDY <= getGroundY() - PLAYERSIZE/2){
    //playerY += SPEEDY;
    setPlayerCoords(getPlayerX(), getPlayerY() + SPEEDY);
    hitSide = false;
  }
  
  //so it know it has hit the surface or ground
  if(playerY <= getSurfaceY() + SPEEDY || playerY >= getGroundY() - PLAYERSIZE/2 - SPEEDY){
   hitSide = true; 
  }
}

void movePlayerHorizontal(){
  if(verticalKeys[0] && playerX + SPEEDX <= width-PLAYERSIZE/2){
    //playerX += SPEEDX
    setPlayerCoords(getPlayerX() + SPEEDX, getPlayerY());
  }
  else if(verticalKeys[1] && playerX - SPEEDX >= PLAYERSIZE/2){
    //playerX -= SPEEDX
    setPlayerCoords(getPlayerX() - SPEEDX, getPlayerY());
  }
}
