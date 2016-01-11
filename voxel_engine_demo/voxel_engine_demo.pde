final static int WIDTH = 512;
final static int HEIGHT = 256;
final static int DEPTH = 400;

byte[] vHeight;
byte[] colorindex;

double xp, yp;
int hp, vp;

int[] paletteR;
int[] paletteG;
int[] paletteB;

void setup() {
  size(512, 256);

  vHeight = new byte[0x100000];
  colorindex = new byte[0x100000];

  xp = 512;
  yp = 800;
  hp = -50;
  vp = -100;

  byte[] palette = new byte[256*3];
  paletteR = new int[256];
  paletteG = new int[256];
  paletteB = new int[256];
  for (int k = 0; k < 256; k++) {
    paletteR[k] = k;
    paletteG[k] = k;
    paletteB[k] = k;
  }
}


void draw() {
  loadPixels();
  raycast(0, 0.0, 0.0, 0.0, 0.0, 0.0, pixels);
  updatePixels();
}

public void raycast(int line, double x1, double y1, double x2, double y2, double d, color[] raster) {
  int[] rColor = new int[4];

  double dx = x2 - x1;
  double dy = y2 - y1;

  double r = Math.sqrt(dx * dx + dy * dy);
  dx = dx/r;
  dy = dy/r;

  rColor[0] = 0;
  rColor[1] = 0;
  rColor[2] = 255;

  int ymin = 256;
  for (int i = 0; i < r - 20; i++) {
    rColor[0] = 255;
    rColor[1] = 255;
    rColor[2] = 255;

    x1 += dx;
    y1 += dy;

    int h = vHeight[((int) y1 & 1023) * 1024 + ((int) x1 & 1023)];
    h = 256-h;
    byte ci = colorindex[((int) y1 & 1023) * 1024 + ((int) x1 & 1023)];

    rColor[0] = paletteR[ci & 0xFF];
    rColor[1] = paletteG[ci & 0xFF];
    rColor[2] = paletteB[ci & 0xFF];

    h = h - 128 + hp;
    double y3 = yp - y1;
    double z3 = h / y3 * 100 - vp;
    
    if (z3 < 0) {
      z3 = 0;
    }
    
    if (z3 < HEIGHT - 1) {
      int offset = (int) z3 * WIDTH + line;
      for (int k = (int) z3; k < ymin; k++) {
        
    }
  }
}