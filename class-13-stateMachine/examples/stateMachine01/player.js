function keyPressed() {
  player.handleInput(key);
}

function keyReleased() {
  player.handleInputRelease(key);
}

function Player() {
  this.x;
  this.y;
  this.player_sprite;
  this.onGround;
  this.isJumping;

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
    this.onGround = false;
    this.isDucking = false;
  };

  this.handleInput = function(input) {

    if (input === 'W') {
      if (this.onGround && !this.isDucking) {
        this.player_sprite.velocity.y = -18;
        this.isJumping = true;
        this.player_sprite.changeAnimation('jump');
      }
    } else if (input === 'S') {
      if (this.onGround) {
        this.isDucking = true;
        this.player_sprite.changeAnimation('duck');
        this.player_sprite.setCollider("rectangle", 0, 0, 40, 40);
        this.player_sprite.position.y += 20;
      } else {
        //do the dive
        this.player_sprite.changeAnimation('dive');
        this.player_sprite.velocity.y = 10;
      }
    } else if (input === 'A') {
      if (!this.isDucking) {
        this.player_sprite.velocity.x = -4;
        this.player_sprite.mirrorX(-1);
      }
      // camera.zoom = 0.9;
    } else if (input === 'D') {
      if (!this.isDucking) {
        this.player_sprite.velocity.x = 4;
        this.player_sprite.mirrorX(1);
      }
    }

  }

  this.handleInputRelease = function(input) {
    if (input === 'S') {
      if (this.isDucking) {
        this.player_sprite.changeAnimation('walk');
        this.player_sprite.setCollider("rectangle", 0, 0, 40, 80);
        this.player_sprite.position.y -= 20;
        this.isDucking = false;
      }
    } else if (input === 'A') {
      this.player_sprite.velocity.x = 0;
      // camera.zoom = 0.9;
    } else if (input === 'D') {
      this.player_sprite.velocity.x = 0;
    }
  }

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

        if (solidSprites[i].overlapPoint(player.player_sprite.position.x - 20, player.player_sprite.position.y + 40 + 1) ||
          solidSprites[i].overlapPoint(player.player_sprite.position.x + 20, player.player_sprite.position.y + 40 + 1)) {
          stayOnGround = true;
        }
      }
      if (stayOnGround === false) {
        this.onGround = false;
      }
    }
    camera.zoom = 0.8;
    camera.position = this.player_sprite.position;
  };

}