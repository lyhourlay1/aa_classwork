const Asteroid = require("./asteroid")

const DEFAULTS = { DIM_X: 100, DIM_Y: 100, NUM_ASTEROIDS: 20}

function Game(ctx) {
  this.dim_x = DEFAULTS.DIM_X;
  this.dim_y = DEFAULTS.DIM_Y;
  this.num_asteroids = DEFAULTS.NUM_ASTEROIDS;
  this.asteroidArr = [];
  this.addAsteroids(ctx);
}

Game.prototype.addAsteroids = function(ctx) {
  for (let i = 0; i < this.num_asteroids; i++) {
    let position = this.randomPos()
    let asteroid = new Asteroid({pos: position});
    this.asteroidArr.push(asteroid);
  }
  this.draw(ctx)
}

Game.prototype.randomPos = function() {
  let x = Math.floor(Math.random() * this.dim_x)
  let y = Math.floor(Math.random() * this.dim_y)
  return [x,y]
}

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);
  ctx.fillStyle("pink")
  for (let i = 0; i < this.asteroidArr.length; i++) {
    this.asteroidArr[i].draw(ctx);
  }
}

Game.prototype.moveObjects = function(ctx) {
  ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);

  for (let i = 0; i < this.asteroidArr.length; i++) {
    console.log("before")
    console.log(this.asteroidArr[i])
    
    this.asteroidArr[i].move();
    console.log("after")
    console.log(this.asteroidArr[i])
  }
  this.draw(ctx);
}

module.exports = Game;