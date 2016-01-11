PVector pos = new PVector(12, 12);
PVector dir = new PVector(0, 1);
PVector plane = new PVector(1, 0);
float rot = 0.0;

int gameWidth;
int gameHeight;

float lastTime;

boolean keyUp, keyDown, keyLeft, keyRight;

float walkSpeed = 0.005;
float rotSpeed = 0.025;



int[][] worldMap = new int[][] {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  {1, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 2, 0, 3, 3, 2, 2, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1}, 
  {1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1}, 
  {1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 3, 3, 3, 3, 3, 3, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 2, 3, 0, 0, 0, 0, 0, 2, 2, 2, 2, 1, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 2, 2, 2, 2, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 3, 3, 3, 3, 3, 3, 3, 0, 0, 3, 0, 0, 0, 2, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 2, 0, 0, 0, 2, 0, 0, 3, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
};

void setup() {
  size(1100, 600, P2D);
  gameWidth = width;
  gameHeight = height;
  noSmooth();
}


void draw() {
  background(20);
  noStroke();
  fill(180);
  rect(0, 0, width, height/2); 
  fill(130);
  rect(0, height/2, width, height);
 
  float dt = millis() - lastTime;

  update(dt);
  raycast();

  lastTime = millis();
}

void update(float dt) {
  dir.x = cos(rot);
  dir.y = -sin(rot);  //play with these to really screw things up
  plane.x = sin(rot);
  plane.y = cos(rot);

  if (keyLeft) {
    rot += rotSpeed;
  }
  if (keyRight) {
    rot -= rotSpeed;
  }
  if (keyUp) {
    //no collision version
    //pos.add(new PVector( dir.x * walkSpeed * dt, dir.y * walkSpeed * dt));
    if (worldMap[(int)(pos.x + dir.x * walkSpeed * dt)][(int)pos.y] == 0) {
      pos.x += dir.x * walkSpeed * dt;
    }
    if (worldMap[(int)pos.x][(int)(pos.y + dir.y * walkSpeed * dt)] == 0) {
      pos.y += dir.y * walkSpeed * dt;
    }
  }
  if (keyDown) {
    //no collision version
    //pos.add(new PVector(-dir.x * walkSpeed * dt, -dir.y * walkSpeed * dt));
    if (worldMap[(int)(pos.x - dir.x * walkSpeed * dt)][(int)pos.y] == 0) {
      pos.x -= dir.x * walkSpeed * dt;
    }
    if (worldMap[(int)pos.x][(int)(pos.y - dir.y * walkSpeed * dt)] == 0) {
      pos.y -= dir.y * walkSpeed * dt;
    }
  }
}

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
    case UP:
      keyUp = true;
      break;
    case DOWN:
      keyDown = true;
      break;
    case LEFT:
      keyLeft = true;
      break;
    case RIGHT:
      keyRight = true;
      break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
    case UP:
      keyUp = false;
      break;
    case DOWN:
      keyDown = false;
      break;
    case LEFT:
      keyLeft = false;
      break;
    case RIGHT:
      keyRight = false;
      break;
    }
  }
}

