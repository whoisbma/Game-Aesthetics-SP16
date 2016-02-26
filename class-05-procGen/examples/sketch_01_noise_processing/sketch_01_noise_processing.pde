/*
NOISE EXAMPLE 1
APPLICATION TO GRID

if you are unfamiliar with perlin noise, watch the following Dan Shiffman video: https://vimeo.com/58492076
and check out the examples at https://processing.org/examples/noisewave.html and https://processing.org/examples/noise2d.html

noise works like a big "map" of values that range from 0 to 1.
this is kind of similar to like "sin" which will give us a 1D map of values that range from -1 to 1,
but noise doesn't oscillate up and down regularly - it results in natural-seeming slopes and movements.

in addition, because it uses randomness, we can supply it with a "seed" value with noiseSeed (line 38)
that will give us the same noise result each time. try changing this number, or commenting this line out entirely.
  
in order to access the "map" of noise, 
we need to supply the noise() function with values that change in all the axes we want to look at on the map.
this is why we need an x offset (xoff) and y offset (yoff) value. (line 46 and 53)
as those values change, we will get a new result from 0 to 1.
  
finally, we can multiple that 0-1 value by 255 to get a number from 0 to 255, (line 57)
and we can assign that value to the equivalent position on the grid.
  
the "increment" value is what will "move" our xoff and yoff variables through the noise map.
with a smaller incrementation, we'll see smaller differences between tiles - 0.54, to 0.53, to 0.52, etc.
with a higher incrementation, we'll see larger differences between them - 0.54, to 0.46, to 0.41, etc.
  
finally noiseDetail lets you change additional aspects of how the noise value gets generated. 
play around with all of these values and see how things change.
*/

float increment = 0.08;

int[][] grid;
int cellsize = 10;

void setup() {
  size(640, 480);
  grid = new int[width/cellsize][height/cellsize];
  noiseSeed(0);
}

void draw() {
  float xoff = 0.0;   //start counting in our "noise map" at x: 0
  noiseDetail(4, 0.7);  //try changing these values
  
  // For every x,y to correspond to our 2D grid, calculate a noise value and produce a brightness value
  for (int x = 0; x < width/cellsize; x++) {
    xoff += increment;
    float yoff = 0.0;   // For every xoff, start yoff at 0
    for (int y = 0; y < height/cellsize; y++) {
      yoff += increment;
      float brightness = noise(xoff, yoff) * 255;
      
      //try uncommenting the following to see how you can "move" through the noisemap in the x and y offset:
      //float brightness = noise(xoff + mouseX * 0.01, yoff + mouseY * 0.01) * 255;
      
      //to get some animation by moving through our noise map in a THIRD dimension, try uncommenting the following:
      //float brightness = noise(xoff, yoff, frameCount * 0.005) * 255;
      
      grid[x][y] = floor(brightness);
    }
  }
  
  for (int i = 0; i < height/cellsize; i++) {
    for (int j = 0; j < width/cellsize; j++) {
      fill(grid[j][i]);
      noStroke();
      rect(j*cellsize, i*cellsize, cellsize, cellsize);
    }
  }
}