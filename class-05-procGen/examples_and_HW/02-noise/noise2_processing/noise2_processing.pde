/*
NOISE EXAMPLE 2
ISOLATING NOISE RANGES

here instead of mapping our 0-1 noise value to 0-255,
we're setting hardcoded values based on noise ranges, 
and using those set values to draw rectangles.
0-0.4 = 0
0.4-0.65 = 120
0.65-0.85 = 180
0.85-1.0 = 255

we could use the same process to set values not related to color.
this might be a reason we don't want a gradient.
for example we could set "land types" based on noise ranges.

this is the purpose of the other 2D array of strings. (lands)
try uncommenting the lines using it, and adding additional ranges and types.

also notice we've moved the noise claculation to setup() only. 
in an example like this, where we use noise to generate "land", 
we wouldn't want it running every frame in the draw loop, we'd want it to only create the world once.
*/

//int[][] grid;   
String[][] lands;
int cellsize = 10;

void setup() {
  size(640, 480);
  //grid = new int[width/cellsize][height/cellsize];
  lands = new String[width/cellsize][height/cellsize];
  //noiseSeed(0);
  
  background(0);
  noiseDetail(4, 0.7);  
  float increment = 0.06; 
  
  float xoff = 0.0;   //start counting in our "noise map" at x: 0
  for (int x = 0; x < width/cellsize; x++) {
    xoff += increment;
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height/cellsize; y++) {
      yoff += increment;
      float noiseVal = noise(xoff, yoff);
      if (noiseVal < 0.4) {
        //grid[x][y] = 0;
        lands[x][y] = "ocean";
      } else if (noiseVal >= 0.4 && noiseVal < 0.65) {
        //grid[x][y] = 120;
        lands[x][y] = "plains";
      } else if (noiseVal >= 0.65 && noiseVal < 0.85) {
        //grid[x][y] = 180;
        lands[x][y] = "hills";
      } else if (noiseVal >= 0.85) {
        //grid[x][y] = 255;
        lands[x][y] = "mountains";
      } 
    }
  }
  
}

void draw() {
  background(0);
  for (int i = 0; i < height/cellsize; i++) {
    for (int j = 0; j < width/cellsize; j++) {
      //fill(grid[j][i]);
      //noStroke();
      //rect(j*cellsize, i*cellsize, cellsize, cellsize);
      
      //draw text instead of a rectangle, using the lands string to choose which one.
      //make sure to comment out the rect-drawing line above first.
      if (lands[j][i].equals("ocean")) {
       fill(0,0,255);
       text('~', j*cellsize, i*cellsize);
      } else if (lands[j][i].equals("plains")) {
       fill(0,255,0);
       text(',', j*cellsize, i*cellsize);
      } else if (lands[j][i].equals("hills")) {
       fill(255,255,0);
       text('^', j*cellsize, i*cellsize);
      } else if (lands[j][i]. equals("mountains")) {
       fill(100);
       text('/', j*cellsize, i*cellsize);
      }
    }
  }
}