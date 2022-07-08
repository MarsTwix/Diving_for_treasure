final int PIXELSBETWEEN = 75;

int amountOxygenTanks;
int amountMines;
int amountCoins;

int totalItems;

float[][] itemPositions;
boolean[] itemRemoved;
int[] item;

float surfaceY;
float groundY;

void drawSurface(){
  fill(#0000ff);
  strokeWeight(0);
  rect(0, surfaceY, width, height-surfaceY);
}

void drawGround(){
  fill(#f4a460);
  strokeWeight(0);
  rect(0, groundY, width, height-groundY);
}

void setSurfaceY(float y){
  surfaceY = y;
}

float getSurfaceY(){
  return surfaceY; 
}

void setGroundY(float y){
  groundY = y;
}

float getGroundY(){
  return groundY; 
}

void fillItems(){
  for(int i = 0; i < amountOxygenTanks; i++){
    item[i] = OXYGEN;
  }
  for(int i = amountOxygenTanks; i < amountOxygenTanks + amountMines; i++){
    item[i] = MINE;
  }
  for(int i = amountOxygenTanks + amountMines; i < totalItems; i++){
    item[i] = COIN;
  }
}

void createItemsPositions(int item, float[][] itemPositions){
  float x;
  float y;
  
  int minItem = getMinItem(item);
  int maxItem = getMaxItem(item);
  
  for(int i = minItem; i < maxItem; i++){
    boolean badPos = true;
    
    //make new random positions until every item is far enough
    while(badPos){
      badPos = false;
      x = random(getPlayerSize()/2, width - getPlayerSize()*1.5);
      //between surface and ground 
      y = random(getSurfaceY()+getPlayerSize()*1.5,getGroundY() - getPlayerSize()*1.5);
      
      for(int j = 0; j < i; j++){
        if( dist(x, y, itemPositions[j][0], itemPositions[j][1]) <= PIXELSBETWEEN){
          badPos = true;
          break;
        }
      }
      if(!badPos){
        int xArrayPos = int( x / pixelWidthPerIndex ); 
        int yArrayPos = int( ( y - getSurfaceY() ) / pixelHeightPerIndex);
        
        setGrid(item, xArrayPos, yArrayPos);
        
        x = xArrayPos*getPixelWidthPerIndex() + getPixelWidthPerIndex()*0.5;
        y = yArrayPos*getPixelHeightPerIndex() + getPixelHeightPerIndex()*0.5 + getSurfaceY();
        
        itemPositions[i][0] = x;
        itemPositions[i][1] = y;
      }
    }
  }
}

void drawItems(){
  strokeWeight(1);
  for(int i = 0; i < totalItems; i++){
    if(!itemRemoved[i] && itemPositions[i][1] != 0){
      if(item[i] == OXYGEN){
        fill(#ADD8E6);
      }
      else if(item[i] == MINE){
        fill(0);
      }
      else if(item[i] == COIN){
        fill(#FFFF00);
      }
      circle(itemPositions[i][0],itemPositions[i][1], getPlayerSize()/2);
    }
  }
}

int getAmountOxygenTanks(){
  return amountOxygenTanks;
}

boolean isOnItem(int item){ 
  boolean onItem = false;
  int minItem = getMinItem(item);
  int maxItem = getMaxItem(item);
  
  
  
  for(int i = minItem; i < maxItem; i++){
    //distance middle of item and middle of player circle
    if( dist(getPlayerX(), getPlayerY(), itemPositions[i][0], itemPositions[i][1]) <= getPlayerSize() && !itemRemoved[i] ){
      onItem = true;
    }
  }
  return onItem;
}

int getOnItem(int item){
  int minItem = getMinItem(item);
  int maxItem = getMaxItem(item);
  
  for(int i = minItem; i < maxItem; i++){
    //distance middle of oxygen and middle of player circle
    if( dist(getPlayerX(), getPlayerY(), itemPositions[i][0], itemPositions[i][1]) <= getPlayerSize() ){
      return i;
    }
  }
  return -1;
}

void setRemoved(int index, boolean bool){
  itemRemoved[index] = bool;
}

int getMinItem(int item){
  int minItem = 0;
  if(item == OXYGEN){
    minItem = 0; 
  }
  else if(item == MINE){
    minItem = amountOxygenTanks; 
  }
  else if(item == COIN){
    minItem = amountOxygenTanks+amountMines;
  }
  return minItem;
}

int getMaxItem(int item){
  int maxItem = 0;
  if(item == OXYGEN){
    maxItem = amountOxygenTanks;
  }
  else if(item == MINE){
    maxItem = amountOxygenTanks+amountMines;
  }
  
  else if(item == COIN){
    maxItem = totalItems;
  }
  return maxItem;
}

boolean[] getCollectedCoins(){
  boolean[] collectedCoins = new boolean[amountCoins];
  int j = 0;
  for(int i = amountOxygenTanks + amountMines; i < totalItems; i++){
    collectedCoins[j] = itemRemoved[i];
    j++;
  }
  return collectedCoins; 
}

void setRemovedItems(boolean bool){
  for(int i = 0; i < totalItems; i++){
    itemRemoved[i] = bool;
  }
}

void setAmountOxygenTanks(int num){
  amountOxygenTanks = num;
}

void setAmountMines(int num){
  amountMines = num;
}
void setAmountCoins(int num){
  amountCoins = num;
}
void setTotalItems(){
  totalItems = amountOxygenTanks + amountMines + amountCoins;
  itemPositions = new float[totalItems][2];
  itemRemoved = new boolean[totalItems];
  item = new int[totalItems];
}
