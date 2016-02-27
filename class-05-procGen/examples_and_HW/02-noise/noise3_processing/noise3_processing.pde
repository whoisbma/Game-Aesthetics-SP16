/*
NOISE EXAMPLE 3
OTHER ARRAY TYPES

this example uses both of the prior techniques to create tile colors that evoke landscapes.
we use a 2D array of colors instead of an array of chars or ints or whatever.
 
also below is a commented-out class that has multiple data types. 
it has a color variable as well as a char value, and a display method for drawing them both.
try using it instead by uncommenting them and commenting out the colorgrid approach, or creating your own.
*/

color[][] colorgrid;   
int cellsize = 7;

//Land[][] landgrid;

void setup() {
  size(640, 480);
  colorgrid = new color[width/cellsize][height/cellsize];
  //landgrid = new Land[width/cellsize][height/cellsize];
  //noiseSeed(0);

  background(0);
  noiseDetail(7, 0.4);  
  float increment = 0.09; 

  float xoff = 0.0;
  for (int x = 0; x < width/cellsize; x++) {
    xoff += increment;
    float yoff = 0.0;
    for (int y = 0; y < height/cellsize; y++) {
      yoff += increment;
      float noiseVal = noise(xoff, yoff);
      if (noiseVal < 0.4) {
        color fillColor = color(0, 0, map(noiseVal, 0, 0.4, 100, 255));
        colorgrid[x][y] = fillColor;
        //landgrid[x][y] = new Land(fillColor, '~');
      } else if (noiseVal >= 0.4 && noiseVal < 0.65) {
        color fillColor = color(map(noiseVal, 0.4, 0.65, 100, 70), 
          map(noiseVal, 0.4, 0.65, 100, 180), 
          map(noiseVal, 0.4, 0.65, 30, 60));
        colorgrid[x][y] = fillColor;
        //landgrid[x][y] = new Land(fillColor, ',');
      } else if (noiseVal >= 0.65) {
        color fillColor = color(map(noiseVal, 0.65, 1.0, 70, 250), 
          map(noiseVal, 0.65, 1.0, 180, 250), 
          map(noiseVal, 0.65, 1.0, 60, 250));
        colorgrid[x][y] = fillColor;
        //landgrid[x][y] = new Land(fillColor, ',');
      }
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < height/cellsize; i++) {
    for (int j = 0; j < width/cellsize; j++) {
      fill(colorgrid[j][i]);
      noStroke();
      rect(j*cellsize, i*cellsize, cellsize, cellsize);
      //landgrid[j][i].display(j*cellsize, i*cellsize, cellsize, cellsize);
    }
  }
}


//class Land {
//  color landColor;
//  char landChar;

//  Land(color c, char r) {
//    landColor = c;
//    landChar = r;
//  }

//  void display(int x, int y, int w, int h) {
//    fill(landColor);
//    noStroke();
//    rect(x, y, w, h);
//    fill(0);
//    text(landChar, x + w/2, y + w/2);
//  }
//}