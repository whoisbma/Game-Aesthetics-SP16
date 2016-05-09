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

var texWidth = 64;
var texHeight = 64;

var PIXELWIDTH;
var PIXELHEIGHT;

var XSKIP = 1;
var YSKIP = 1;



function setup() {
  canvas = createCanvas(800, 300);
  background(0);
  pos = createVector(12, 12);
  dir = createVector(0, 1);
  plane = createVector(1, 0);
  rot = 0;
  rotSpeed = 0.025;
  walkSpeed = 0.05;
  pixelDensity(0.25);

  // this.webkitImageSmoothingEnabled = false;
  // this.mozImageSmoothingEnabled = false;
  // this.msImageSmoothingEnabled = false;
  // this.imageSmoothingEnabled = false;
  // noSmooth();

  // console.log(this._renderer.drawingContext);

  sprites = [{
    pos: createVector(13, 13)
      // }, {
      //   pos: createVector(15, 11)
      // }, {
      // pos: createVector(13, 8)
  }];

  noStroke();

  PIXELWIDTH = width * pixelDensity();
  PIXELHEIGHT = height * pixelDensity();
}

function draw() {
  // console.log(frameRate());
  background(20);

  fill(180);
  rect(0, 0, width, height / 2);
  fill(130);
  rect(0, height / 2, width, height);

  update();
  loadPixels();
  raycast();
  castSprites();
  updatePixels();
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

  for (var x = 0; x < PIXELWIDTH; x += XSKIP) {
    var cameraX = (2 * x / PIXELWIDTH) - 1;
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

    var lineHeight = abs(PIXELHEIGHT / wallDist);
    // var lineHeight2 = abs((height * pixelDensity() * 4) / (wallDist * pixelDensity() * 4));
    lineHeight = min(lineHeight, PIXELHEIGHT);

    //draw textures
    // var wallX; // where exactly the wall was hit
    // if (side === 1) {
    //   wallX = rayPos.x + ((mapY - rayPos.y + (1 - stepY) / 2) / rayDir.y) * rayDir.x;
    // } else {
    //   wallX = rayPos.y + ((mapX - rayPos.x + (1 - stepX) / 2) / rayDir.x) * rayDir.y;
    // }
    // wallX -= floor((wallX));

    //x coordinate of the texture
    // var texX = floor(wallX * texWidth);
    // if (side === 0 && rayDir.x > 0) {
    //   texX = texWidth - texX - 1;
    // }
    // if (side === 1 && rayDir.y < 0) {
    //   texX = texWidth - texX - 1;
    // }

    var startY = PIXELHEIGHT / 2 - lineHeight / 2;
    startY = floor(startY / YSKIP) * YSKIP;
    for (var y = 0; y < lineHeight; y += YSKIP) {
      // var texY = floor(map(y, 0, lineHeight, 0, texHeight));
      var c;
      if (side === 1) {
        c = 200;
      } else {
        c = 150;
      }
      //if side === 1....darken
      //if rayWidth === 1.. (currently not using.)

      for (var moreX = x; moreX < x + XSKIP; moreX++) {
        for (var moreY = y; moreY < y + YSKIP; moreY++) {
          var pixelPos = (PIXELWIDTH * (moreY + floor(startY)) + moreX) * 4;
          // if (pixelPos < pixels.length && pixelPos >= 0) {
          pixels[pixelPos] = c;
          pixels[pixelPos + 1] = 150; //map((moreY - y), 0, YSKIP, 0, 255);
          pixels[pixelPos + 2] = 0; //map((moreX - x), 0, XSKIP, 0, 255);
          pixels[pixelPos + 3] = 255;
          // }
        }
      }

    }

    //set zbuffer position to wall dist
    zBuffer[x] = wallDist;
  }


  // for (var x = 0; x < width / 2 * pixelDensity(); x++) {
  //   for (var y = 0; y < height / 3  * pixelDensity(); y++) {
  //     var c = random(255);
  //     var index = (width * pixelDensity() * y + x) * 4;
  //       pixels[index] = c;
  //       pixels[index + 1] = 255 - c;
  //       pixels[index + 2] = c;
  //       pixels[index + 3] = 255;
  //   }
  // }

}

function compareSprites(a, b) {
  return b.value - a.value;
}

