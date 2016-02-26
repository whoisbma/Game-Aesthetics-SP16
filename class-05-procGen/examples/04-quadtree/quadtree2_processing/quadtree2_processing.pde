//QUADTREE PRINCIPLES 2
//this sketch demonstrates how you might draw smaller rooms inside the areas that the quadtree carves out
//we use a dynamic data structure (arraylist in this case) to push rooms to, then draw them all
//in addition, each Room's constructor creates a new, smaller room.
//you may be able to imagine how you might create hallways between them.
//one way that could be viable is actually creating a walker at each room location
//and if it hits a room within a set number of steps, carve out those spaces in a corresponding array. 

int numSteps = 3;

ArrayList<Room> rooms = new ArrayList<Room>();

void setup() {
  size(500, 500);
  background(255);
  cut(0, 0, width, height, numSteps);
  println(rooms.size());
}

void draw() {
  for (int i = 0; i < rooms.size(); i++) {
    Room r = rooms.get(i);
    r.display();
  }

  for (int i = 0; i < rooms.size(); i++) {
    Room r = rooms.get(i);
    r.newDisplay();
  }
}

void cut(int x, int y, int w, int h, int step) {
  if (step > 0) {
    step--;
    //rect(x, y, w, h);
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

    while (area < 50) {

      newX = (int)random(x, x+w/2);
      newY = (int)random(y, y+h/2);

      newW = (int)random(0, (x+w)-newX);
      newH = (int)random(0, (y+h)-newY);
      
      area = newW & newH;
    }
  }

  void display() {
    stroke(0);
    fill(150);
    rect(x, y, w, h);
  }

  void newDisplay() {
    stroke(255);
    fill(255);
    rect(newX, newY, newW, newH);
  }
}