int displayWidth = 400;
int displayHeight = 400;

Cell[][] cells1 = new Cell[displayWidth / 2][displayHeight / 2];
Cell[][] cells2 = new Cell[displayWidth / 2][displayHeight / 2];
Cell[][] cells3 = new Cell[displayWidth / 2][displayHeight / 2];
Cell[][] cells4 = new Cell[displayWidth / 2][displayHeight / 2];

int increment = 5;

Cell[][] newCells1 = new Cell[displayWidth / 2][displayHeight / 2];
Cell[][] newCells2 = new Cell[displayWidth / 2][displayHeight / 2];
Cell[][] newCells3 = new Cell[displayWidth / 2][displayHeight / 2];
Cell[][] newCells4 = new Cell[displayWidth / 2][displayHeight / 2];

boolean quadrant1;
boolean quadrant2;
boolean quadrant3;
boolean quadrant4;

int cellToLeft;
int cellInMiddle;
int cellToRight;

int[] ruleset1 = {1,0,1,0,1,0,0,1};
int[] ruleset2 = {1,1,1,0,1,1,0,1};
int[] ruleset3 = {1,0,0,1,0,0,1,1};
int[] ruleset4 = {1,0,1,1,0,0,1,1};

int result1;
int result2;
int result3;
int result4;

void setup() {
  size(displayWidth,displayHeight);
  frameRate(20);
  
  initializeCells();
  initializeValues();
  
  quadrant1 = true;
  quadrant2 = false;
  quadrant3 = false;
  quadrant4 = false;
}

void draw() {
  setRules(); 
  
  for (int i = 0; i < displayWidth / 2; i+= increment) {
    for (int j = 0; j < displayHeight / 2; j+= increment) {  
      
      while (quadrant1) { 
        pushMatrix();
        translate(0,0); 
        cells1[i][j].drawCell(i,j,increment, result1);
        popMatrix();
      }
      while (quadrant2) { 
        pushMatrix();
        translate(displayWidth / 2, 0); 
        cells2[i][j].drawCell(i,j,increment, result2);
        popMatrix();
      }
      while (quadrant3) { 
        pushMatrix();
        translate(0, displayHeight / 2); 
        cells3[i][j].drawCell(i,j,increment, result3);
        popMatrix();
      }
      while (quadrant4) { 
        pushMatrix();
        translate(displayWidth / 2, displayHeight / 2); 
        cells4[i][j].drawCell(i,j,increment, result4);
        popMatrix();
      }
    }
  }
  if (quadrant1) { 
      quadrant1 = !quadrant1;
      quadrant2 = !quadrant2;
  } else if (quadrant2) { 
    quadrant2 = !quadrant1;
    quadrant3 = !quadrant2;
  } else if (quadrant3) { 
    quadrant3 = !quadrant1;
    quadrant4 = !quadrant2;
  } else if (quadrant4) { 
    quadrant4 = !quadrant4;
    quadrant1 = !quadrant1;
    initializeValues();
  }
 
}

//--------------------------------------------------------
void initializeCells() {
  for (int i = 0; i < displayWidth / 2; i++) {
    for (int j = 0; j < displayHeight / 2; j++) {
      cells1[i][j] = new Cell();
      cells2[i][j] = new Cell();
      cells3[i][j] = new Cell();
      cells4[i][j] = new Cell();
      
      newCells1[i][j] = new Cell();
      newCells2[i][j] = new Cell();
      newCells3[i][j] = new Cell();
      newCells4[i][j] = new Cell();
    }
  }
}

void initializeValues() {
  for (int i = 0; i < displayWidth / 2; i++) {
    for (int j = 0; j < displayHeight / 2; j++) {
      cells1[i][j].setValue(); 
      cells2[i][j].setValue(); 
      cells3[i][j].setValue(); 
      cells4[i][j].setValue(); 
    }
  }
}

void setRules() {
  for (int i = increment; i < displayHeight / 2 - increment; i+= increment) {
    for (int j = increment; j < displayWidth / 2 - increment; j+= increment) {
      cellToLeft = cells1[i-increment][j-increment].getValue();
      cellToLeft = cells2[i-increment][j-increment].getValue();
      cellToLeft = cells3[i-increment][j-increment].getValue();
      cellToLeft = cells4[i-increment][j-increment].getValue();
      
      cellInMiddle = cells1[i][j-increment].getValue();
      cellInMiddle = cells2[i][j-increment].getValue();
      cellInMiddle = cells3[i][j-increment].getValue();
      cellInMiddle = cells4[i][j-increment].getValue();
      
      cellToRight = cells1[i+increment][j-increment].getValue();
      cellToRight = cells2[i+increment][j-increment].getValue();
      cellToRight = cells3[i+increment][j-increment].getValue();
      cellToRight = cells4[i+increment][j-increment].getValue();
      
      result1 = rules(cellToLeft, cellInMiddle, cellToRight);
      result2 = rules(cellToLeft, cellInMiddle, cellToRight);
      newCells1[i][j].set_cellColor(result1);
    }
  }
  cells1 = newCells1;
}

//--------------------------------------------------------
int rules(int left, int middle, int right) {
  if (left == 0 && middle == 0 && right == 0) { 
    if (quadrant1) return ruleset1[0]; 
    if (quadrant2) return ruleset2[0];
    if (quadrant3) return ruleset3[0];
    if (quadrant4) return ruleset4[0];
  }
  else if (left == 1 && middle == 0 && right == 0) { 
    if (quadrant1) return ruleset1[1]; 
    if (quadrant2) return ruleset2[1];
    if (quadrant3) return ruleset3[1];
    if (quadrant4) return ruleset4[1];
  }
  else if (left == 1 && middle == 1 && right == 0) { 
    if (quadrant1) return ruleset1[2]; 
    if (quadrant2) return ruleset2[2];
    if (quadrant3) return ruleset3[2];
    if (quadrant4) return ruleset4[2];
  }
  else if (left == 1 && middle == 1 && right == 1) { 
    if (quadrant1) return ruleset1[3]; 
    if (quadrant2) return ruleset2[3];
    if (quadrant3) return ruleset3[3];
    if (quadrant4) return ruleset4[3];
  }
  else if (left == 0 && middle == 1 && right == 1) { 
    if (quadrant1) return ruleset1[4]; 
    if (quadrant2) return ruleset2[4];
    if (quadrant3) return ruleset3[4];
    if (quadrant4) return ruleset4[4];
  }
  else if (left == 0 && middle == 0 && right == 1) { 
    if (quadrant1) return ruleset1[5]; 
    if (quadrant2) return ruleset2[5];
    if (quadrant3) return ruleset3[5];
    if (quadrant4) return ruleset4[5];
  }
  else if (left == 1 && middle == 0 && right == 1) { 
    if (quadrant1) return ruleset1[6]; 
    if (quadrant2) return ruleset2[6];
    if (quadrant3) return ruleset3[6];
    if (quadrant4) return ruleset4[6];
  }
  else if (left == 0 && middle == 1 && right == 0) { 
    if (quadrant1) return ruleset1[7]; 
    if (quadrant2) return ruleset2[7];
    if (quadrant3) return ruleset3[7];
    if (quadrant4) return ruleset4[7];
  }
  return (ruleset1[int(random(ruleset1.length))]);
}
