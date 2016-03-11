final int cellsize = 20;

int[][] grid = {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
  {1, 0, 1, 2, 2, 1, 0, 1, 2, 2, 2, 1, 0, 1, 1, 0, 1, 2, 2, 2, 1, 0, 1, 2, 2, 1, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
  {1, 3, 0, 0, 0, 0, 3, 0, 0, 3, 0, 0, 3, 0, 0, 3, 0, 0, 3, 0, 0, 3, 0, 0, 0, 0, 3, 1}, 
  {1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 3, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 3, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {2, 2, 2, 2, 2, 1, 0, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 0, 1, 2, 2, 2, 2, 2}, 
  {2, 2, 2, 2, 2, 1, 0, 1, 1, 2, 2, 2, 3, 2, 2, 3, 2, 2, 2, 1, 1, 0, 1, 2, 2, 2, 2, 2}, 
  {2, 2, 2, 2, 2, 1, 0, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 0, 1, 2, 2, 2, 2, 2}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 2, 1, 2, 2, 2, 2, 2, 2, 1, 2, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {0, 0, 0, 0, 0, 0, 3, 2, 2, 3, 1, 2, 2, 2, 2, 2, 2, 1, 3, 2, 2, 3, 0, 0, 0, 0, 0, 0}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 2, 1, 2, 2, 2, 2, 2, 2, 1, 2, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {2, 2, 2, 2, 2, 1, 0, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 0, 1, 2, 2, 2, 2, 2}, 
  {2, 2, 2, 2, 2, 1, 0, 1, 1, 3, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 1, 0, 1, 2, 2, 2, 2, 2}, 
  {2, 2, 2, 2, 2, 1, 0, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 0, 1, 2, 2, 2, 2, 2}, 
  {1, 1, 1, 1, 1, 1, 0, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 0, 1, 1, 1, 1, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 3, 0, 0, 3, 0, 0, 0, 1, 1, 0, 0, 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1}, 
  {1, 0, 0, 0, 1, 1, 3, 0, 0, 3, 0, 0, 3, 0, 0, 3, 0, 0, 3, 0, 0, 3, 1, 1, 0, 0, 0, 1}, 
  {1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1}, 
  {1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 1}, 
  {1, 0, 0, 3, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 3, 0, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1}, 
  {1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
};

//we'll use this as a convenient way to remember which value in the array is a wall and 
// also which is a decision cell for the ghosts.
final int WALLCELL = 1;
final int DECISIONCELL = 3;

//we're not storing variables to remember the dot (0) vs. empty space cells (2) but we could.
//if we wanted to remove dots when the player moves over them for example, 
//we could check to see if a cell is a dot (0),
//then change it to a 2.

//player position variables
int playerX = 13;
int playerY = 23;

//ghost position and direction variables
int ghostX = 1;
int ghostY = 1;
int ghostDirX = 1;
int ghostDirY = 0;

int line1x=0;
int line1y=0;
int line2x=0;
int line2y=0;
int line3x=0;
int line3y=0;

void setup() {
  size(561, 621);
  //draw the first time
  drawEverything();
}

//----------------------------------------------------------------
// we're actually only drawing after player movement but we need to include void draw() {} anyway
//----------------------------------------------------------------
void draw() {
}

//----------------------------------------------------------------
// draw the grid, player, and all agents
//----------------------------------------------------------------

void drawEverything() {
  for (int i = 0; i < grid[0].length; i++) {
    for (int j = 0; j < grid.length; j++) {
      noStroke();
      if (grid[j][i] == 1) {
        fill(255);
      } else if (grid[j][i] == 3) {
        fill(0, 150, 25);
      } else {
        fill(0);
      }
      rect(i*cellsize, j*cellsize, cellsize, cellsize);

      if (grid[j][i] == 0) {
        fill(255);
        noStroke();
        ellipse(i*cellsize + cellsize/2, j*cellsize + cellsize/2, 3, 3);
      }
    }
  }
  fill(255, 255, 0);
  rect(playerX * cellsize, playerY * cellsize, cellsize, cellsize);

  fill(255, 0, 255);
  rect(ghostX * cellsize, ghostY * cellsize, cellsize, cellsize);

  drawDebug();
}

void drawDebug() {
  strokeWeight(3);
  if (line1x != 0) {
    fill(255, 150);
    if (dist(line1x, line1y, playerX, playerY) < dist(line2x, line2y, playerX, playerY) &&
      dist(line1x, line1y, playerX, playerY) < dist(line3x, line3y, playerX, playerY)) {

      stroke(0, 0, 255);
      rect(line2x*cellsize, line2y*cellsize, cellsize, cellsize);
      line(line2x*cellsize + cellsize/2, line2y*cellsize + cellsize/2, playerX*cellsize + cellsize/2, playerY*cellsize + cellsize/2);
      if (line3x != 0) {
        rect(line3x*cellsize, line3y*cellsize, cellsize, cellsize);
        line(line3x*cellsize + cellsize/2, line3y*cellsize + cellsize/2, playerX*cellsize + cellsize/2, playerY*cellsize + cellsize/2);
      }

      stroke(255, 0, 0);
      rect(line1x*cellsize, line1y*cellsize, cellsize, cellsize);
      line(line1x*cellsize + cellsize/2, line1y*cellsize + cellsize/2, playerX*cellsize + cellsize/2, playerY*cellsize + cellsize/2);
      
    } else if (dist(line2x, line2y, playerX, playerY) < dist(line1x, line1y, playerX, playerY) &&
      dist(line2x, line2y, playerX, playerY) < dist(line3x, line3y, playerX, playerY)) {

      stroke(0, 0, 255);
      rect(line1x*cellsize, line1y*cellsize, cellsize, cellsize);
      line(line1x*cellsize + cellsize/2, line1y*cellsize + cellsize/2, playerX*cellsize + cellsize/2, playerY*cellsize + cellsize/2);
      if (line3x != 0) {
        rect(line3x*cellsize, line3y*cellsize, cellsize, cellsize);
        line(line3x*cellsize + cellsize/2, line3y*cellsize + cellsize/2, playerX*cellsize + cellsize/2, playerY*cellsize + cellsize/2);
      }

      stroke(255, 0, 0);
      rect(line2x*cellsize, line2y*cellsize, cellsize, cellsize);
      line(line2x*cellsize + cellsize/2, line2y*cellsize + cellsize/2, playerX*cellsize + cellsize/2, playerY*cellsize + cellsize/2);
      
    } else if (dist(line3x, line3y, playerX, playerY) < dist(line1x, line1y, playerX, playerY) &&
      dist(line3x, line3y, playerX, playerY) < dist(line2x, line2y, playerX, playerY) && 
      line3x != 0) {
      stroke(0, 0, 255);
      rect(line1x*cellsize, line1y*cellsize, cellsize, cellsize);
      rect(line2x*cellsize, line2y*cellsize, cellsize, cellsize);
      line(line1x*cellsize + cellsize/2, line1y*cellsize + cellsize/2, playerX*cellsize + cellsize/2, playerY*cellsize + cellsize/2);
      line(line2x*cellsize + cellsize/2, line2y*cellsize + cellsize/2, playerX*cellsize + cellsize/2, playerY*cellsize + cellsize/2);

      stroke(255, 0, 0);
      rect(line3x*cellsize, line3y*cellsize, cellsize, cellsize);
      line(line3x*cellsize + cellsize/2, line3y*cellsize + cellsize/2, playerX*cellsize + cellsize/2, playerY*cellsize + cellsize/2);
      
    }
    line1x = 0;
    line1y = 0;
    line2x = 0;
    line2y = 0;
    line3x = 0;
    line3y = 0;
  }
  strokeWeight(1);
}

boolean isEmptyCell(int x, int y) {
  if (grid[y][x] != WALLCELL) {
    return true;
  } else {
    return false;
  }
}

boolean isAtPortalLeft(int x, int y) {
  if (x == 0 && y == 14) {
    return true;
  } else {
    return false;
  }
}

void keyPressed() {
  //----------------------------------------------------------------
  // player movement based on key presses
  //----------------------------------------------------------------

  //using moved boolean to update the whole grid when the player moves successfully
  boolean moved = false;

  if (keyCode == UP) {
    if (isEmptyCell(playerX,playerY-1)) {
      //if there's space above, move up
      playerY--;
      moved = true;
    }
  } 
  if (keyCode == DOWN) {
    if (isEmptyCell(playerX,playerY+1)) {
      //if there's space below, move down
      playerY++;
      moved = true;
    }
  }
  if (keyCode == LEFT) {
    if (isAtPortalLeft(playerX,playerY)) {
      //if the player is in the left portal, warp
      playerX = 27;
      moved = true;
    } else {
      if (isEmptyCell(playerX-1,playerY)) {
        //if there's space to the left, move left
        playerX--;
        moved = true;
      }
    }
  }
  if (keyCode == RIGHT) {
    if (playerX == 27 && playerY == 14) {
      //if the player is in the right portal, warp
      playerX = 0;
      moved = true;
    } else {
      if (grid[playerY][playerX+1] != WALLCELL) {
        //if there's space to the right, move right
        playerX++;
        moved = true;
      }
    }
  }

  //----------------------------------------------------------------
  // movement logic for ghost
  //----------------------------------------------------------------
  if (moved == true) {
    //we're only registering moves when the player actually changes tiles, not actually when the key is pressed.
    //this prevents the ghost from moving when the player is accidentally moving into a wall or something. 

    if (grid[ghostY][ghostX] != DECISIONCELL && ghostX != 0 && ghostX != 27) {
      //----------------------------------------------------------------
      // if the ghost isn't at the "portal" on the left and right, and is not at a decision node
      //----------------------------------------------------------------
      if (grid[ghostY+ghostDirY][ghostX+ghostDirX] == 1) {
        //if there is a wall in front at the current direction

        if (ghostDirX != 0) {
          //if the ghost is moving horizontally  
          if (grid[ghostY+1][ghostX] != WALLCELL) {
            //if there is an empty space below the ghost, change direction to DOWN
            ghostDirY = 1;
            ghostDirX = 0;
          } else if (grid[ghostY-1][ghostX] != WALLCELL) {  
            //if there is an empty space above the ghost, change direction to UP
            ghostDirY = -1;
            ghostDirX = 0;
          }
        } else if (ghostDirY != 0) {  
          //if the ghost is moving vertically
          if (grid[ghostY][ghostX+1] != WALLCELL) {  
            //if there is an empty space to the right of the ghost, change direction to RIGHT
            ghostDirY = 0;
            ghostDirX = 1;
          } else if (grid[ghostY][ghostX-1] != WALLCELL) {  
            //if there is an empty space to the left of the ghost, change direction to LEFT
            ghostDirY = 0;  //stop moving vertically
            ghostDirX = -1;  //move towards the left
          }
        }
      }
    } else {  
      //----------------------------------------------------------------
      //ghost is in a decision node: re-assess direction based on target
      //----------------------------------------------------------------
      if (ghostX != 0 && ghostX != 27) {
        //if ghost is not in "portal" locations

        if (ghostDirX != 0) { 
          //if the ghost is moving horizontally  

          boolean upFree = false;
          boolean downFree = false;
          boolean continueFree = false;
          float distDown = 0;
          float distUp = 0;
          float distCont = 0;

          // if space below ghost is free
          if (grid[ghostY+1][ghostX] != WALLCELL) {
            downFree = true;
            distDown = dist(ghostX, ghostY+1, playerX, playerY);
            line1x = ghostX;
            line1y = ghostY + 1;
          }
          // if space above ghost is free
          if (grid[ghostY-1][ghostX] != WALLCELL) {
            upFree = true;
            distUp = dist(ghostX, ghostY-1, playerX, playerY);
            if (line1x == 0) {
              line1x = ghostX;
              line1y = ghostY-1;
            } else {
              line2x = ghostX;
              line2y = ghostY-1;
            }
          }
          // if continue direction space is free
          if (grid[ghostY][ghostX+ghostDirX] != WALLCELL) {
            continueFree = true;
            distCont = dist(ghostX+ghostDirX, ghostY, playerX, playerY);
            if (line2x == 0) {
              line2x = ghostX+ghostDirX;
              line2y = ghostY;
            } else {
              line3x = ghostX+ghostDirX;
              line3y = ghostY;
            }
          }
          
          
          if (downFree && upFree && continueFree) {
            if (distDown < distUp && distDown < distCont) {
              ghostDirX = 0; 
              ghostDirY = 1;
            } else if (distUp < distDown && distUp < distCont) {
              ghostDirX = 0; 
              ghostDirY = -1;
            } else if (distCont < distUp && distCont < distDown) {
            }
          } else if (downFree && upFree) {
            if (distDown < distUp) {
              // change direction to DOWN
              ghostDirX = 0; 
              ghostDirY = 1;
            } else {
              // change direction to UP
              ghostDirX = 0; 
              ghostDirY = -1;
            }
          } else if (downFree && continueFree) {
            if (distDown < distCont) {
              // change direction to DOWN
              ghostDirX = 0; 
              ghostDirY = 1;
            } else {
              // continue in same direction
            }
          } else if (upFree && continueFree) {
            if (distUp < distCont) {
              // change direction to UP
              ghostDirX = 0; 
              ghostDirY = -1;
            } else {
              // continue in same direction
            }
          }
        } else if (ghostDirY != 0) { 
          //ghost is moving in y direction
          boolean leftFree = false;
          boolean rightFree = false;
          boolean continueFree = false;
          float distLeft = 0;
          float distRight = 0;
          float distCont = 0;

          // if space to the right of ghost is free
          if (grid[ghostY][ghostX+1] != WALLCELL) {
            rightFree = true;
            distRight = dist(ghostX+1, ghostY, playerX, playerY);
            line1x = ghostX+1;
            line1y = ghostY;
          }

          // if space to the left of ghost is free
          if (grid[ghostY][ghostX-1] != WALLCELL) {
            leftFree = true;
            distLeft = dist(ghostX-1, ghostY, playerX, playerY);
            if (line1x == 0) {
              line1x = ghostX-1;
              line1y = ghostY;
            } else {
              line2x = ghostX-1;
              line2y = ghostY;
            }
          }

          // if space in current direction is free
          if (grid[ghostY+ghostDirY][ghostX] != WALLCELL) {
            continueFree = true;
            distCont = dist(ghostX, ghostY+ghostDirY, playerX, playerY);
            if (line2x == 0) {
              line2x = ghostX;
              line2y = ghostY+ghostDirY;
            } else {
              line3x = ghostX;
              line3y = ghostY+ghostDirY;
            }
          }

          if (leftFree && rightFree && continueFree) {
            if (distLeft < distRight && distLeft < distCont) {
              ghostDirX = -1; 
              ghostDirY = 0;
            } else if (distRight < distLeft && distRight < distCont) {
              ghostDirX = 1; 
              ghostDirY = 0;
            } else if (distCont < distLeft && distCont < distRight) {
            }
          } else if (leftFree && rightFree) {
            if (distLeft < distRight) {
              // change direction to LEFT
              ghostDirX = -1; 
              ghostDirY = 0;
            } else {
              // change direction to RIGHT
              ghostDirX = 1; 
              ghostDirY = 0;
            }
          } else if (leftFree && continueFree) {
            if (distLeft < distCont) {
              // change direction to LEFT
              ghostDirX = -1; 
              ghostDirY = 0;
            } else {
              // continue in same direction
            }
          } else if (rightFree && continueFree) {
            if (distRight < distCont) {
              // change direction to RIGHT
              ghostDirX = 1; 
              ghostDirY = 0;
            } else {
              // continue in same direction
            }
          }
        }
      }
    }

    //----------------------------------------------------------------
    // direction has been decided, move ghost
    //----------------------------------------------------------------
    if (ghostX == 0 && ghostY == 14 && ghostDirX == -1) {
      // if ghost is in left portal, going left, warp to right side of the screen
      ghostX = 27;
    } else if (ghostX == 27 && ghostY == 14 && ghostDirX == 1) {
      // if ghost is in right portal, going right, warp to left side of screen
      ghostX = 0;
    } else {
      // add movement to ghost position
      ghostX += ghostDirX;
      ghostY += ghostDirY;
    }
  }

  //----------------------------------------------------------------
  // draw the whole map
  //----------------------------------------------------------------
  drawEverything();
}