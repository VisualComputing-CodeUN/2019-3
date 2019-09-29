import processing.video.*;
Movie video;
Movie videoEdited;
Movie videoLuma;

PGraphics pgIzq;
PGraphics pgDer;
PGraphics pgLuma;
PGraphics frames;

int videoWidth;
int videoHeight;
int computing = 30;

String instructions = "Computing efficiency: \n To increase press + \n To decrease press -"; 

void setup() {
   video = new Movie(this, "test.mov");
   videoEdited = new Movie(this, "test.mov");
   videoLuma = new Movie(this, "test.mov");
   video.loop();
   videoEdited.loop();
   videoLuma.loop();
   
   videoWidth = videoEdited.width;
   videoHeight = videoEdited.height;
   print(videoWidth);
   fullScreen(videoWidth);
   pgIzq= createGraphics(videoWidth, videoHeight);
   pgDer= createGraphics(videoWidth, videoHeight);
   pgLuma = createGraphics(videoWidth, videoHeight);
   frames = createGraphics(videoWidth, videoHeight);
   frameRate(computing);
}

void draw() {
 // GRAYSCALE
 image(pgIzq, 0, 0);
 image(pgDer, 0, videoHeight);
 image(pgLuma, videoWidth, videoHeight);
 image(frames, videoWidth, 0);
 
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
 
 pgLuma.beginDraw();
 pgLuma.image(videoLuma, 0, 0);
 pgLuma.loadPixels();
 for(int pos = 0; pos <videoWidth * videoHeight; pos++) {
   int prixelVal = videoLuma.pixels[pos];
   float newPixel = 0.299*red(prixelVal) + 0.114*blue(prixelVal) + 0.587*green(prixelVal);
   pgLuma.pixels[pos] = color(newPixel, newPixel, newPixel);
 }
 pgLuma.updatePixels();
 pgLuma.endDraw();
 
 
 pgIzq.beginDraw();
 pgIzq.image(video, 0, 0);
 pgIzq.endDraw();
 
  // analysis 
 frames.beginDraw();
 frames.background(255,255,255);
 frames.textSize(18);
 frames.fill(37, 106, 155);
 frames.text(instructions, 10, 60);
 frames.text("Setting FrameRate against actual FrameRate:", 10, videoHeight/2);
 frames.text(computing, 10, videoHeight/2 + 20);
 frames.text(frameRate, 50, videoHeight/2 + 20);
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
