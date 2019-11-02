int[] recursions = new int[width * height];

float xPos;
float yPos;

float randomX = 0;
float randomY = 0;

int red = 255;
int green = 3;
int blue = 3;
color strokeColor;
 
void setup() {
  size(600,600);
  frameRate(5);
  newStartingPosition();
}

void draw() {
 recursiveFunction();
}

void recursiveFunction() {
  stroke(return_strokeColor());
  //line(xPos, yPos, xPos + randomX, yPos + randomY);
  for (int i = 0, i < recursions.length
  ellipse(xPos + randomX, yPos + randomY, 3, 3);
  
  xPos += randomX;
  yPos += randomY;
  
  randomX = random(-15,15);
  randomY = random(-15,15);
  
  if (xPos < width && xPos > 0 && yPos < height && yPos > 0) {
    recursiveFunction();
  } else {
    newStartingPosition();
  }
}

void newStartingPosition() {
  xPos = random(0,width);
  yPos = random(0,height);
}

int return_strokeColor() {
  if (red == 255 && green == 3 && blue < 255) {  blue++; }
  if (red > 3 && green == 3 && blue == 255) {  red--; }
  if (red == 3 && green < 255 && blue == 255) { green++; }
  if (red == 3 && green == 255 && blue > 3) { blue--; }
  if (red < 255 && green == 255 && blue == 3) { red++; }
  if (red == 255 && green > 3 && blue == 3) { green --; }
  
  return strokeColor = color(red, green, blue);
}
