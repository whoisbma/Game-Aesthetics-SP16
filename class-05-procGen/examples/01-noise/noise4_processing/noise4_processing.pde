/*
NOISE EXAMPLE 4
 LAYERING NOISE
 
 This example multiplies two different noise maps together.
 They are different because they use two different increment values to "step" through the map.
 One steps at a pace comparable to the last examples.
 The other one steps very quickly, meaning we see more variation.
 If we multiply those two together, we see a mix of smooth changes with some extra detail.
 Try comparing this to running only the results of noiseVal1 or noiseVal2 alone.
 
 The reason you might layer multiple noise results together is to get a more nuanced result.
 */

int[][] colorgrid;
int cellsize = 5;

void setup() {
  size(640, 480);
  colorgrid = new int[width/cellsize][height/cellsize];
  noiseSeed(0);

  background(0);

  float noiseVal1 = 0;
  float noiseVal2 = 0;

  noiseDetail(7, 0.4);  
  float increment1 = 0.09;
  float increment2 = 0.55;
  float xoff1 = 0.0;
  float xoff2 = 0.0;
  for (int x = 0; x < width/cellsize; x++) {
    xoff1 += increment1;
    xoff2 += increment2;
    float yoff1 = 0.0;
    float yoff2 = 0.0;
    for (int y = 0; y < height/cellsize; y++) {
      yoff1 += increment1;
      yoff2 += increment2;
      noiseVal1 = noise(xoff1, yoff1);
      noiseVal2 = noise(xoff2, yoff2);

      //smooth out noiseVal2 a little bit, weight it towards 1, 
      //this is just to make a lighter visual effect for us, not necessary for the idea
      noiseVal2 = map(noiseVal2, 0, 1, 0.4, 1.0);

      float combinedNoise = noiseVal1 * noiseVal2;
      colorgrid[x][y] = floor(map(combinedNoise, 0, 1, 0, 255));
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
    }
  }
}