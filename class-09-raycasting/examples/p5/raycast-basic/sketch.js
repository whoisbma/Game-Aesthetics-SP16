var worldMap = [
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 1],
  [1, 2, 0, 3, 3, 2, 2, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 1],
  [1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 3, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1],
  [1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 2, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1],
  [1, 3, 3, 3, 3, 3, 3, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 2, 3, 0, 0, 0, 0, 0, 2, 2, 2, 2, 1, 0, 1, 2, 2, 2, 2, 2, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 2, 2, 2, 2, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1],
  [1, 3, 3, 3, 3, 3, 3, 3, 0, 0, 3, 0, 0, 0, 2, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 1],
  [1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 3, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 2, 0, 0, 0, 2, 0, 0, 3, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
];

var pos;
var dir;
var plane;
var rot;
var rotSpeed;
var walkSpeed;

var sprites = [];
var zBuffer = [];
var spriteOrder = [];
var spriteDistance = [];

function setup() {
  createCanvas(800, 400);
  pos = createVector(12, 12);
  dir = createVector(0, 1);
  plane = createVector(1, 0);
  rot = 0;
  rotSpeed = 0.025;
  walkSpeed = 0.05;

  sprites = [{
    pos: createVector(13, 13)
  }, {
    pos: createVector(15, 11)
  }, {
    pos: createVector(13, 8)
  }];
}

function draw() {
  background(20);
  noStroke();
  fill(180);
  rect(0, 0, width, height / 2);
  fill(130);
  rect(0, height / 2, width, height);

  update();
  raycast();
  castSprites();
}

function update() {
  dir.x = cos(rot);
  dir.y = -sin(rot); //play with these to really screw things up
  plane.x = sin(rot);
  plane.y = cos(rot);

  if (keyIsDown(LEFT_ARROW)) {
    rot += rotSpeed;
  }

  if (keyIsDown(RIGHT_ARROW)) {
    rot -= rotSpeed;
  }

  if (keyIsDown(UP_ARROW)) {
    if (worldMap[floor(pos.x + dir.x * walkSpeed * 1.0)][floor(pos.y)] === 0) {
      pos.x += dir.x * walkSpeed * 1.0;
    }
    if (worldMap[floor(pos.x)][floor(pos.y + dir.y * walkSpeed * 1.0)] === 0) {
      pos.y += dir.y * walkSpeed * 1.0;
    }
  }

  if (keyIsDown(DOWN_ARROW)) {
    if (worldMap[floor(pos.x - dir.x * walkSpeed * 1.0)][floor(pos.y)] === 0) {
      pos.x -= dir.x * walkSpeed * 1.0;
    }
    if (worldMap[floor(pos.x)][floor(pos.y - dir.y * walkSpeed * 1.0)] === 0) {
      pos.y -= dir.y * walkSpeed * 1.0;
    }
  }
}

