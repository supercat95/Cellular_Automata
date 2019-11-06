int displayWidth = 400;
int displayHeight = 400;
Cell[][] cells = new Cell[displayWidth][displayHeight];

void setup() {
  size(displayWidth,displayHeight);
  for (int i = 0; i < displayWidth; i++) {
    for (int j = 0; j < displayHeight; j++) {
      cells[i][j] = new Cell();
      cells[i][j].setValue();
    }
  }
  println(cells[12][300].getValue());
  println(cells[399][190].getValue());
  
}

void draw() {
  
}
