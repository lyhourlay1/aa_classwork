const Asteroid = require("./asteroid")

const DEFAULTS = { DIM_X: 100, DIM_Y: 100, NUM_ASTEROIDS: 20}

function Game(ctx, canvas) {
  this.dim_x = DEFAULTS.DIM_X;
  this.dim_y = DEFAULTS.DIM_Y;
  this.num_asteroids = DEFAULTS.NUM_ASTEROIDS;
  this.asteroidArr = [];
  this.addAsteroids(ctx, canvas);
}

Game.prototype.addAsteroids = function(ctx, canvas) {
  for (let i = 0; i < this.num_asteroids; i++) {
    let position = this.randomPos()
    let asteroid = new Asteroid({pos: position});
    this.asteroidArr.push(asteroid);
  }
  this.draw(ctx, canvas)
}

Game.prototype.randomPos = function() {
  let x = Math.floor(Math.random() * this.dim_x)
  let y = Math.floor(Math.random() * this.dim_y)
  return [x,y]
}

Game.prototype.draw = function(ctx, canvas) {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  for (let i = 0; i < this.asteroidArr.length; i++) {
    this.asteroidArr[i].draw(ctx);
  }
}

Game.prototype.moveObjects = function(ctx) {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  for (let i = 0; i < this.asteroidArr.length; i++) {
    this.asteroidArr[i].move();
  }
}

module.exports = Game;