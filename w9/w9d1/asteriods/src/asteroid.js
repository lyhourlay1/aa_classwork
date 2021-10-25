const Util = require("./utils");
const MovingObject = require("./moving_object");
const DEFAULTS = { COLOR: "#5F9EA0", RADIUS: 5}

function Asteroid(object) {
  object.color = DEFAULTS.COLOR;
  object.radius = DEFAULTS.RADIUS;
  object.pos ||= [30,30];
  object.vel = Util.randomVec(norm(object.pos));


  // this = instance of Asteroid
  MovingObject.call(this, object) 

  function dist([x_1, y_1], [x_2, y_2]) {
    return Math.sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2)
  }

  function norm([x_1, y_1]) {
    return dist([0, 0], [x_1, y_1])
  }
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;
