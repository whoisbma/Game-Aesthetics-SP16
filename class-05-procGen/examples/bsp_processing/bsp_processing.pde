int dir;
int pos;

void setup() {
  size(500, 500);
  rect(50, 50, width-100, height-100);
  //fill(255,100);
  cut(50, 50, width-100, height-100, 4);
}

void draw() {
}

void cut(int x, int y, int w, int h, int step) {
  if (w > 0 && h > 0) {
    if (step > 0) {
      step--;
      dir = floor(random(2));
      stroke(0);
      if (dir == 0) {
        pos = floor(random(0+h*0.4, h-h*0.4));
        rect(x, y, w, pos);
        rect(x, y+pos, w, h-pos);

        cut(x, y, w, pos, step);
        cut(x, y+pos, w, h-pos, step);
      }
      if (dir == 1) {
        pos = floor(random(0+w*0.4, w-w*0.4));
        rect(x, y, pos, h);
        rect(x+pos, y, w-pos, h);

        cut(x, y, pos, h, step);
        cut(x+pos, y, w-pos, h, step);
      }
    }
  }
}

class Room {
  int x;
  int y;
  int w;
  int h;

  Room(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
}