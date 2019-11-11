class Cell {
  int value;
  color cellColor; 
  
  int xPos;
  int yPos;
  
  int pixelSize;

  Cell() {
    value = 0;
    cellColor = color(4,122,198, 100);
    xPos = 0;
    yPos = 0;
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
    if (value == 1) { cellColor = color(0,0,0); } 
    if (value == 0) { cellColor = color(255,255,255); }
  }
  
  color get_cellColor() {
    return cellColor;
  }
  
  //--------------------------------------------------------  
  void drawCell(int xPosition, int yPosition, int increment, int rule) {
    xPos = xPosition;
    yPos = yPosition;
    pixelSize = increment;
    //set_cellColor(rule);
    
    noStroke();
    fill(get_cellColor());
    rect(xPos, yPos, pixelSize, pixelSize);
  }
  
} // end of Cell class