function castSprites() {
  //sort sprites
  for (var i = 0; i < sprites.length; i++) {
    spriteOrder[i] = i;
    spriteDistance[i] = ((pos.x - sprites[i].pos.x) * (pos.x - sprites[i].pos.x) + (pos.y - sprites[i].pos.y) * (pos.y - sprites[i].pos.y));
  }

  var mappedOrder = spriteOrder.map(function(order, i) {
    return {
      index: i,
      value: spriteDistance[i]
    };
  });

  mappedOrder.sort(compareSprites);

  for (i = 0; i < mappedOrder.length; i++) {
    spriteOrder[i] = mappedOrder[i].index;
  }

  for (i = 0; i < sprites.length; i++) {
    var spriteX = sprites[spriteOrder[i]].pos.x - pos.x;
    var spriteY = sprites[spriteOrder[i]].pos.y - pos.y;

    var invDet = 1.0 / (plane.x * dir.y - dir.x * plane.y);

    var transformX = invDet * (dir.y * spriteX - dir.x * spriteY);
    var transformY = invDet * (-plane.y * spriteX + plane.x * spriteY);


    var spriteScreenX = floor((PIXELWIDTH / 2) * (1 + transformX / transformY));

    //calculate height of the sprite on screen
    var spriteHeight = abs(floor(PIXELHEIGHT / transformY));

    var drawStartY = -spriteHeight / 2 + PIXELHEIGHT / 2;

    if (drawStartY < 0) {
      drawStartY = 0;
    }

    var drawEndY = spriteHeight / 2 + PIXELHEIGHT / 2;

    if (drawEndY >= PIXELHEIGHT) {
      drawEndY = PIXELHEIGHT;
    }

    var spriteWidth = abs(floor(PIXELWIDTH / transformY));

    var drawStartX = floor(-spriteWidth / 2 + spriteScreenX);


    if (drawStartX < 0) {
      drawStartX = 0;
    }
    var drawEndX = floor(spriteWidth / 2 + spriteScreenX);
    if (drawEndX >= PIXELWIDTH) {
      drawEndX = PIXELWIDTH;
    }

    // draw every vertical stripe of the sprite on screen
    // for (var stripe = drawStartX; stripe < drawEndX; stripe++) {
    //   if (transformY > 0 && stripe > 0 && stripe < width && transformY < zBuffer[floor(stripe * pixelDensity())]) {
    //     stroke(spriteOrder[i] * 50);
    //     line(stripe, drawStartY, stripe, drawEndY);
    //   }
    // }


    // for (i = 20; i < PIXELHEIGHT-20; i++) {
    //   for (j = 20; j < PIXELWIDTH-20; j++) {
    //     pixelPos = (PIXELWIDTH * i + j) * 4;
    //     pixels[pixelPos] = map(j, 20, PIXELWIDTH-20, 0, 255);
    //     pixels[pixelPos + 1] = map(i, 20, PIXELHEIGHT-20, 0, 255); //map((moreY - y), 0, YSKIP, 0, 255);
    //     pixels[pixelPos + 2] = 0;
    //     pixels[pixelPos + 3] = 255;
    //   }
    // }


    // for (var stripeY = drawStartY; stripeY < drawEndY; stripeY++) {
    //   for (var stripeX = drawStartX; stripeX < drawEndX; stripeX++) {
    //     if (transformY > 0 && stripeX > 0 && stripeX < PIXELWIDTH && transformY < zBuffer[stripeX]) {
    //       var pixelPos = (PIXELWIDTH * stripeY + stripeX) * 4;
    //       if (stripeX === drawStartX && stripeY === drawStartY) {
    //         console.log(pixelPos % PIXELWIDTH);
    //       }
    //       pixels[pixelPos] = 100;//map(stripeY - drawStartY, 0, drawEndY - drawStartY, 0, 255);
    //       pixels[pixelPos + 1] = 0;//map(stripeX - drawStartX, 0, drawEndX - drawStartX, 0, 255);
    //       pixels[pixelPos + 2] = map(stripeX, 0, PIXELWIDTH, 0, 255);
    //       pixels[pixelPos + 3] = 255;
    //     }
    //   }
    // }

    var start = 4 * drawStartX;
    var end = 4 * drawEndX;
    for (i = start; i < end; i+=4) {
      pixels[i] = 255; //map(stripeY - drawStartY, 0, drawEndY - drawStartY, 0, 255);
      pixels[i + 1] = 0; //map(stripeX - drawStartX, 0, drawEndX - drawStartX, 0, 255);
      pixels[i + 2] = map(i, start, end, 0, 255);
      pixels[i + 3] = 255;
    }

  }

}