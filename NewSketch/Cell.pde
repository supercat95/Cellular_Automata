class Cell {
  int value;
  color cellColor;
  
  int xPos;
  int yPos;
  
  int pixelSize;
  
  int rule;

  Cell() {
    value = 0;
    cellColor = color(125,125,125);
    pixelSize = 1;
  }
 
  //========================================================
  void setValue() {
    value = int(random(2));
  }
  
  int getValue() {
    return value;
  }
  //--------------------------------------------------------  
  void set_cellColor(int rule) {
    value = rule;
    if (value == 0) { 
      cellColor = color(0,0,0);
    } else {
      cellColor = color(255,255,255);
    }
  }
  
  color get_cellColor() {
    return cellColor;
  }
  
  //--------------------------------------------------------  
  void drawCell(int xPosition, int yPosition, int increment) {
    xPos = xPosition;
    yPos = yPosition;
    pixelSize = increment;
    
    noStroke();
    fill(get_cellColor());
    rect(xPos, yPos, pixelSize, pixelSize);
  }
  
} // end of Cell class
