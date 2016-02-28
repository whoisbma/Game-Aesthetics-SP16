//PALETTE SHIFTING

//this sketch is only an aesthetic/educational exercise -
//its extremely inefficient to change an image call to drawing grids of rectangles instead.

PImage tile;
int[][] pix;
int cellsize = 5;
int speed = 5;
color[] colors;

void setup() {
  size(500, 500);
  noStroke();

  tile = loadImage("waterfall.png");

  colors = new color[3];

  for (int k = 0; k < colors.length; k++) {
    colors[k] = color(0);
  }

  pix = new int[tile.width][tile.height];

  for (int i = 0; i < tile.height; i++) {
    for (int j = 0; j < tile.width; j++) {
      pix[j][i] = -1;

      //for each pixel in our data, get the color
      color c = tile.get(j, i);

      //check to see if the color matches any other colors
      boolean match = false;
      for (int k = 0; k < colors.length; k++) {
        if (c == colors[k]) {
          match = true;
        }
      }

      //if it doesn't, assign it to our color table
      if (match == false) {
        for (int k = colors.length-1; k > 0; k--) {
          colors[k] = colors[k-1];
        }
        colors[0] = c;
      }
    }
  }


  //loop through again, get the color at each position in the tile, 
  //assign it to a value in our color table.
  for (int i = 0; i < tile.height; i++) {
    for (int j = 0; j < tile.width; j++) {
      int c = tile.get(j, i);
      fill(c);
      for (int k = 0; k < colors.length; k++) {
        if (c == colors[k]) {
          pix[j][i] = k;
        }
      }
    }
  }
}

void draw() {

  for (int n = 0; n < 7; n++) {
    for (int m = 0; m < 6; m++) {
      for (int i = 0; i < tile.height; i++) {
        for (int j = 0; j < tile.width; j++) {
          fill(colors[pix[j][i]]);
          rect((j*cellsize)+(tile.width*cellsize*n), (i*cellsize)+(tile.width*cellsize*m), cellsize, cellsize);
        }
      }
    }
  }

  for (int k = 0; k < colors.length; k++) {
    fill(colors[k]);
    rect(k*cellsize*3, height-cellsize*3, cellsize*3, cellsize*3);
  }


  if (frameCount % speed == 0) {
    color temp = colors[colors.length-1];
    for (int k = colors.length-1; k > 0; k--) {
      colors[k] = colors[k-1];
    }
    colors[0] = temp;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (speed > 1) {
        speed--;
        println(speed);
      }
    }
    if (keyCode == LEFT) {
      if (speed < 30) {
        speed++;
        println(speed);
      }
    }
  }
}