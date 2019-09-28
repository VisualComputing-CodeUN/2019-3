//Resolucion maxima de imagenes 640x360

PImage img; //imagen a jugar


PGraphics pgIzq;
PGraphics pgDer;
PGraphics pgHist;
PGraphics pgFin;

int HImg = 0;
int WImg = 0;
int limit1 = 0;
int limit2 = 255;
boolean isCouple = true;

int limitLeft = 0;
int limitRight = 255;

String instructions = "To change the image just press: \n 1: Nature. \n 2: Moon Walking. \n 3: City. \n 4: Match \n\n Select the range of values to show in the Histogram";

String img1 = "nature.jpg";
String img2 = "moon.png";
String img3 = "city.jpg";
String img4 = "futbol.jpg";

String currentImage = img1;

void setup() {
  img = loadImage(currentImage); //load imagen
  HImg = img.height;
  WImg = img.width;
  size(1280,720);
   
  pgIzq= createGraphics(WImg,HImg);
  pgDer= createGraphics(WImg,HImg);
  pgHist = createGraphics(512,HImg);
  pgFin= createGraphics(WImg,HImg);
  // show instructions
  textSize(18);
  fill(37, 106, 155);
  text(instructions, 0, 20);
}

void draw() {
  img = loadImage(currentImage); //load imagen
  // We're only going to process a portion of the image
  // so let's set the whole image as the background first
  image(pgIzq,0,HImg);
  image(pgHist,WImg,0);
  image(pgFin,WImg,HImg);
  
    
  //canvas de la derecha que va con las convoluciones
  pgIzq.beginDraw();
  pgIzq.image(img, 0, 0);
  pgIzq.endDraw();
  
  pgDer.beginDraw();
  //For GrayScale
  pgDer.loadPixels();
  for (int x = 0; x < HImg*WImg; x++ ) {
    float value = (red(img.pixels[x])+blue(img.pixels[x])+green(img.pixels[x]))/3;
    pgDer.pixels[x] = color(value,value,value);
  }
  pgDer.updatePixels();

  pgDer.endDraw();
  
  pgHist.beginDraw();
  
  int[] hist = new int[256];
  
  //basado en https://processing.org/examples/histogram.html
  // Calculate the histogram
  for (int i = 0; i < pgDer.pixels.length; i++) {
    int bright = int(red(pgDer.pixels[i]));
    hist[bright]++; 
  }

  int histMax = max(hist);
  
  //println(hist[0]);
  //int y = int(map(hist[0], 0, histMax, img.height, 0));
  //println(y);
  
  if(!isCouple){
    //pgHist.clear();
    pgHist.background(255,255,255);
    pgHist.stroke(204, 102, 0);
    pgHist.line(limit1*2, img.height, limit1*2, 0);
    pgHist.stroke(0, 0, 0);
  }else{
    pgHist.background(255,255,255);
    pgHist.stroke(204, 102, 0);
    pgHist.line(limit1*2, img.height, limit1*2, 0);
    pgHist.line(limit2*2, img.height, limit2*2, 0);
    pgHist.stroke(0, 0, 0);
    newRange();
  }
  for (int i = 0; i < 256; i++) {
    // the bottom and the top of the picture
    int y = int(map(hist[i], 0, histMax, img.height, 0));
    pgHist.line(i*2, img.height, i*2, y);
  }
  
  pgHist.stroke(0,0,0);
  
  pgHist.endDraw();
  
  pgFin.beginDraw();
  pgFin.background(255,255,255);
  pgFin.loadPixels();
  for (int x = 0; x < HImg*WImg; x++ ) {
    float value = (red(img.pixels[x])+blue(img.pixels[x])+green(img.pixels[x]))/3;
    if(value>=limitLeft && value<=limitRight){
      pgFin.pixels[x] = color(value,value,value);
    }
  }
  pgFin.updatePixels();

  pgFin.endDraw();
  
}

void mouseClicked() {
  if(mouseX>WImg && mouseX<WImg+512 && mouseY<HImg){
    int val = (mouseX-WImg)/2;
    if(isCouple){
      println("esta la pareja");
      limit1 = val;
      isCouple = false;
    }else{
      println("NO zesta la pareja");
      limit2 = val;
      isCouple = true;
    }
    
  }
}

void keyPressed() {
  limit1=0;
  limit2=255;
  newRange();
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
  } 
}

void newRange(){
  println("rango antiguo", limitLeft, limitRight);
  if(limit1<limit2){
    limitLeft = limit1;
    limitRight = limit2;
  }else{
    limitLeft = limit2;
    limitRight = limit1;
  }
  println("rango nuevo", limitLeft, limitRight);
}
