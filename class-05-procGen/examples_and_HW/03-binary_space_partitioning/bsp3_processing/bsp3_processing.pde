//BSP PRINCIPLES 3
//this is the same approach as in bsp2, 
//except now we apply it to the grid!

boolean[][] grid;
final int CELLSIZE = 10;
int GRIDW;
int GRIDH;

int numSteps = 3;
ArrayList<Room> rooms = new ArrayList<Room>();

void setup() {
  size(500, 500);
  GRIDW = width/CELLSIZE;
  GRIDH = height/CELLSIZE;
  grid = new boolean[GRIDW][GRIDH];

  for (int i = 0; i < GRIDH; i++) {
    for (int j = 0; j < GRIDW; j++) {
      grid[j][i] = false;
    }
  }

  cut(0, 0, GRIDW, GRIDH, numSteps);
}

void draw() {
  background(0);
  for (int i = 0; i < GRIDH; i++) {
    for (int j = 0; j < GRIDW; j++) {
      if (grid[j][i]) {
        fill(255);
      } else {
        fill(0);
      }
      rect(j*CELLSIZE, i*CELLSIZE, CELLSIZE, CELLSIZE);
    }
  }
}

void cut(int x, int y, int w, int h, int step) {
  println("cutting");
  if (step > 0) {
    step--;
    int dir = floor(random(2));
    int newPos;
    switch (dir) {
    case 0:
      newPos = w/2;
      cut(x, y, newPos, h, step);
      cut(x+newPos, y, newPos, h, step);

      if (step == 0) {
        rooms.add(new Room(x, y, newPos, h));
        rooms.add(new Room(x+newPos, y, newPos, h));
      }
      break;
    case 1:
      newPos = h/2;
      cut(x, y, w, newPos, step);
      cut(x, y+newPos, w, newPos, step);

      if (step == 0) {
        rooms.add(new Room(x, y, w, newPos));
        rooms.add(new Room(x, y+newPos, w, newPos));
      }
      break;
    default:
      break;
    }
  }
}

class Room {
  int x;
  int y;
  int w;
  int h;

  int newX;
  int newY;
  int newW;
  int newH;

  int area;

  Room(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;


    while (area < 1) {
      newX = (int)random(x, x+w/2);
      newY = (int)random(y, y+h/2);

      newW = (int)random(0, (x+w)-newX);
      newH = (int)random(0, (y+h)-newY);

      area = newW & newH;
    }

    for (int i = newY; i < newY+newH; i++) {
      for (int j = newX; j < newX+newW; j++) {
        grid[j][i] = true;
      }
    }
  }

  //void display() {
  //  stroke(0);
  //  fill(255);
  //  rect(x, y, w, h);
  //}

  void newDisplay() {
    noStroke();
    fill(255);
    rect(newX, newY, newW, newH);
  }
}