//Resolucion maxima de imagenes 640x360
//basado en https://processing.org/examples/convolution.html
//https://processing.org/examples/blur.html
//https://es.wikipedia.org/wiki/Luma_(v%C3%ADdeo)
import processing.video.*;
Movie video;
Movie videoEdited;

PGraphics pgIzq;
PGraphics pgDer;
PGraphics frames;

PGraphics pgIzqBottom;
PGraphics pgDerBottom;

int videoWidth;
int videoHeight;

float[][] edgeDetection = { { 1, 0, -1 },
                     { 0,  0, 0 },
                     { -1, 0, 1 } };

float vector = 1.0/9.0;
float[][] boxBlur = { { vector, vector, vector },
                       { vector,  vector, vector },
                       { vector, vector, vector } };
                       
float sharpenK = -1.0;
float[][] sharpen = { { 0, sharpenK, 0 },
                       { sharpenK,  5.0, sharpenK },
                       { 0, sharpenK, 0 } };                   


float embossK = 2.0;
float[][] emboss = { { -embossK, -1, 0 },
                       { -1,  1, 1 },
                       { 0, 1, embossK } };                   


float[][] currentFilter = edgeDetection;      
String currentFilterText = "Egde detection";

String instructions = "To change the video mask convolution just press: \n 1: Egde detection. \n 2: Box Blur. \n 3: Sharpen. \n 4: Emboss \n\n\n Computing efficiency: \n To increase press + \n To decrease press -";
String analysis = "";

int computing = 30;

void setup() {
   video = new Movie(this, "test.mov");
   videoEdited = new Movie(this, "test.mov");
   video.loop();
   videoEdited.loop();
   videoWidth = video.width;
   videoHeight = video.height;
   frameRate(computing);
   fullScreen();
   pgIzq = createGraphics(videoWidth, videoHeight);
   pgDer = createGraphics(videoWidth, videoHeight);
   frames = createGraphics(videoWidth, videoHeight);
    // show instructions
   textSize(18);
   fill(37, 106, 155);
   text(instructions, 0, 30);
}

void draw() {
 // CONVOLUTIONS
 image(pgIzq, 0, videoHeight);
 image(pgDer, videoWidth, videoHeight);
 image(frames, videoWidth, 0);
 pgDer.beginDraw();
 pgDer.background(0); 
 pgDer.image(videoEdited, 0, 0);
 pgDer.loadPixels();
 
 int matrixLength = currentFilter[0].length;
 
 for (int x = 0; x < videoWidth; x++) {
   for (int y = 0; y < videoHeight ; y++) {
     color newPixel = convolution(x, y, currentFilter, matrixLength, videoEdited);
     int pos = x + y* videoWidth;
     pgDer.pixels[pos] = newPixel;
     
   }
 }
 pgDer.updatePixels();
 pgDer.endDraw();
 
 pgIzq.beginDraw();
 pgIzq.image(video, 0, 0);
 pgIzq.endDraw();
 
 // analysis 
 frames.beginDraw();
 frames.background(255,255,255);
 frames.textSize(18);
 frames.fill(37, 106, 155);
 frames.text("Current mask:", 10, 30);
 frames.text(currentFilterText, 150, 30);
 frames.text("Setting FrameRate against actual FrameRate:", 10, 60);
 frames.text(computing, 10, 90);
 frames.text(frameRate, 50, 90);
 frames.endDraw();
}

// read new frames from the movie
void movieEvent(Movie movie) {
  if(movie.available() == true) {
    movie.read();
  } 
}

void keyPressed() {
  switch (key) {
    case '1':
      currentFilter = edgeDetection;
      currentFilterText = "Edge detection";
      break;
    case '2':
      currentFilter = boxBlur;
      currentFilterText = "Box Blur";
      break;
    case '3':
      currentFilter = sharpen;
      currentFilterText = "Sharpen";
      break;
    case '4':
      currentFilter = emboss;
      currentFilterText = "Emboss";
      break;
    case '+':
      computing += 1;
      frameRate(computing);
      break;
    case '-':
      computing -= 1;
      frameRate(computing);
      break;
  } 
}

color convolution(int x, int y, float[][] matrix, int matrixsize, Movie img)
{
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize;
  for (int i = 0; i < matrixsize; i++){
    for (int j= 0; j < matrixsize; j++){
      // What pixel are we testing
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + img.width*yloc;
      // Make sure we haven't walked off our image, we could do better here
      loc = constrain(loc,0,img.pixels.length-1);
      // Calculate the convolution
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  // Make sure RGB is within range
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  // Return the resulting color
  return color(rtotal, gtotal, btotal);
}
