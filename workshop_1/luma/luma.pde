//Resolucion maxima de imagenes 640x360
//basado en https://processing.org/examples/convolution.html
//https://processing.org/examples/blur.html
//https://es.wikipedia.org/wiki/Luma_(v%C3%ADdeo)

PImage img; //imagen a jugar
PGraphics pgIzq;
PGraphics pgDer;
PGraphics pgLum;

int HImg = 0;
int WImg = 0;

String instructions = "To change the image just press: \n 1: Nature. \n 2: Shark. \n 3: City. \n 4: Match \n 5: Fire ";

String img1 = "nature1.jpg";
String img2 = "shark.jpg";
String img3 = "city2.jpg";
String img4 = "futbol.jpg";
String img5 = "fuego1.jpg";

String currentImage = img2;

void setup() {
  img = loadImage(currentImage); //load imagen
  HImg = img.height;
  WImg = img.width;
  size(1280,720);
  pgIzq= createGraphics(WImg,HImg);
  pgDer= createGraphics(WImg,HImg);
  pgLum= createGraphics(WImg,HImg);
    // show instructions
  textSize(18);
  fill(37, 106, 155);
  text(instructions, WImg, 20);
  
}

void draw() {
  //clear();
  img = loadImage(currentImage); //load imagen
  HImg = img.height;
  WImg = img.width;

  image(pgIzq,0,0);
  image(pgLum,WImg,HImg);
  image(pgDer,0,HImg);
    
  pgIzq.beginDraw();
  pgIzq.image(img, 0, 0);
  pgIzq.endDraw();
  
  pgDer.beginDraw();
  //For GrayScale
  pgDer.loadPixels();
  println("ants del for",HImg,WImg);
  for (int x = 0; x < HImg*WImg; x++ ) {
    float value = (red(img.pixels[x])+blue(img.pixels[x])+green(img.pixels[x]))/3;
    pgDer.pixels[x] = color(value,value,value);
  }
  pgDer.updatePixels();

  pgDer.endDraw();
 
  pgLum.beginDraw();
  pgLum.loadPixels();
   for (int x = 0; x < HImg*WImg; x++ ) {
     color c = img.pixels[x];
     float red = red(c);
     float green = green(c);
     float blue = blue(c);
    float value = (0.299*red + 0.587*green + 0.114*blue);
    pgLum.pixels[x] = color(value,value,value);
  }
  pgLum.updatePixels();
  pgLum.endDraw();

}

void keyPressed() {
  switch (key) {
    case '1':
      currentImage = img1;
      break;
    case '2':
      currentImage = img2;
      break;
    case '3':
      currentImage = img3;
      break;
    case '4':
      currentImage = img4;
      break;
    case '5':
      currentImage = img5;
      break;
  } 
}
