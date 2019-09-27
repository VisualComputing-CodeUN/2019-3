import processing.video.*;
Movie video;
Movie videoEdited;

PGraphics pgIzq;
PGraphics pgDer;

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
String instructions = "To change the video mask convolution just press: \n 1: Egde detection. \n 2: Box Blur. \n 3: Sharpen. \n 4: Emboss";


void setup() {
   fullScreen();
   pgIzq = createGraphics(640, 360);
   pgDer = createGraphics(640, 360);
   
   video = new Movie(this, "test.mov");
   videoEdited = new Movie(this, "test.mov");
   video.loop();
   videoEdited.loop();
   
    // show instructions
    textSize(18);
    fill(37, 106, 155);
    text(instructions, 0, video.height + 60);
}

void draw() {
 // CONVOLUTIONS
 
 videoWidth = videoEdited.width;
 videoHeight = videoEdited.height;

 image(pgIzq, 0, 0);
 image(pgDer, videoWidth, 0);
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
      break;
    case '2':
      currentFilter = boxBlur;
      break;
    case '3':
      currentFilter = sharpen;
      break;
    case '4':
      currentFilter = emboss;
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
