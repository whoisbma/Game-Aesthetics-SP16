//BSP PRINCIPLES 4
//this takes bsp3, and adds a walker that gets created by each room.
//the walker moves around in steps of 3 looking for another room, then stops.
//we use a while loop to make sure that it moves around until it finds one.
//this is a very rudimentary implementation and not perfect, but it demonstrates the general idea.

int[][] grid;
final int CELLSIZE = 10;
int GRIDW;
int GRIDH;

int numSteps = 4;
ArrayList<Room> rooms = new ArrayList<Room>();

void setup() {
  size(1000, 500);
  noSmooth();
  GRIDW = width/CELLSIZE;
  GRIDH = height/CELLSIZE;
  grid = new int[GRIDW][GRIDH];

  for (int i = 0; i < GRIDH; i++) {
    for (int j = 0; j < GRIDW; j++) {
      grid[j][i] = 0;
    }
  }

  cut(0, 0, GRIDW, GRIDH, numSteps);

  for (int i = 0; i < rooms.size(); i++) {
    Room r = rooms.get(i);
    boolean roomTouched = false;
    Walker w = new Walker(r.newX + r.newW/2, r.newY + r.newH/2);
    while (!roomTouched) {
      w.update();
      for (int j = 0; j < rooms.size(); j++) {
        if (j != i) {
          Room otherR = rooms.get(j);
          if (w.touchingRoom(otherR)) {
            roomTouched = true;
            println("found room");
          }
        }
      }
    }
  }
}

void draw() {
  background(0);
  for (int i = 0; i < GRIDH; i++) {
    for (int j = 0; j < GRIDW; j++) {
      if (grid[j][i] == 1) {
        //fill(255);
        text('.',j*CELLSIZE, i*CELLSIZE + CELLSIZE); //offsetting slightly for the text alignment
      } else if (grid[j][i] == 2) {
        //fill(150);
        text('-',j*CELLSIZE, i*CELLSIZE + CELLSIZE);
      } else {
        //fill(0);
        text('#',j*CELLSIZE, i*CELLSIZE + CELLSIZE);
      }
      //rect(j*CELLSIZE, i*CELLSIZE, CELLSIZE, CELLSIZE);
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
        grid[j][i] = 1;
      }
    }
  }
}

class Walker {
  int x;
  int y;

  Walker(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    int dir = floor(random(4));
    switch (dir) {
    case 0:
      if (y > 2) {
        y-=3;
        for (int i = 0; i <= 3; i++) {
          if (grid[x][y+i] == 0) {
            grid[x][y+i] = 2;
          }
        }
      }
      break;
    case 1:
      if (x < GRIDW-4) {
        x+=3;
        for (int i = 0; i <= 3; i++) {
          if (grid[x-i][y] == 0) {
            grid[x-i][y] = 2;
          }
        }
      }
      break;
    case 2:
      if (y < GRIDH-4) {
        y+=3;
        for (int i = 0; i <= 3; i++) {
          if (grid[x][y-i] == 0) {
            grid[x][y-i] = 2;
          }
        }
      }
      break;
    case 3:
      if (x > 2) {
        x-=3;
        for (int i = 0; i <= 3; i++) {
          if (grid[x+i][y] == 0) {
            grid[x+i][y] = 2;
          }
        }
      }
      break;
    default:
      break;
    }
  }

  boolean touchingRoom(Room r) {
    if (x >= r.newX && x <= r.newX+r.newW &&
      y >= r.newY && y <= r.newY+r.newH) {
      return true;
    } else {
      return false;
    }
  }
}