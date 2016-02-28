PImage tile;
PImage palette;
PShader shift;
float paletteIndex = 0.0;

void setup() {
  size(500, 500, P2D);
  tile = loadImage("waterfall.png");
  palette = loadImage("palette.png");
  shift = loadShader("shift.glsl");
}

void draw() {
  shift.set("tile", tile);
  shift.set("palette", palette);
  shift.set("paletteIndex", paletteIndex);
  shader(shift);
  for (int x = 0; x < width; x+=16) {
    for (int y = 0; y < height; y+=16) {
      drawOutput(x, y,16, 16);
    }
  }

  //drawOutput(0, 0, width, height);

  if (frameCount % 7 == 0) {
    if (paletteIndex < 0.6) {
      paletteIndex = (paletteIndex + 0.3);
    } else {
      paletteIndex = 0.0;
    }
  }
}

void drawOutput(float x, float y, float w, float h) {
  pushMatrix();
  translate(x, y);
  noStroke();
  beginShape(QUAD);
  vertex(0, 0, 0, 0);
  vertex(w, 0, 1, 0);
  vertex(w, h, 1, 1);
  vertex(0, h, 0, 1);
  endShape();
  popMatrix();
}