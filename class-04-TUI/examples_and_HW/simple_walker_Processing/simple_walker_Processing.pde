Walker walker;

void setup() {
  size(20,20);
  walker = new Walker();
}

void draw() {
  walker.update();
  walker.draw();
}

class Walker {
  int x;
  int y;
  int numMoves = 0;
  int MAXMOVES = 200;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void update() {
    if (numMoves < MAXMOVES) {
      int r = floor(random(4));
      if (r == 0) {
        y--;
      } else if (r == 1) {
        x++;
      } else if (r == 2) {
        y++;
      } else if (r == 3) {
        x--;
      }
      numMoves++;
    }
  }

  void draw() {
    point(x, y);
  }
}