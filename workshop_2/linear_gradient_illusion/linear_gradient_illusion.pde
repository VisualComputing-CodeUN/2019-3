// Tomado de Processing examples: https://processing.org/examples/lineargradient.html
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, gray;

void setup() {
  size(640, 360);
  b1 = color(255);
  b2 = color(0);
  gray = color(128);
}

void draw() {
  if (mousePressed == true) {
    setGradient(0, 0, width, height, b1, b1, X_AXIS);
  } else {
    setGradient(0, 0, width, height, b2, b1, X_AXIS);
  }
  setGradient(50, 160, 540, 80, gray, gray, X_AXIS);
}


// Tomado de Processing examples: https://processing.org/examples/lineargradient.html
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
