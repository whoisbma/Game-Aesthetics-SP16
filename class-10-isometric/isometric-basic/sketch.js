// var tileImg;
var tileMap = [
  [2, 3, 3, 2, 1, 0, 0, 0, 1],
  [2, 0, 0, 0, 1, 0, 0, 0, 1],
  [2, 0, 0, 0, 1, 0, 0, 0, 1],
  [2, 0, 0, 0, 1, 0, 0, 0, 1],
  [2, 0, 0, 0, 1, 0, 0, 0, 1],
  [2, 0, 0, 0, 1, 0, 0, 0, 1],
  [2, 0, 0, 0, 1, 0, 0, 0, 1],
  [2, 0, 0, 0, 1, 0, 0, 0, 1],
  [2, 0, 0, 0, 1, 0, 0, 0, 1],
  [2, 0, 0, 0, 1, 0, 0, 0, 1],
  [1, 1, 1, 3, 4, 0, 0, 0, 1]
];
var tileSpritesheet;
var tileFrames;
var tileSize = 70;

var tileW = 140;
var tileH = 70;

var playerWalk;
var playerSprite;
var playerSpritesheet;
var playerPos;
var playerScreen;

var playerFrames = [{
  "name": "player_walk01",
  "frame": {
    "x": 0,
    "y": 0,
    "width": 70,
    "height": 94
  }
}, {
  "name": "player_walk02",
  "frame": {
    "x": 71,
    "y": 0,
    "width": 70,
    "height": 94
  }
}, {
  "name": "player_walk03",
  "frame": {
    "x": 142,
    "y": 0,
    "width": 70,
    "height": 94
  }
}, {
  "name": "player_walk04",
  "frame": {
    "x": 0,
    "y": 95,
    "width": 70,
    "height": 94
  }
}, {
  "name": "player_walk05",
  "frame": {
    "x": 71,
    "y": 95,
    "width": 70,
    "height": 94
  }
}, {
  "name": "player_walk06",
  "frame": {
    "x": 142,
    "y": 95,
    "width": 70,
    "height": 94
  }
}, {
  "name": "player_walk07",
  "frame": {
    "x": 213,
    "y": 0,
    "width": 70,
    "height": 94
  }
}, {
  "name": "player_walk08",
  "frame": {
    "x": 284,
    "y": 0,
    "width": 70,
    "height": 94
  }
}, {
  "name": "player_walk09",
  "frame": {
    "x": 213,
    "y": 95,
    "width": 70,
    "height": 94
  }
}, {
  "name": "player_walk10",
  "frame": {
    "x": 355,
    "y": 0,
    "width": 70,
    "height": 94
  }
}, {
  "name": "player_walk11",
  "frame": {
    "x": 284,
    "y": 95,
    "width": 70,
    "height": 94
  }
}];

function preload() {
  tileFrames = loadJSON('assets/tiles.json');
  tileSpritesheet = loadSpriteSheet('assets/tiles_spritesheet.png', tileFrames);
  playerSpritesheet = loadSpriteSheet('assets/player_spritesheet.png', playerFrames);
  playerWalk = loadAnimation(playerSpritesheet);
}


function setup() {
  createCanvas(1200, 1200);

  //image vs. spritesheet
  // tileImg = loadImage("assets/square.png");
  tileImg = loadImage("assets/isoTile.png");

  // for (var i = 0; i < tileMap[0].length; i++) {
  //   for (var j = 0; j < tileMap.length; j++) {
  //     var tile = createSprite(i*100 + 50, j*100 + 50);
  //     tile.addImage(tileImg);
  //   }
  // }


  for (var i = 0; i < tileMap[0].length; i++) {
    for (var j = 0; j < tileMap.length; j++) {
      var isoPos = isoFrom2D(i, j);
      var tile = createSprite(isoPos.x + width / 2, isoPos.y + 100);
      tile.addImage(tileImg);
    }
  }

  playerPos = createVector(1, 1);
  playerScreen = isoFrom2D(playerPos.x, playerPos.y);
  playerSprite = createSprite(playerScreen.x + width / 2, playerScreen.y + 130, 70, 94);
  playerSprite.addAnimation('walk', playerWalk);
}

