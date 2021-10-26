
function MovingObject(object) {
  this.pos = object["pos"];
  this.vel = object["vel"];
  this.radius = object["radius"];
  this.color = object["color"];
};

MovingObject.prototype.draw = function(ctx){
  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill();
}
const  NORMAL_FRAME_TIME_DELTA = 1000/60;
MovingObject.prototype.move = function(timeDelta){
  const velocityScale = timeDelta / NORMAL_FRAME_TIME_DELTA
  offsetX = this.vel[0] * velocityScale
  offsetY = this.vel[1] * velocityScale
  this.pos =[this.pos[0]+ offsetX, this.pos[1]+ offsetY ]
  //this.draw(document.getElementById("game-canvas").getContext("2d"))
}

module.exports = MovingObject;