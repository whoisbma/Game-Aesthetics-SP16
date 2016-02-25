/**
 * Noise2D 
 * by Daniel Shiffman.  
 * 
 * Using 2D noise to create simple texture. 
 */
 
float increment = 0.09;

int[] grid;
int cellsize = 10;

void setup() {
  size(640, 640);
  grid = new int[width/cellsize*height/cellsize];
  
}

void draw() {
  
  //loadPixels();

  float xoff = 0.0; // Start xoff at 0
  float detail = 0.6;//map(mouseX, 0, width, 0.1, 0.6);
  noiseDetail(5, detail);
  
  // For every x,y coordinate in a 2D space, calculate a noise value and produce a brightness value
  for (int x = 0; x < width/cellsize; x++) {
    xoff += increment;   // Increment xoff 
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height/cellsize; y++) {
      yoff += increment; // Increment yoff
      
      // Calculate noise and scale by 255
      float bright = noise(xoff, yoff) * 255;

      // Try using this line instead
      //float bright = random(0,255);
      
      // Set each pixel onscreen to a grayscale value
      //pixels[x+y*width] = color(bright);
      
      if (bright < 150) {
        bright = 0;
      } else if (bright > 200) {
        bright = 200;
      } else if (bright > 150) {
        bright = 100;
      }
      grid[x+y*width/cellsize] = floor(bright);
      
    }
  }
  
  
  for (int i = 0; i < height/cellsize; i++) {
    for (int j = 0; j < width/cellsize; j++) {
      fill(grid[j+i*width/cellsize]);
      noStroke();
      rect(j*cellsize, i*cellsize, cellsize, cellsize);
    }
  }
  
  //updatePixels();
}