function raycast() {
  var rayPos = createVector(0, 0);
  var rayDir = createVector(0, 0);

  //cast rays
  for (var x = 0; x < width; x++) {
    var cameraX = (2 * x / width) - 1;
    rayPos.set(pos.x, pos.y);
    rayDir.set(dir.x + plane.x * cameraX, dir.y + plane.y * cameraX);

    var mapX = floor(rayPos.x);
    var mapY = floor(rayPos.y);

    var sideDistX;
    var sideDistY;

    var scaleX = 1 / rayDir.x;
    var scaleY = 1 / rayDir.y;
    var deltaDistX = (createVector(1, rayDir.y * scaleX)).mag();
    var deltaDistY = (createVector(1, rayDir.x * scaleY)).mag();

    var wallDist;

    var stepX;
    var stepY;

    var hit = 0;
    var side = 0;

    if (rayDir.x < 0) {
      stepX = -1;
      sideDistX = (rayPos.x - mapX) * deltaDistX;
    } else {
      stepX = 1;
      sideDistX = (mapX + 1 - rayPos.x) * deltaDistX;
    }

    if (rayDir.y < 0) {
      stepY = -1;
      sideDistY = (rayPos.y - mapY) * deltaDistY;
    } else {
      stepY = 1;
      sideDistY = (mapY + 1 - rayPos.y) * deltaDistY;
    }

    //DDA
    while (hit === 0) {
      if (sideDistX < sideDistY) {
        sideDistX += deltaDistX;
        mapX += stepX;
        side = 0;
      } else {
        sideDistY += deltaDistY;
        mapY += stepY;
        side = 1;
      }
      if (worldMap[mapX][mapY] > 0) {
        hit = 1;
      }
    }

    //calculate the distance to the wall
    if (side === 0) {
      wallDist = abs((mapX - rayPos.x + (1 - stepX) / 2) / rayDir.x);
    } else {
      wallDist = abs((mapY - rayPos.y + (1 - stepY) / 2) / rayDir.y);
    }

    var lineHeight = abs(height / wallDist);
    lineHeight = min(lineHeight, height);

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
          stroke(200 / 2, 150 / 2, 150 / 2);
          break;
        case 2:
          stroke(50 / 2, 100 / 2, 100 / 2);
          break;
        case 3:
          stroke(150 / 2, 75 / 2, 100 / 2);
          break;
      }
    }

    var startY = height / 2 - lineHeight / 2;
    line(x, startY, x, startY + lineHeight);


    //set zbuffer position to wall dist
    zBuffer[x] = wallDist;
  }

}

function compareSprites(a, b) {
  return b.value-a.value;
}

function castSprites() {
  //sort sprites
  for (var i = 0; i < sprites.length; i++) {
    spriteOrder[i] = i;
    spriteDistance[i] = ((pos.x - sprites[i].pos.x) * (pos.x - sprites[i].pos.x) + (pos.y - sprites[i].pos.y) * (pos.y - sprites[i].pos.y));
  }
  
  var mappedOrder = spriteOrder.map(function(order, i) {
    return {index: i, value: spriteDistance[i]};
  });
  mappedOrder.sort(compareSprites);
  
  for (var i = 0; i < mappedOrder.length; i++) {
    spriteOrder[i] = mappedOrder[i].index;
  }

  for (var i = 0; i < sprites.length; i++) {
    var spriteX = sprites[spriteOrder[i]].pos.x - pos.x;
    var spriteY = sprites[spriteOrder[i]].pos.y - pos.y;

    var invDet = 1.0 / (plane.x * dir.y - dir.x * plane.y);
    var transformX = invDet * (dir.y * spriteX - dir.x * spriteY);
    var transformY = invDet * (-plane.y * spriteX + plane.x * spriteY);
    
    // console.log(transformX);

    var spriteScreenX = floor((width / 2) * (1 + transformX / transformY));
    
    // console.log(spriteScreenX);

    //calculate height of the sprite on screen
    var spriteHeight = abs(floor(height / transformY));
    var drawStartY = -spriteHeight / 2 + height / 2;
    if (drawStartY < 0) {
      drawStartY = 0;
    }
    var drawEndY = spriteHeight / 2 + height / 2;
    if (drawEndY >= height) {
      drawEndY = height - 1;
    }

    var spriteWidth = abs(floor(height / transformY));
    var drawStartX = floor(-spriteWidth / 2 + spriteScreenX);
    if (drawStartX < 0) {
      drawStartX = 0;
    }
    var drawEndX = floor(spriteWidth / 2 + spriteScreenX);
    if (drawEndX >= width) {
      drawEndX = width - 1;
    }


    //draw every vertical stripe of the sprite on screen
    for (var stripe = drawStartX; stripe < drawEndX; stripe++) {
      if (transformY > 0 && stripe > 0 && stripe < width && transformY < zBuffer[stripe]) {
        stroke(spriteOrder[i] * 50);
        line(stripe, drawStartY, stripe, drawEndY);
      }
    }
  }


}