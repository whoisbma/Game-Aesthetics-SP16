function Player() {
  this.x;
  this.y;
  this.player_sprite;
  this.onGround;
  this.playerStates;
  this.currentState;

  this.setupPlayer = function(x, y, hbx, hby, hbw, hbh) {
    this.x = x;
    this.y = y;
    this.player_sprite = createSprite(this.x, this.y);
    this.player_sprite.setCollider("rectangle", hbx, hby, hbw, hbh);
    this.player_sprite.addAnimation('walk', player_walk);
    this.player_sprite.addAnimation('stand', player_stand);
    this.player_sprite.addAnimation('jump', player_jump);
    this.player_sprite.addAnimation('duck', player_duck);
    this.player_sprite.addAnimation('dive', player_dive);
    this.player_sprite.debug = true;
    this.player_sprite.maxSpeed = 20;

    this.playerStates = {
      STANDING: 0,
      WALKING: 1,
      DUCKING: 2,
      DIVING: 3
    };
    
    this.currentState = this.playerStates.STANDING;
    
  };


  this.update = function() {

    if (this.onGround === false) {
      this.player_sprite.velocity.y += 1;
      for (var i = 0; i < solidSprites.length; i++) {
        if (this.player_sprite.collide(solidSprites[i]) === true) {
          if (this.player_sprite.touching.bottom === true) {
            this.onGround = true;
            this.player_sprite.changeAnimation('walk');
            this.player_sprite.velocity.y = 0;
          }
          if (this.player_sprite.touching.top === true) {
            if (this.player_sprite.velocity.y < 0) {
              this.player_sprite.velocity.y = 0;
            }
          }
        }
      }
    } else {
      var stayOnGround = false;
      for (i = 0; i < solidSprites.length; i++) {

        if (solidSprites[i].overlapPoint(player.player_sprite.position.x, player.player_sprite.position.y + 40 + 1)) {
          stayOnGround = true;
        }
      }
      if (stayOnGround === false) {
        this.onGround = false;
      }
    }

    // console.log(this.onGround);
    camera.zoom = 0.7;
    camera.position = this.player_sprite.position;


  };

  this.handleInput = function(input) {
    
  }

  this.handleInputRelease = function(input) {

  }


}

function keyPressed() {
  player.handleInput(key);
}

function keyReleased() {
  player.handleInputRelease(key);
}