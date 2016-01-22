class Player {
  PVector pos;
  int dir;
  int nextDir;
  float speed;
  color c;

  Player() {
    pos = new PVector(1.5, 1.5);
    dir = UP;
    speed = 0.1;
    c = color(200, 200, 0);
  }

  //for timed moves
  boolean spaceEmpty(int d) {
    float skipSpace = 0.15;
    switch (d) {
    case UP:
      return (map[(int)(floor(pos.x))][(int)(pos.y-speed-0.5)] == 0 &&
        map[(int)(floor(pos.x-skipSpace))][(int)(pos.y-speed-0.5)] == 0 &&
        map[(int)(floor(pos.x+skipSpace))][(int)(pos.y-speed-0.5)] == 0);
    case DOWN:
      return (map[(int)(floor(pos.x))][(int)(pos.y+speed+0.5)] == 0 &&
        map[(int)(floor(pos.x-skipSpace))][(int)(pos.y+speed+0.5)] == 0 &&
        map[(int)(floor(pos.x+skipSpace))][(int)(pos.y+speed+0.5)] == 0);
    case LEFT:
      return (map[(int)(pos.x-speed-0.5)][(int)(floor(pos.y))] == 0 &&
        map[(int)(pos.x-speed-0.5)][(int)(floor(pos.y-skipSpace))] == 0 &&
        map[(int)(pos.x-speed-0.5)][(int)(floor(pos.y+skipSpace))] == 0);
    case RIGHT:
      return (map[(int)(pos.x+speed+0.5)][(int)(floor(pos.y))] == 0 &&
        map[(int)(pos.x+speed+0.5)][(int)(floor(pos.y-skipSpace))] == 0 &&
        map[(int)(pos.x+speed+0.5)][(int)(floor(pos.y+skipSpace))] == 0);
    default:
      return false;
    }
  }

  //for queued moves
  boolean spaceEmptyStrict(int d) {
    switch (d) {
    case UP:  
      return (map[(int)(floor(pos.x))][(int)(pos.y-speed-0.5)] == 0 &&
        map[(int)(floor(pos.x-0.45))][(int)(pos.y-speed-0.5)] == 0 &&
        map[(int)(floor(pos.x+0.45))][(int)(pos.y-speed-0.5)] == 0);
    case DOWN:
      return (map[(int)(floor(pos.x))][(int)(pos.y+speed+0.5)] == 0 &&
        map[(int)(floor(pos.x-0.45))][(int)(pos.y+speed+0.5)] == 0 &&
        map[(int)(floor(pos.x+0.45))][(int)(pos.y+speed+0.5)] == 0);
    case LEFT:
      return (map[(int)(pos.x-speed-0.5)][(int)(floor(pos.y))] == 0 &&
        map[(int)(pos.x-speed-0.5)][(int)(floor(pos.y-0.45))] == 0 &&
        map[(int)(pos.x-speed-0.5)][(int)(floor(pos.y+0.45))] == 0);
    case RIGHT:
      return (map[(int)(pos.x+speed+0.5)][(int)(floor(pos.y))] == 0 &&
        map[(int)(pos.x+speed+0.5)][(int)(floor(pos.y-0.45))] == 0 &&
        map[(int)(pos.x+speed+0.5)][(int)(floor(pos.y+0.45))] == 0);
    default:
      return false;
    }
  }

  void getInput() {
    if (Keyboard.downPressed) {
      if (spaceEmpty(DOWN)) {
        nextDir = 0;
        dir = DOWN;
        c = color(0, 0, 255);
      } else {
        nextDir = DOWN;
        c = color(255, 0, 255);
      }
    }
    if (Keyboard.upPressed) {
      if (spaceEmpty(UP)) {
        nextDir = 0;
        dir = UP;
        c = color(0, 0, 255);
      } else {
        nextDir = UP;
        c = color(255, 0, 255);
      }
    }
    if (Keyboard.leftPressed) {
      if (spaceEmpty(LEFT)) {
        nextDir = 0;
        dir = LEFT;
        c = color(0, 0, 255);
      } else { 
        nextDir = LEFT;
        c = color(255, 0, 255);
      }
    }
    if (Keyboard.rightPressed) {
      if (spaceEmpty(RIGHT)) {
        nextDir = 0;
        dir = RIGHT;
        c = color(0, 0, 255);
      } else {
        nextDir = RIGHT;
        c = color(255, 0, 255);
      }
    }
  }

  void move() {
    checkHasDot();

    switch (nextDir) {
    case UP:
      if (spaceEmptyStrict(UP)) {
        dir = UP;
        nextDir = 0;
      }
      break;
    case DOWN:
      if (spaceEmptyStrict(DOWN)) {
        dir = DOWN;
        nextDir = 0;
      }
      break;
    case LEFT:
      if (spaceEmptyStrict(LEFT)) {
        dir = LEFT;
        nextDir = 0;
      }
      break;
    case RIGHT:
      if (spaceEmptyStrict(RIGHT)) {
        dir = RIGHT;
        nextDir = 0;
      }
      break;
    default:
      break;
    }


    switch (dir) {
    case UP:
      if (spaceEmpty(UP)) {
        pos.y -= speed;
        pos.x = floor(pos.x) + 0.5;
      } else {
        pos.x = floor(pos.x) + 0.5;
        pos.y = floor(pos.y) + 0.5;
      }
      break;
    case DOWN:
      if (spaceEmpty(DOWN)) {
        pos.y += speed;
        pos.x = floor(pos.x) + 0.5;
      } else {
        pos.x = floor(pos.x) + 0.5;
        pos.y = floor(pos.y) + 0.5;
      }
      break;
    case LEFT:
      if (spaceEmpty(LEFT)) {
        pos.x -= speed;
        pos.y = floor(pos.y) + 0.5;
      } else {
        pos.x = floor(pos.x) + 0.5;
        pos.y = floor(pos.y) + 0.5;
      }
      break;
    case RIGHT:
      if (spaceEmpty(RIGHT)) {
        pos.x += speed;
        pos.y = floor(pos.y) + 0.5;
      } else {
        pos.x = floor(pos.x) + 0.5;
        pos.y = floor(pos.y) + 0.5;
      }
      break;
    default:
      break;
    }
  }

  void display() {
    fill(0, 0, 255, 100);
    if (spaceEmptyStrict(UP)) {
      rect(floor(pos.x) * sizeMult, floor(pos.y - 1) * sizeMult, sizeMult, sizeMult);
    } 
    if (spaceEmptyStrict(DOWN)) {
      rect(floor(pos.x) * sizeMult, floor(pos.y + 1) * sizeMult, sizeMult, sizeMult);
    } 
    if (spaceEmptyStrict(RIGHT)) {
      rect(floor(pos.x + 1) * sizeMult, floor(pos.y) * sizeMult, sizeMult, sizeMult);
    } 
    if (spaceEmptyStrict(LEFT)) {
      rect(floor(pos.x - 1) * sizeMult, floor(pos.y) * sizeMult, sizeMult, sizeMult);
    }

    fill(255, 0, 0, 100);
    switch (nextDir) {
    case UP:
      ellipse(pos.x * sizeMult, (pos.y - 1) * sizeMult, sizeMult, sizeMult);
      break;
    case DOWN:
      ellipse(pos.x * sizeMult, (pos.y + 1) * sizeMult, sizeMult, sizeMult);
      break;
    case LEFT:
      ellipse((pos.x - 1) * sizeMult, pos.y * sizeMult, sizeMult, sizeMult);
      break;
    case RIGHT:
      ellipse((pos.x + 1) * sizeMult, pos.y * sizeMult, sizeMult, sizeMult);
      break;
    default:
      break;
    }
    fill(200);
    noStroke();
    rect(floor(pos.x) * sizeMult, floor(pos.y) * sizeMult, sizeMult, sizeMult);
    fill(c);
    stroke(0);
    ellipse(pos.x * sizeMult, pos.y * sizeMult, sizeMult/1, sizeMult/1);
    c = color(200, 200, 0);
  }
  
  void checkHasDot() {
    if (dot[floor(pos.x)][floor(pos.y)] == 1) {
      dot[floor(pos.x)][floor(pos.y)] = 0;
    }
  }
}