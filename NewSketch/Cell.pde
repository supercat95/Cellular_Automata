class Cell {
  int value;
  color cellColor;
  
  int xPos;
  int yPos;
  
  int pixelSize;

  Cell() {
    value = 0;
    cellColor = color(0,0,0);
    pixelSize = 1;
  }
  
  Cell(int newColor) {
    cellColor = newColor;
  }
  //========================================================
  void setValue() {
    value = int(random(2));
  }
  
  int getValue() {
    return value;
  }
  //--------------------------------------------------------
  void assignValueToColor() {
    if (value == 0) { 
      cellColor = color(0,0,0);
    } else {
      cellColor = color(255,255,255);
    }
  }
  
  void drawCell(int xPosition, int yPosition, int increment) {
    xPos = xPosition;
    yPos = yPosition;
    pixelSize = increment;
    
    noStroke();
    fill(cellColor);
    rect(xPos, yPos, pixelSize, pixelSize);
  }
  
} // end of Cell class
