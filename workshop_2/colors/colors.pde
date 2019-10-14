PImage img;
PImage grid;

PGraphics pgMain;
float offset = 0;
float easing = 0.05;

void setup() {
  size(956, 520);
  img = loadImage("hearts2.png");
  grid = loadImage("grid.png");
  pgMain = createGraphics(img.width, img.height);
}

void draw() { 
  image(pgMain, 0, 0);
  pgMain.beginDraw();
  pgMain.image(img, 0, 0);
  float dx = (mouseX-img.width) - offset;
  offset += dx * easing; 
  pgMain.image(grid, offset, 0);
  pgMain.endDraw();
}
