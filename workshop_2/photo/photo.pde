//Resolucion maxima de imagenes 640x360
//https://www.youtube.com/watch?v=f1fXCRtSUWU

PImage img; //imagen a jugar


PGraphics pgIzq;
PGraphics pgDer;
PGraphics pgOtro;
PGraphics pgOtro2;
PGraphics pgSmall;
PGraphics pgSmall2;
PGraphics pgSmallX;
PGraphics pgSmallX2;
int HImg = 0;
int WImg = 0;
int columnas = 10; //10-64-32-80
int filas = 10;  //10-36-18-72

String img1 = "negro.jpeg";

String currentImage = img1;

void setup() {
  img = loadImage(currentImage); //load imagen
  HImg = img.height;
  WImg = img.width;
  size(1280,720);
   
  pgIzq= createGraphics(WImg,HImg);
  pgDer= createGraphics(WImg,HImg);
  pgOtro= createGraphics(WImg/2,HImg);
  pgOtro2= createGraphics(WImg/2,HImg);
  pgSmall= createGraphics(WImg/2,HImg/2);
  pgSmall2= createGraphics(WImg/2,HImg/2);
  pgSmallX= createGraphics(WImg/2,HImg/2);
  pgSmallX2= createGraphics(WImg/2,HImg/2);

}

void draw() {
  img = loadImage(currentImage); //load imagen
  // We're only going to process a portion of the image
  // so let's set the whole image as the background first
  image(pgIzq,0,0);
  image(pgOtro,WImg,0);
  image(pgOtro2,WImg+WImg/2,0);
  image(pgSmall,0,HImg);
  image(pgSmall2,0,HImg+HImg/2);
  image(pgSmallX,WImg/2,HImg);
  image(pgSmallX2,WImg/2,HImg+HImg/2);
    
  //canvas de la derecha que va con las convoluciones
  pgIzq.beginDraw();
  pgIzq.image(img, 0, 0);
  pgIzq.endDraw();
  
  pgDer.beginDraw();
  pgDer.loadPixels();
  for (int x = 0; x < HImg*WImg; x++ ) {
    if(x%2==0){
      pgDer.pixels[x] = pgIzq.pixels[x];
    }
  }
  pgDer.updatePixels();

  pgDer.endDraw();

  pgOtro.beginDraw();
  //pgOtro.background(255);
  pgOtro.loadPixels();
  int paquete = WImg/columnas;//WImg /columnas; //64
  int cont = 0;
  for(int x = 0; x < HImg*WImg; x++ ) {
    if(x%paquete*2<paquete){
      pgOtro.pixels[cont]= pgIzq.pixels[x];
      cont++;
    }
  }
  pgOtro.updatePixels();

  pgOtro.endDraw();
  
  pgOtro2.beginDraw();
  //pgOtro.background(255);
  pgOtro2.loadPixels();
  int cont2 = 0;
  for(int x = 0; x < HImg*WImg; x++ ) {
    if(x%paquete*2<paquete){
    }else{
      pgOtro2.pixels[cont2]= pgIzq.pixels[x];
      cont2++;
    }
  }
  pgOtro2.updatePixels();
  pgOtro2.endDraw();

//FIGURAS PEQUEÑAS

  

  pgSmall.beginDraw();
  //pgOtro.background(255);
  pgSmall.loadPixels();

  int paqueteY = HImg/filas;//WImg /filas; //36
  cont = 0;
  for(int x = 0; x < (HImg*WImg)/2; x++ ) {
    if(x % (paqueteY *2 * WImg/2) < (paqueteY*WImg) / 2){
      pgSmall.pixels[cont]= pgOtro.pixels[x];
      cont++;
    }
  }
  pgSmall.updatePixels();
  pgSmall.endDraw();
  
  
  pgSmall2.beginDraw();
  //pgOtro.background(255);
  pgSmall2.loadPixels();
  cont2 = 0;
  for(int x = 0; x < (HImg*WImg)/2; x++ ) {
    if(x % (paqueteY *2 * WImg/2) < (paqueteY*WImg) / 2){
    }else{
      pgSmall2.pixels[cont2]= pgOtro.pixels[x];
      cont2++;
    }
  }
  pgSmall2.updatePixels();
  pgSmall2.endDraw();
  
  
  ///////
  
  pgSmallX.beginDraw();
  //pgOtro.background(255);
  pgSmallX.loadPixels();
  cont = 0;
  for(int x = 0; x < (HImg*WImg)/2; x++ ) {
    if(x % (paqueteY *2 * WImg/2) < (paqueteY*WImg) / 2){
      pgSmallX.pixels[cont]= pgOtro2.pixels[x];
      cont++;
    }
  }
  pgSmallX.updatePixels();
  pgSmallX.endDraw();
  
  pgSmallX2.beginDraw();
  //pgOtro.background(255);
  pgSmallX2.loadPixels();
  cont2 = 0;
  for(int x = 0; x < (HImg*WImg)/2; x++ ) {
    if(x % (paqueteY *2 * WImg/2) < (paqueteY*WImg) / 2){
    }else{
      pgSmallX2.pixels[cont2]= pgOtro2.pixels[x];
      cont2++;
    }
  }
  pgSmallX2.updatePixels();
  pgSmallX2.endDraw();
    
}
