var player_frames = [{
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

var tile_frames;
var tilesize = 70;
var player;
var solids = [];

function preload() {
  // Load the json for the tiles sprite sheet
  tile_frames = loadJSON('assets/tiles.json');

  // Load player sprite sheet from frames array
  player_sprite_sheet = loadSpriteSheet('assets/player_spritesheet.png', player_frames);

  // Load tiles sprite sheet from frames array
  tile_sprite_sheet = loadSpriteSheet('assets/tiles_spritesheet.png', tile_frames);

  // Player walk animation passing in a SpriteSheet
  player_walk = loadAnimation(player_sprite_sheet);

  // An animation with a single frame for standing
  player_stand = loadAnimation(new SpriteSheet('assets/player_spritesheet.png', [{
    "name": "player_stand",
    "frame": {
      "x": 284,
      "y": 95,
      "width": 70,
      "height": 94
    }
  }]));
}


function setup() {
  clear();
  background(0);
  var canvas = createCanvas(500, 500);
  canvas.position(50,50);
  player = new Player();
  player.setupPlayer(1 * tilesize, 2 * tilesize, 0, 0, 40, 80);

  for (var i = 0; i < level.length; i++) {
    for (var j = 0; j < level[0].length; j++) {
      if (level[i][j] !== 0) {
        var tile = createSprite(j * tilesize - camera.position.x, i * tilesize, 70, 70);
        tile.setCollider("rectangle", 0, 0, 70, 70);
        tile.debug = true;
        solids.push(tile);
      }
    }
  }
}

var level = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 2, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 2, 3, 2, 0, 0, 0, 0],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
];


function draw() {
  background(0);

  player.update();
  for (var i = 0; i < solids.length; i++) {
    player.player_sprite.collide(solids[i]);
  }



  drawSprites();
}