void raycast() {
  PVector rayPos = new PVector(0, 0);
  PVector rayDir = new PVector(0, 0);

  //cast rays
  for (int x = 0; x < gameWidth; x++) {
    //calculate ray position and direction
    //cameraX will drive the direction of the rays by taking the result of scaling the right vector.
    float cameraX = (2 * x / (float)gameWidth) - 1; //x coordinate in camera space

    rayPos.set(pos.x, pos.y);
    //rayDir.set(dir.x + plane.x * cameraX, dir.y + plane.y * cameraX);  //no FOV control
    rayDir.set(dir.x + (plane.x) * cameraX, 
      dir.y + (plane.y) * cameraX);

    //the current square of the map the ray is in
    int mapX = (int)rayPos.x;
    int mapY = (int)rayPos.y;

    //DDA (Digital Differential Analysis) algorithm always jumps exactly one square each loop, 
    //either a square in the x-direction or a square in the y-direction.
    //if it has to go in the negative or positive x-direction, and the negative or positive y-direction
    //will depend on the direction of the ray, and this will be stored in stepX and stepY (either -1 or +1)

    //length of ray from current position to next x or y-side
    float sideDistX;
    float sideDistY;

    //distance the ray has to travel to go from 1 x-side to the next x-side 
    //or from 1 y-side to the next y-side
    //float deltaDistX = sqrt(1 + (rayDir.y * rayDir.y) / (rayDir.x * rayDir.x)); 
    //float deltaDistY = sqrt(1 + (rayDir.x * rayDir.x) / (rayDir.y * rayDir.y));

    // or?
    // scale the vector by the inverse of the x component,
    // which makes the x component equal to one.
    // then calculate the magnitude
    float scaleX = 1.0 / rayDir.x;
    float scaleY = 1.0 / rayDir.y;
    float deltaDistX = (new PVector(1, rayDir.y * scaleX)).mag();  //screw with this for more rendering madness
    float deltaDistY = (new PVector(1, rayDir.x * scaleY)).mag(); 

    float wallDist;

    //what direction to step in x or y (+1 or -1)
    int stepX;
    int stepY;

    //was there a wall hit?
    int hit = 0;
    //was a NS or EW wall hit?
    int side = 0;

    //calculate step and initial sideDist
    //if the ray direction has a negative x-component, 
    //sideDistX is the distance from ray starting position to the first side to the left, etc.
    //for these values, the integer value mapX is used and the real position subtracted from it, 
    //and 1.0 is added in some of the cases depending if the side to the left or right or top or bottom is used. 
    //then you get the perpendicular distance to this side, 
    //so multiply it with deltaDistX or deltaDistY to get the real oblique distance
    if (rayDir.x < 0) {
      stepX = -1;
      sideDistX = (rayPos.x - mapX) * deltaDistX;
    } else {
      stepX = 1;
      sideDistX = (mapX + 1.0 - rayPos.x) * deltaDistX;
    }
    if (rayDir.y < 0) {
      stepY = -1;
      sideDistY = (rayPos.y - mapY) * deltaDistY;
    } else {
      stepY = 1;
      sideDistY = (mapY + 1.0 - rayPos.y) * deltaDistY;
    }


    //start DDA 
    //its a loop that increments the ray with 1 square every time, until a wall is hit.
    //each time, it either jumps a square in the x-direction (w stepX) or y - it always jumps 1 square at once
    //if the ray's direction would be the x-direction, the loop will only have to jump a square in the x-direction every time, 
    //because the ray will never change its y-direction, etc.
    //sideDistX and sideDistY get incremented with deltaDistX with every jump in their direction,
    //and mapX and mapY get incremented with stepX and stepY respectively
    //when the ray has hit a wall, the loop ends, and then we'll know whether an x-side or y-side was hit in "side"
    //and what wall was hit with mapX and mapY
    //we won't know exactly where the wall was hit, but that's not needed for no-texture walls.

    while (hit == 0) {
      //jump to next map square, OR in x-direction, OR in y-direction
      if (sideDistX < sideDistY) {
        sideDistX += deltaDistX;
        mapX += stepX;
        side = 0;
      } else {
        sideDistY += deltaDistY;
        mapY += stepY;
        side = 1;
      }
      //check to see if ray has hit a wall
      if (worldMap[mapX][mapY] > 0) {
        hit = 1;
      }
    }

    //after DDA is complete, calculate the distance of the ray to the wall
    //so we can calculate how high the wall has to be drawn after this.
    //we don't use the oblique distance however, but instead only the distance perpendicular to the camera plane
    //(projected on the camera direction) to avoid the fisheye effect.
    //the fisheye effect is an effect you see if you use the real distance, where all walls become rounded
    //the fisheye effect is avoided by the way distance is calculated here 
    //(and its easier to calculate this perpendicular distance; we don't need to know the exact location where the wall was hit)
    //(1-stepX)/2 = 1 if stepX = -1 and 0 if stepX is +1  -
    //this is needed because we need to add 1 to the length when rayDir.x < 0, 
    //this is for the same reason why 1.0 was added to the initial value of sideDistX in one case but not in the other.
    //the distance is then calculated as follows - if an x-side is hit, mapX-rayPosX+(1-stepX)/2) 
    // is the number of squares the ray has crossed in X direction.
    //if the ray is perpendicular on the X side, this is the correct value already, 
    //but because the direction of the ray is different most of the time,
    //it's real perpendicular distance will be larger, so we divide it through the X coordinate of the rayDir vector

    //calculate distance projected on camera direction (oblique distance will give fisheye effect!)
    if (side == 0) {
      wallDist = abs((mapX - rayPos.x + (1.0 - stepX) / 2.0) / rayDir.x);
    } else {
      wallDist = abs((mapY - rayPos.y + (1.0 - stepY) / 2.0) / rayDir.y);
    }

    //bma testing... distance to uniform grid point
    //wallDist = dist(pos.x, pos.y, mapX, mapY);

    //bma testing - fishbowl effect? nope

    //out of the calculated distance, calculate the height of the line that has to be drawn on screen
    //this is the inverse of wallDist, then multiplied by the screen height, to bring it to pixel coordinates.
    //(or another value if you want walls to be higher or lower)
    //out of this lineHeight (the height of the vertical line that should be drawn), 
    //the start and end position of where we should really draw are calculated.
    //the center of the wall should be at the center of the screen, 
    //and if these points lie outside the screen, they're capped to 0 or h-1

    //calculate height of line to draw on screen
    float lineHeight = abs(gameHeight/wallDist);
    lineHeight = min(lineHeight, gameHeight);

    //depending on what number the wall that was hit was, a color is chosen.
    //if a y-side was hit, the color is darker (for fake shading)
    if (mapX >= 0 && mapY >= 0) {
      switch (worldMap[mapX][mapY]) {
      case 0:
        break;
      case 1:
        stroke(200, 150, 150);
        break;
      case 2:
        stroke(50, 100, 100);
        break;
      case 3:
        stroke(150, 75, 100);
        break;
      }
    }

    if (side == 1) {
      switch (worldMap[mapX][mapY]) {
      case 1:
        stroke(200/2, 150/2, 150/2);
        break;
      case 2:
        stroke(50/2, 100/2, 100/2);
        break;
      case 3:
        stroke(150/2, 75/2, 100/2);
        break;
      }
    }

    //center the line
    float startY = height/2 - lineHeight/2;
    line(x, startY, x, startY + lineHeight);
  }
}