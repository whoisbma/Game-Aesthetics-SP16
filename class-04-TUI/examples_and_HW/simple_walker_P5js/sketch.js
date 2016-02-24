var walker;

function setup() {
  createCanvas(500, 500);
  walker = new Walker();
}

function draw() {
  walker.update();
  walker.display();
}

function Walker() {
  this.x = width / 2;
  this.y = height / 2;
  this.numMoves = 0;
  this.MAXMOVES = 100;

  this.update = function() {
    if (this.numMoves < this.MAXMOVES) {
      var r = floor(random(4));
      if (r == 0) {
        this.y--;
      } else if (r == 1) {
        this.x++;
      } else if (r == 2) {
        this.y++;
      } else if (r == 3) {
        this.x--;
      }
    }
    this.numMoves++;
  }

  this.display = function() {
    point(this.x, this.y);
  }

}