PImage img;
int w = 120;

// It's possible to convolve the image with many different 
// matrices to produce different effects. This is a high-pass 
// filter; it accentuates the edges. 
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

PGraphics pgIzq;
PGraphics pgDer;

int imgWidth; 
int imgHeight; 

String instructions = "To change the mask convolution just press: \n 1: Egde detection. \n 2: Box Blur. \n 3: Sharpen. \n 4: Emboss \n\n To change the image just press: \n a: Nature. \n b: Moon Walking. \n c: City. \n d: Match";

String img1 = "nature.jpg";
String img2 = "moon.png";
String img3 = "city.jpg";
String img4 = "futbol.jpg";

String currentImage = img1;

void setup() {
  img = loadImage(currentImage); 
  fullScreen();
  
  imgWidth = img.width;
  imgHeight = img.height;
  pgIzq= createGraphics(imgWidth, imgHeight);
  pgDer= createGraphics(imgWidth, imgHeight);
  
  // show instructions
  textSize(18);
  fill(37, 106, 155);
  text(instructions, 0, imgHeight + 20);
}

void draw() {
  img = loadImage(currentImage); 
  image(pgIzq,0,0);
  image(pgDer,imgWidth,0);
  
  pgDer.beginDraw();
  pgDer.image(img, 0, 0);
  int matrixsize = currentFilter[0].length;
  pgDer.loadPixels();
  // Begin our loop for every pixel in the smaller image
  for (int x = 0; x < imgWidth; x++) {
    for (int y = 0; y < imgHeight; y++ ) {
      color c = convolution(x, y, currentFilter, matrixsize, img);
      int loc = x + y*img.width;
      pgDer.pixels[loc] = c;
    }
  }
  pgDer.updatePixels();
  pgDer.endDraw();
  
  pgIzq.beginDraw();
  pgIzq.image(img, 0, 0);
  pgIzq.endDraw();
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
    case 'a':
      currentImage = img1;
      break;
    case 'b':
      currentImage = img2;
      break;
    case 'c':
      currentImage = img3;
      break;
    case 'd':
      currentImage = img4;
      break;
  } 
}


color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img)
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
