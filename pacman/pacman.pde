Player p;
float sizeMult;

int[][] map = new int[][]{
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 0, 1, 0, 1}, 
  {1, 0, 0, 0, 1, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 0, 1, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 0, 1, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 0, 0, 0, 0, 1, 0, 1}, 
  {1, 0, 1, 1, 0, 1, 1, 1, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}};

void setup() {
  size(100, 100);
  sizeMult = width/10;
  pixelDensity(2);
  //frameRate(30);
  p = new Player();
}

void draw() {
  background(255);
  p.getInput();
  p.move();
  for (int i = 0; i < map.length; i++) {
    for (int j = 0; j < map[0].length; j++) {
      if (map[i][j] == 1) {
        fill(150);
        stroke(100);
        rect(i*sizeMult, j*sizeMult, sizeMult, sizeMult);
      }
    }
  }
  p.display();
  Keyboard.reset();
}


void keyPressed() {
  if (key == CODED) {
    Keyboard.isKeyDown(keyCode);
  }
}

void keyReleased() {
  if (key == CODED) {
    Keyboard.isKeyUp(keyCode);
  }
}