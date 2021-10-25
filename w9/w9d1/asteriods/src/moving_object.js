
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

MovingObject.prototype.move = function(){
  this.pos =[this.pos[0]+ this.vel[0], this.pos[1]+ this.vel[1] ]
  this.draw(document.getElementById("game-canvas").getContext("2d"))
}

module.exports = MovingObject;