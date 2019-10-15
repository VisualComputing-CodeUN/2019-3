int x = 290; 
int y = 0;
float xadd=2;
PImage img; //imagen a jugar
PGraphics pgIzq;
int spaceBetween = 5;
int grosor = 10;
String img1 = "jump.png";
void setup() {
  size (1200, 600);
  pgIzq= createGraphics(800,600);
  img = loadImage(img1); //load imagen
  image(img, 0, 0);  
}

void draw() {
  background(255);
  image(img, 0, 0);  
  translate (x, y);
  image(pgIzq,x,y);
  // all you want to paint comes here
  pgIzq.beginDraw();
  pgIzq.background(0,0,0,0);
  pgIzq.stroke(150);
  pgIzq.strokeWeight(grosor);
  int ini = grosor/2;
  for(int i = 0; i < 100; i++){
    int pos = ini + (grosor+spaceBetween)*i;
    pgIzq.line(pos,0,pos,600);
  }
  pgIzq.endDraw();

}
void keyPressed() {
  switch(keyCode) {
  case RIGHT:
    if(x<1200){
      x+=xadd;
    }
    //println("right");
    break;
  case LEFT:
    if(x>-1200){
      x-=xadd;
    }
    //println("left");
    break;
  case DOWN:
    if(grosor>1){
      grosor--;
    }
    //println("left");
    break;
  case UP:
    grosor++;
    //println("left");
    break;
  case 109:
    if(spaceBetween>1){
      spaceBetween--;
    }
    break;
  case 107:
    spaceBetween++;
    break;
  }
}