function isoTo2D(x, y) {
  //var x2D = (2 * y + x) / 2;
  var x2D = (x / (tileW / 2) + y / (tileH / 2)) / 2;
  // var y2D = (2 * y - x) / 2;
  var y2D = (y / (tileH / 2) - (x / (tileW / 2))) / 2;
  var vec2D = createVector(x2D, y2D);
  return vec2D;
}

function isoFrom2D(x, y) {
  // var xIso = x - y;
  var xIso = (x - y) * (tileW / 2);
  // var yIso = (x + y) / 2;
  var yIso = (x + y) * (tileH / 2);
  var vecIso = createVector(xIso, yIso);
  return vecIso;
}

function draw() {
  background(30);
  //normal tiling projection
  /*
  for (var i = 0; i < tileMap[0].length; i++) {
    for (var j = 0; j < tileMap.length; j++) {
      if (tileMap[i][j] === 0) {
        tileSpritesheet.drawFrame('stoneWall.png', i * tileSize + 100, j * tileSize + 100);
      } else if (tileMap[i][j] === 1) {
        tileSpritesheet.drawFrame('boxAlt.png', i * tileSize + 100, j * tileSize + 100);
      } else if (tileMap[i][j] === 2) {
        tileSpritesheet.drawFrame('boxCoin.png', i * tileSize + 100, j * tileSize + 100);
      } else if (tileMap[i][j] === 3) {
        tileSpritesheet.drawFrame('brickWall.png', i * tileSize + 100, j * tileSize + 100);
      } else if (tileMap[i][j] === 4) {
        tileSpritesheet.drawFrame('stone.png', i * tileSize + 100, j * tileSize + 100);
      }
    }
  }
  */

  //Cartesian to isometric:
  //isoX = cartX - cartY;
  //isoY = (cartX + cartY) / 2;
  //Isometric to Cartesian:
  //cartX = (2 * isoY + isoX) / 2;
  //cartY = (2 * isoY - isoX) / 2;

  //looping via isometric function
  // for (var i = 0; i < tileMap[0].length; i++) {
  //   for (var j = 0; j < tileMap.length; j++) {
  //     var isoPos = isoFrom2D(i * tileSize + 300, j * tileSize);
  //     if (tileMap[i][j] === 0) {
  //       tileSpritesheet.drawFrame('stoneWall.png', isoPos.x, isoPos.y);
  //     } else if (tileMap[i][j] === 1) {
  //       tileSpritesheet.drawFrame('boxAlt.png', isoPos.x, isoPos.y);
  //     } else if (tileMap[i][j] === 2) {
  //       tileSpritesheet.drawFrame('boxCoin.png', isoPos.x, isoPos.y);
  //     } else if (tileMap[i][j] === 3) {
  //       tileSpritesheet.drawFrame('brickWall.png', isoPos.x, isoPos.y);
  //     } else if (tileMap[i][j] === 4) {
  //       tileSpritesheet.drawFrame('stone.png', isoPos.x, isoPos.y);
  //     }
  //   }
  // }

  drawSprites();

  if (keyWentDown("a")) {
    playerPos.x--;
    playerScreen = isoFrom2D(playerPos.x, playerPos.y);
    playerSprite.position.x = playerScreen.x + width / 2;
    playerSprite.position.y = playerScreen.y + 130;
  }
  if (keyWentDown("d")) {
    playerPos.x++;
    playerScreen = isoFrom2D(playerPos.x, playerPos.y);
    playerSprite.position.x = playerScreen.x + width / 2;
    playerSprite.position.y = playerScreen.y + 130;
  }

  if (keyWentDown("w")) {
    playerPos.y--;
    playerScreen = isoFrom2D(playerPos.x, playerPos.y);
    playerSprite.position.x = playerScreen.x + width / 2;
    playerSprite.position.y = playerScreen.y + 130;
  }
  if (keyWentDown("s")) {
    playerPos.y++;
    playerScreen = isoFrom2D(playerPos.x, playerPos.y);
    playerSprite.position.x = playerScreen.x + width / 2;
    playerSprite.position.y = playerScreen.y + 130;
  }
  console.log(playerPos.x + ", " + playerPos.y);


}