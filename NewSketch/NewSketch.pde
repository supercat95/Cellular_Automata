int displayWidth = 400;
int displayHeight = 400;
Cell[][] cells = new Cell[displayWidth][displayHeight];

int increment = 20;

int[] newCells = new int[cells.length];
int cellToLeft;
int cellinMiddle;
int cellToRight;

int[] ruleset = {0,1,1,0,1,0,0,1};

void setup() {
  size(displayWidth,displayHeight);
  
  initializeCells();
  
}

void draw() {
  for (int i = 0; i < displayWidth; i+= increment) {
    for (int j = 0; j < displayHeight; j+= increment) {
      cells[i][j].drawCell(i,j,increment);
    }
  }
 
}

//--------------------------------------------------------
void initializeCells() {
  for (int i = 0; i < displayWidth; i++) {
    for (int j = 0; j < displayHeight; j++) {
      cells[i][j] = new Cell();
      cells[i][j].setValue();
      cells[i][j].assignValueToColor();
    }
  }
  
  for (int i = 1; i < cells.length -1; i+= increment) {
    cellToLeft = cells[i-1].getValue();
    cellInMiddle = cells[i].getValue();
    cellToRight = cells[i+1].getValue();
    
    newCells[i] = rules(cellToLeft, cellInMiddle, cellToRight);
    cells = newCells;
  }
}

int rules(int left, int middle, int right) {
  if (left == 0 && middle = 0 && right == 0) { return ruleset[0]; }
  else if (left == 1 && middle = 0 && right == 0) { return ruleset[1]; }
  else if (left == 1 && middle = 1 && right == 0) { return ruleset[2]; }
  else if (left == 1 && middle = 1 && right == 1) { return ruleset[3]; }
  else if (left == 0 && middle = 1 && right == 1) { return ruleset[4]; }
  else if (left == 0 && middle = 0 && right == 1) { return ruleset[5]; }
  else if (left == 1 && middle = 0 && right == 1) { return ruleset[6]; }
  else if (left == 0 && middle = 1 && right ==0 ) { return ruleset[7]; }
}
