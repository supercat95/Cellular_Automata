class Cell {
  int value;

  Cell() {
    value = 0;
  }
  //========================================================
  void setValue() {
    value = int(random(2));
  }
  
  int getValue() {
    return value;
  }
} // end of Cell class
