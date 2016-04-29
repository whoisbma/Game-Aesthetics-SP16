function Player() {
  this.x;
  this.y;
  this.player_sprite;
  this.onGround;

  this.setupPlayer = function(x, y, hbx, hby, hbw, hbh) {
    this.x = x;
    this.y = y;
    this.player_sprite = createSprite(this.x, this.y);
    this.player_sprite.setCollider("rectangle", hbx, hby, hbw, hbh);
    this.player_sprite.addAnimation('walk', player_walk);
    this.player_sprite.addAnimation('stand', player_stand);
    this.player_sprite.debug = true;
    this.onGround = false;
  };

  this.update = function() {

    camera.position = this.player_sprite.position;
    

    var touchingSolid = false;

    // bottom.setCollider("rectangle", 0, 0, 10, 1);

    if (this.onGround === false) {
      this.player_sprite.velocity.y += 1;
      for (var i = 0; i < solids.length; i++) {
        if (this.player_sprite.collide(solids[i])) {
          if (this.player_sprite.touching.bottom === true) {
            this.player_sprite.velocity.y = 0;
            this.onGround = true;
          }
          if (this.player_sprite.touching.top === true) {
            if (this.player_sprite.velocity.y < 0) {
              this.player_sprite.velocity.y = 0;
            }
          }
        }
      }
      for (var i = 0; i < solids.length; i++) {
        if (this.player_sprite.collide(solids[i])) {
          if (this.player_sprite.touching.bottom === true) {
            touchingSolid = true;
          }
        }
      }
      if (touchingSolid === false) {
        this.onGround = false;
      }
    }


    if (keyDown("a")) {
      this.player_sprite.velocity.x = -4;
      camera.zoom = 0.9;
    }

    if (keyDown("d")) {
      this.player_sprite.velocity.x = 4;
      camera.zoom = 0.9;
    }

    if (keyWentDown("w")) {
      this.player_sprite.velocity.y = -20;
      this.onGround = false;
      camera.zoom = 0.9;
    }

    if (!keyDown("a") && !keyDown("d")) {
      this.player_sprite.velocity.x = 0;
      camera.zoom = 1.0
    }

  };

}