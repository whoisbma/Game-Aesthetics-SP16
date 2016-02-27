//press space to regenerate.

final int COLS = 50;
final int ROWS = 50;

float cellSize;
boolean[][] cellmap = new boolean[COLS][ROWS];
boolean[][] treasure = new boolean[COLS][ROWS];
int floodx = 0;
int floody = 0;

void setup() {
  size(500, 500);
  noStroke();
  cellSize = width/COLS;
  initializeRandWorld();
  cellmap = generateMap();
  placeTreasure();
}

void draw() {
  drawWorld();
  
  //something you might want to try is something i didn't get to in this code.
  //run floodfill and when you encounter an area that is below a size limit, fill it in completely. 
  //this way you're only left with one big area instead of a big area and a bunch of small ones, for example.
  
}

void keyPressed() {
  cellmap = new boolean[COLS][ROWS];
  treasure = new boolean[COLS][ROWS];
  initializeRandWorld();
  cellmap = generateMap();
  placeTreasure();
}

boolean[][] generateMap() {
  int numberOfSteps = 6;
  for (int i = 0; i < numberOfSteps; i++) {
    cellmap = doSimulationStep();
  }
  return cellmap;
}

boolean[][] doSimulationStep() {
  int deathLimit = 3;
  int birthLimit = 4;
  boolean[][] newMap = new boolean[COLS][ROWS];
  for (int x = 0; x < cellmap.length; x++) {
    for (int y = 0; y < cellmap[0].length; y++) {
      int nbs = countAliveNeighbors(cellmap, x, y);
      //if a cell is alive but has too few neighbors, kill it
      if (cellmap[x][y]) {
        if (nbs < deathLimit) {
          newMap[x][y] = false;
        } else {
          newMap[x][y] = true;
        }
        //otherwise if cell is dead, check if it has the right number of neighbors to be born
      } else {
        if (nbs > birthLimit) {
          newMap[x][y] = true;
        } else {
          newMap[x][y] = false;
        }
      }
    }
  }
  return newMap;
}

int countAliveNeighbors(boolean[][] map, int x, int y) {
  int count = 0;
  for (int i = -1; i < 2; i++) {
    for (int j = -1; j < 2; j++) {
      int neighborX = x+i;
      int neighborY = y+j;
      if (!(i == 0 && j == 0)) {
        if (neighborX < 0 || neighborY < 0 || neighborX >= map.length || neighborY >= map[0].length) {
          count = count + 1;
        } else if (map[neighborX][neighborY]) {
          count = count + 1;
        }
      }
    }
  }
  return count;
}

void initializeRandWorld() {
  float aliveChance = 0.45;
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      if (random(1) < aliveChance) {
        cellmap[i][j] = true;
      }
      treasure[i][j] = false;
    }
  }
}

void drawWorld() {
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      if (cellmap[i][j] == true) {
        //cell occupied (brown)
        fill(67, 56, 45);
      } else {
        //cell open (blue)
        fill(51, 98, 175);
      }
      if (treasure[i][j]) {
        fill(200, 200, 0);
      }
      rect(i * cellSize, j * cellSize, (i * cellSize) + cellSize, (j * cellSize) + cellSize);
    }
  }
}

void queueFloodFill(int x, int y) {
  if (x < 0 || y < 0 || x >= cellmap.length || y >= cellmap[0].length) {
    return;
  }
  if (cellmap[x][y] == true) {
    return;
  }
  ArrayList<PVector> queue = new ArrayList<PVector>();
  queue.add(new PVector(x, y));
  while (!queue.isEmpty()) {
    PVector p = queue.remove(0);
    if (p.x < 0 || p.y < 0 || p.x >= cellmap.length || p.y >= cellmap[0].length) {
      continue;
    }
    if (cellmap[(int)p.x][(int)p.y] == false) {
      cellmap[(int)p.x][(int)p.y] = true;
      fill(255);
      ellipse(p.x * cellSize, p.y * cellSize, cellSize, cellSize);
      queue.add(new PVector(p.x-1, p.y));                    
      queue.add(new PVector(p.x+1, p.y));      
      queue.add(new PVector(p.x, p.y-1));                    
      queue.add(new PVector(p.x, p.y+1));
    }
  }
}


void floodFill(int x, int y) {
  if (x < 0 || y < 0 || x >= cellmap.length || y >= cellmap[0].length) {
    return;
  }
  if (cellmap[x][y] == true) {
    return;
  }

  cellmap[x][y] = true;
  fill(255);
  ellipse(x*cellSize, y*cellSize, cellSize, cellSize);

  floodFill(x+1, y);
  floodFill(x, y+1);
  floodFill(x-1, y);
  floodFill(x, y-1);
}

void placeTreasure() {
  int hiddenLimit = 5;
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      if (!cellmap[i][j]) {
        int nbs = countAliveNeighbors(cellmap, i, j);
        if (nbs >= hiddenLimit) {
          treasure[i][j] = true;
        }
      }
    }
  }
}