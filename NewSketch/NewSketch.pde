int displayWidth = 400;
int displayHeight = 400;
Cell[][] cells = new Cell[displayWidth][displayHeight];

int increment = 20;

Cell[][] newCells = new Cell[displayWidth][displayHeight];
int cellToLeft;
int cellInMiddle;
int cellToRight;

int[] ruleset = {1,0,1,0,1,0,0,1};
int result;

void setup() {
  size(displayWidth,displayHeight);
  //frameRate(20);
  
  initializeCells();
}

void draw() {
  setRules(); // grid for a split second then a pattern for eternity
  
  for (int i = 0; i < displayWidth; i+= increment) {
    for (int j = 0; j < displayHeight; j+= increment) {  
      cells[i][j].drawCell(i,j,increment, result);
    }
  }
 
}

//--------------------------------------------------------
void initializeCells() {
  for (int i = 0; i < displayWidth; i++) {
    for (int j = 0; j < displayHeight; j++) {
      cells[i][j] = new Cell();
      cells[i][j].setValue();  
      
      newCells[i][j] = new Cell();
    }
  }
}

void setRules() {
  for (int i = increment; i < displayHeight - increment; i+= increment) {
    for (int j = increment; j < displayWidth - increment; j+= increment) {
      cellToLeft = cells[i-increment][j-increment].getValue();
      cellInMiddle = cells[i][j-increment].getValue();
      cellToRight = cells[i+increment][j-increment].getValue();
      
      result = rules(cellToLeft, cellInMiddle, cellToRight);
      println(cellToLeft, cellInMiddle, cellToRight, result); // works
      newCells[i][j].set_cellColor(result);
    }
  }
  cells = newCells;
  //println(cells[20][20].getValue(), cells[100][20].getValue()); // ?
}

//--------------------------------------------------------
int rules(int left, int middle, int right) {
  if (left == 0 && middle == 0 && right == 0) { return ruleset[0]; }
  else if (left == 1 && middle == 0 && right == 0) { return ruleset[1]; }
  else if (left == 1 && middle == 1 && right == 0) { return ruleset[2]; }
  else if (left == 1 && middle == 1 && right == 1) { return ruleset[3]; }
  else if (left == 0 && middle == 1 && right == 1) { return ruleset[4]; }
  else if (left == 0 && middle == 0 && right == 1) { return ruleset[5]; }
  else if (left == 1 && middle == 0 && right == 1) { return ruleset[6]; }
  else if (left == 0 && middle == 1 && right == 0) { return ruleset[7]; }
  return (ruleset[int(random(ruleset.length))]);
}
