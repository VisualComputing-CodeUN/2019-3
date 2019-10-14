PImage img;
int w = 120;
color cyan = color(0, 255, 255);

PGraphics pgIzq;
PGraphics pgDer;

int imgWidth; 
int imgHeight; 

int pointerX;
int pointerY;
int pointerRadio = 100;

String img1 = "curves.png";

String currentImage = img1;

void setup() {
  img = loadImage(currentImage); 
  size(1280,360);
  
  imgWidth = img.width;
  imgHeight = img.height;
  pointerX = imgWidth/2;
  pointerY = imgHeight/2; 
  pgIzq= createGraphics(imgWidth, imgHeight);
  pgDer= createGraphics(imgWidth, imgHeight);
  
}

void draw() {
  img = loadImage(currentImage); 
  image(pgIzq,0,0);
  image(pgDer,imgWidth,0);
  
  pgIzq.beginDraw();
  pgIzq.image(img, 0, 0);
  pgIzq.loadPixels();
  
  for (int x = 0; x < imgWidth; x++) {
    for (int y = 0; y < imgHeight; y++ ) {
      int loc = x + y*img.width;
      color currentColor = img.pixels[loc];
      color c = insidePointerRadio(x, y, currentColor);
      pgIzq.pixels[loc] = c;
    }
  }
  pgIzq.updatePixels();
  pgIzq.endDraw();
  
  pgDer.beginDraw();
  pgDer.image(img, 0, 0);
  pgDer.endDraw();
}



color insidePointerRadio(int x, int y, color currentColor) {
  color finalColor = currentColor; 
  float distance = pow((x - pointerX), 2) + pow((y - pointerY), 2);
  if (distance <= pow(pointerRadio, 2) && currentColor != color(255, 255, 255)) {
    finalColor = cyan;
  }
  return finalColor;
};

void mouseClicked() {
  pointerX = mouseX;
  pointerY = mouseY;
}
