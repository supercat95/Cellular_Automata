int displayWidth = 400;
int displayHeight = 400;
Cell[][] cells = new Cell[displayWidth][displayHeight];

int increment = 20;

void setup() {
  size(displayWidth,displayHeight);
  for (int i = 0; i < displayWidth; i++) {
    for (int j = 0; j < displayHeight; j++) {
      cells[i][j] = new Cell();
      cells[i][j].setValue();
    }
  }
  
}

void draw() {
  for (int i = 0; i < displayWidth; i+= increment) {
    for (int j = 0; j < displayHeight; j+= increment) {
      cells[i][j].assignValueToColor();
      cells[i][j].drawCell(i,j,increment);
    }
  }
}
