float rectHeightStart;
float boxWidth;
float boxHeight;
boolean isInBoxWidth;
boolean[][] selectedBox = {
  {true, false, false, false ,false},
  {true, false, false, false ,false},
  {true, false, false, false ,false},
};

void drawStartScreen(){
  background(0,0,255);
  
  rectHeightStart = height/6;
  fill(0,255,0);
  rect(width/2 - rectHeightStart, height - rectHeightStart, rectHeightStart*2, rectHeightStart);
  fill(0);
  textSize(64);
  textAlign(CENTER);
  text("Start", width/2 - rectHeightStart + rectHeightStart, height - rectHeightStart + rectHeightStart/1.7);
  
  boxWidth = (width - 100 - textWidth("Oxygentanks: ")) / 5;
  boxHeight = (height - rectHeightStart*2) / 5;
  drawSelectableBoxes();
  
}

void drawSelectableBoxes(){
  //textSize
  for(int y = 0; y < 3; y++){
    textAlign(LEFT);
    fill(0);
    if(y==0){
      text("Oxygentanks: ", 50, boxHeight*y+50*y+rectHeightStart+boxHeight/2);
    }
    else if(y==1){
      text("Mines: ", 50, boxHeight*y+50*y+rectHeightStart+boxHeight/2);
    }
    else if(y==2){
      text("Coins: ", 50, boxHeight*y+50*y+rectHeightStart+boxHeight/2);
    }
    for(int x = 0; x < 5; x++){
      fill(#696969);
      strokeWeight(10);
      if(selectedBox[y][x]){
        stroke(0,255,0);
      }
      else{
        stroke(0);
      }
      rect(boxWidth*x + 50 + textWidth("Oxygentanks: ") + 9*x, boxHeight*y+50*y+rectHeightStart, boxWidth, boxHeight);
      
      textAlign(CENTER);
      fill(0);
      if(y==0){
        text(2*(x+1), boxWidth*x + 50 + textWidth("Oxygentanks: ")+boxWidth/2 + 9*x, boxHeight*y+50*y+rectHeightStart+boxHeight/1.7);
      }
      else if(y==1){
        text(5*(x+1), boxWidth*x + 50 + textWidth("Oxygentanks: ")+boxWidth/2 + 9*x, boxHeight*y+50*y+rectHeightStart+boxHeight/1.7);
      }
      else if(y==2){
        text(10*(x+1), boxWidth*x + 50 + textWidth("Oxygentanks: ")+boxWidth/2 + 9*x, boxHeight*y+50*y+rectHeightStart+boxHeight/1.7);
      }
    }
  }
}

int getBoxXArray(float x){
  float leftWidth = 50.0 + textWidth("Oxygentanks: ");
  float rightWidth = 9*4;
  float pixelPerXIndex = ( width - leftWidth - rightWidth) / 5;
  return int((x - leftWidth) / pixelPerXIndex);
}

void checkClickedBox(){
  isInBoxWidth = mouseX >= 50 + textWidth("Oxygentanks: ") && mouseX <= 50 + textWidth("Oxygentanks: ") + boxWidth*5;
  if(isInBoxWidth && mouseY >= rectHeightStart && mouseY <= rectHeightStart+boxHeight){
    selectBox(mouseX, 0);
  }
  else if(isInBoxWidth && mouseY >= boxHeight+50+rectHeightStart && mouseY <= boxHeight+50+rectHeightStart+boxHeight){
    selectBox(mouseX, 1);
  }
  else if(isInBoxWidth && mouseY >= boxHeight*2+50*2+rectHeightStart && mouseY <= boxHeight*2+50*2+rectHeightStart+boxHeight){
    selectBox(mouseX, 2);
  }
}

void selectBox(float x, int yIndex){
  int xIndex = getBoxXArray(x);
  resetSelectedBoxX(yIndex);
  selectedBox[yIndex][xIndex] = true; //<>//
}

void resetSelectedBoxX(int yIndex){
  for(int x = 0; x < selectedBox[yIndex].length; x++){
    selectedBox[yIndex][x] = false;
  }
}

void checkClickedStart(){
  println(mouseX >=  width/2 - rectHeightStart && mouseX <= width/2 + rectHeightStart && mouseY >= height - rectHeightStart && currentScreen == STARTSCREEN);
  if(mouseX >=  width/2 - rectHeightStart && mouseX <= width/2 + rectHeightStart && mouseY >= height - rectHeightStart && currentScreen == STARTSCREEN){
    
    for(int i = 0; i < 5; i++){
      if(selectedBox[0][i]){
        setAmountOxygenTanks((i+1)*2);
      }
    }
    for(int i = 0; i < 5; i++){
      if(selectedBox[0][i]){
        setAmountMines((i+1)*5);
      }
    }
    for(int i = 0; i < 5; i++){
      if(selectedBox[0][i]){
        setAmountCoins((i+1)*10);
      }
    }
    setTotalItems();
    setVars();
    spawnPlayer();
    setScreen(GAMESCREEN); //<>//
  }
}
