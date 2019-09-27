import processing.video.*;
Movie video;
Movie videoEdited;

PGraphics pgIzq;
PGraphics pgDer;

int videoWidth;
int videoHeight;

void setup() {
   size(1280, 360);
   pgIzq= createGraphics(640, 360);
   pgDer= createGraphics(640, 360);
   
   video = new Movie(this, "test.mov");
   videoEdited = new Movie(this, "test.mov");
   video.loop();
   videoEdited.loop();
}

void draw() {
 // GRAYSCALE
 image(pgIzq, 0, 0);
 image(pgDer, 640, 0);
 videoWidth = videoEdited.width;
 videoHeight = videoEdited.height;
 // GRAYSCALE
 pgDer.beginDraw();
 pgDer.image(videoEdited, 0, 0);
 pgDer.loadPixels();
// Begin our loop for every pixel in the smaller image
  for (int pos = 0; pos < videoWidth * videoHeight; pos++) {
    int pixelValue = videoEdited.pixels[pos];
    float newPixel = (red(pixelValue) + blue(pixelValue) + green(pixelValue)) / 3.0;
    pgDer.pixels[pos] = color(newPixel, newPixel, newPixel); 
    
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
