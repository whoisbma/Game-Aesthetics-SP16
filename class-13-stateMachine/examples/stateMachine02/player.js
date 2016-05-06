function keyPressed() {
  player.handleInput(key);
}

function keyReleased() {
  if (player !== undefined) {
    player.handleInputRelease(key);
  }
}

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
    this.player_sprite.addAnimation('duck', player_duck);
    this.player_sprite.addAnimation('jump', player_jump);
    this.player_sprite.addAnimation('dive', player_dive);
    // this.player_sprite.debug = true;
    this.player_sprite.maxSpeed = 20;
    
    this.playerStates = {
      STANDING: 0,
      JUMPING: 1,
      DUCKING: 2,
      DIVING: 3,
      WALKING_RIGHT: 4,
      WALKING_LEFT: 5
    };

    this.currentState = this.playerStates.STANDING;
  };

  this.handleInput = function(input) {
    switch (this.currentState) {
      case this.playerStates.STANDING:
        if (input === 'W') {
          this.player_sprite.velocity.y = -18;
          this.player_sprite.changeAnimation('jump');
          this.currentState = this.playerStates.JUMPING;
        }
        if (input === 'S') {
          this.player_sprite.changeAnimation('duck');
          this.player_sprite.setCollider("rectangle", 0, 0, 40, 40);
          this.player_sprite.position.y += 20;
          this.player_sprite.velocity.x = 0;
          this.currentState = this.playerStates.DUCKING;
        }
        if (input === 'A') {
          this.player_sprite.velocity.x = -4;
          this.player_sprite.mirrorX(-1);
          this.currentState = this.playerStates.WALKING_LEFT;
        }
        if (input === 'D') {
          this.player_sprite.velocity.x = 4;
          this.player_sprite.mirrorX(1);
          this.currentState = this.playerStates.WALKING_RIGHT;
        }
        break;

      case this.playerStates.JUMPING:
        if (input === 'S') {
          this.player_sprite.changeAnimation('dive');
          this.player_sprite.velocity.y = 10;
          this.currentState = this.playerStates.DIVING;
        }
        if (input === 'A') {
          this.player_sprite.velocity.x = -4;
          this.player_sprite.mirrorX(-1);
        }
        if (input === 'D') {
          this.player_sprite.velocity.x = 4;
          this.player_sprite.mirrorX(1);
        }
        break;
      case this.playerStates.DUCKING:
        break;

      case this.playerStates.DIVING:
        if (input === 'A') {
          this.player_sprite.velocity.x = -4;
          this.player_sprite.mirrorX(-1);
        }
        if (input === 'D') {
          this.player_sprite.velocity.x = 4;
          this.player_sprite.mirrorX(1);
        }
        break;
        
      case this.playerStates.WALKING_RIGHT:
        if (input === 'W') {
          this.player_sprite.velocity.y = -18;
          this.player_sprite.changeAnimation('jump');
          this.currentState = this.playerStates.JUMPING;
        }
        if (input === 'S') {
          this.player_sprite.changeAnimation('duck');
          this.player_sprite.setCollider("rectangle", 0, 0, 40, 40);
          this.player_sprite.position.y += 20;
          this.player_sprite.velocity.x = 0;
          this.currentState = this.playerStates.DUCKING;
        }
        break;
        
      case this.playerStates.WALKING_LEFT:
        if (input === 'W') {
          this.player_sprite.velocity.y = -18;
          this.player_sprite.changeAnimation('jump');
          this.currentState = this.playerStates.JUMPING;
        }
        if (input === 'S') {
          this.player_sprite.changeAnimation('duck');
          this.player_sprite.setCollider("rectangle", 0, 0, 40, 40);
          this.player_sprite.position.y += 20;
          this.player_sprite.velocity.x = 0;
          this.currentState = this.playerStates.DUCKING;
        }
        break;

      default:
        console.log("input error : " + this.currentState);
        break;

    }

  }

  this.handleInputRelease = function(input) {
    switch (this.currentState) {
      case this.playerStates.STANDING:
        if (input === 'A') {
          this.player_sprite.velocity.x = 0;
        }
        if (input === 'D') {
          this.player_sprite.velocity.x = 0;
        }
        break;

      case this.playerStates.JUMPING:
        if (input === 'D') {
          this.player_sprite.velocity.x = 0;
        }
        if (input === 'A') {
          this.player_sprite.velocity.x = 0;
        }
        break;
        
      case this.playerStates.DUCKING:
        if (input === 'S') {
          this.player_sprite.changeAnimation('walk');
          this.player_sprite.setCollider("rectangle", 0, 0, 40, 80);
          this.player_sprite.position.y -= 20;
          this.currentState = this.playerStates.STANDING;
        }
        break;

      case this.playerStates.DIVING:
        if (input === 'A') {
          this.player_sprite.velocity.x = 0;
        }
        if (input === 'D') {
          this.player_sprite.velocity.x = 0;
        }
        break;

      case this.playerStates.WALKING_RIGHT:
        if (input === 'D') {
          this.player_sprite.velocity.x = 0;
          this.currentState = this.playerStates.STANDING;
        }
        break;
        
      case this.playerStates.WALKING_LEFT:
        if (input === 'A') {
          this.player_sprite.velocity.x = 0;
          this.currentState = this.playerStates.STANDING;
        }
        break;

      default:
        console.log("input error");
        break;

    }
  }


  this.update = function() {
    if (this.onGround === false) {
      this.player_sprite.velocity.y += 1;
      for (var i = 0; i < solidSprites.length; i++) {
        if (this.player_sprite.collide(solidSprites[i]) === true) {
          if (this.player_sprite.touching.bottom === true) {
            this.onGround = true;
            this.currentState = this.playerStates.STANDING;
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

        if (solidSprites[i].overlapPoint(player.player_sprite.position.x - 20, player.player_sprite.position.y + 40 + 1) ||
          solidSprites[i].overlapPoint(player.player_sprite.position.x + 20, player.player_sprite.position.y + 40 + 1)) {
          stayOnGround = true;
        }
      }
      if (stayOnGround === false) {
        this.onGround = false;
      }
    }

    camera.position = this.player_sprite.position;
  };

}