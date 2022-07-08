float surfaceHeight;
float groundHeight;
float seaHeight;

float pixelWidthPerIndex;
float pixelHeightPerIndex;
  
int[][] grid = new int[40][60];

void setGridVars(){
  surfaceHeight = getSurfaceY();
  groundHeight = height - getGroundY();
  seaHeight = height - surfaceHeight - groundHeight;

  pixelWidthPerIndex = width / 60.0;
  pixelHeightPerIndex = seaHeight / 40;
}

void createEmptyGrid(){
  for(int y = 0; y < grid.length; y++){
    for(int x = 0; x < grid[y].length; x++){
      grid[y][x] = EMPTY; 
    }
  }
}

void drawGrid(){
  noFill();
  stroke(#ffffff);
  for(int y = 0; y < grid.length; y++){
    for(int x = 0; x < grid[y].length; x++){
      rect(pixelWidthPerIndex*x, pixelHeightPerIndex*y+surfaceHeight, pixelWidthPerIndex, pixelHeightPerIndex);
    }
  }
}

void setGrid(int item, int xIndex, int yIndex){
  grid[yIndex][xIndex] = item;
}

void updateGrid(){
  
  int xArrayPos = int( getPlayerX() / pixelWidthPerIndex ); 
  int yArrayPos = int( ( getPlayerY() - getSurfaceY() ) / pixelHeightPerIndex);
  
  grid[yArrayPos][xArrayPos] = PLAYER;
}

float getPixelWidthPerIndex(){
  return pixelWidthPerIndex;
}

float getPixelHeightPerIndex(){
  return pixelHeightPerIndex;
}
