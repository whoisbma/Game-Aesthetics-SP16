//tackle this one if you're comfortable with the others.

final int COLS = 50;
final int ROWS = 50;

float cellSize;
boolean[][] cellmap = new boolean[COLS][ROWS];

void setup() {
  size(500, 500);
  noStroke();
  cellSize = width/COLS;
  initializeRandWorld();
  cellmap = generateMap();
}

void draw() {
  drawWorld();
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
  for (int x = 0; x < COLS; x++) {
    for (int y = 0; y < ROWS; y++) {
      if (random(1) < aliveChance) {
        cellmap[x][y] = true;
      }
    }
  }
}

void drawWorld() {
  for (int x = 0; x < COLS; x++) {
    for (int y = 0; y < ROWS; y++) {
      if (cellmap[x][y] == true) {
        fill(67, 56, 45);
      } else {
        fill(51, 98, 175);
      }
      rect(x * cellSize, y * cellSize, (x * cellSize) + cellSize, (y * cellSize) + cellSize);
    }
  }
}