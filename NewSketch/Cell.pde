class Cell {
  int value;
  color cellColor; 
  
  int xPos;
  int yPos;
  
  int pixelSize;

  Cell() {
    value = 0;
    cellColor = color(255,0,0);
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
    this.value = rule;
    if (this.value == 0) { this.cellColor = color(0,0,0); } 
    if (this.value == 1) { this.cellColor = color(255,255,255); }
    if (this.value == 2) { this.cellColor = color(0,255,0); }
  }
  
  color get_cellColor() {
    return this.cellColor;
  }
  
  //--------------------------------------------------------  
  void drawCell(int xPosition, int yPosition, int increment, int rule) {
    xPos = xPosition;
    yPos = yPosition;
    pixelSize = increment;
    this.set_cellColor(rule);
    
    noStroke();
    fill(this.get_cellColor());
    rect(xPos, yPos, pixelSize, pixelSize);
  }
  
} // end of Cell class
