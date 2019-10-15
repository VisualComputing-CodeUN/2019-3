//ceguera de curvatura

PGraphics pgUp;
PGraphics pgDown;

boolean change = true;
float wei = 1.5;

void setup() {
  size(700, 500);
  stroke(0);
  background(#808080);
  
} 

void draw() {
  background(#808080);
    strokeWeight(wei);
    noFill();
    int ini = 50;
    int top = ini/2;
    int down = ini+top;
    //corrido hacia abajo
    int space = 100;
    int move = 0;
    int pairs = 6;
    int qOfCurves = 10;
    
    strokeWeight(wei);
    
    int a = 0;
    int b = 255;
    if(change){
      a = 0;
      b = 255;
    }else{
      a = 255;
      b = 0;
    }
    for(int x = 0; x<pairs ;x+=2){
      move = x*space;
      //primera curva
      for(int i = 0; i<qOfCurves;i++){
        int j = 2*i;
        createCurve(ini*j,ini+move, ini*j,ini+move, ini*j+top ,top+move , ini*j + ini, ini+move, 0  );
        createCurve(ini*j,ini+move, ini*j+top ,top+move , ini*j + ini, ini+move, ini*j + ini, ini+move, a  );
      }
      
      for(int i = 0; i<qOfCurves;i++){
        int j = 2*i;
        createCurve(ini*j+ini ,ini+move , ini*j+ini, ini+move, ini*j+top+ini ,down+move ,ini*j+ini+ini, ini+move, 255 );
        createCurve(ini*j+ini,ini+move, ini*j+top+ini ,down +move, ini*j+ini + ini, ini+move,ini*j + ini+ini, ini+move,b  );
        
      }
      
      //segunda curva
      move = (x+1)*space;
      for(int i = 0; i<qOfCurves;i++){
        int j = 2*i;
        createCurve(ini*j,ini+move, ini*j,ini+move, ini*j+top ,top+move , ini*j + ini, ini+move, 0  );
        createCurve(ini*j,ini+move, ini*j+top ,top+move , ini*j + ini, ini+move, ini*j + ini, ini+move, b  );
      }
      
      for(int i = 0; i<qOfCurves;i++){
        int j = 2*i;
        createCurve(ini*j+ini ,ini+move , ini*j+ini, ini+move, ini*j+top+ini ,down+move ,ini*j+ini+ini, ini+move, 255 );
        createCurve(ini*j+ini,ini+move, ini*j+top+ini ,down +move, ini*j+ini + ini, ini+move,ini*j + ini+ini, ini+move, a  );
        
      }
    
    }
    
  
}

void createCurve(int xinit, int yinit, int x1, int y1,int x2, int y2, int xfin, int yfin, int col){
  //coordinates initials, coordinates finals, start point to draw, end, pont to draw, color hexa 
  stroke(col);
  beginShape();
  curveVertex(xinit, yinit); // the first control point
  curveVertex(x1, y1); // the first control point
  curveVertex(x2, y2); // is also the start point of curve
  //curveVertex(150, 50);
  curveVertex(xfin, yfin);
  endShape();


}
void keyPressed() {
  switch (key) {
    case '1':
      change = !change;
      break;
    case '+':
      if(wei<15) wei++;
      break;
    case '-':
      if(wei>1) wei--;
      break; 
  }
}
