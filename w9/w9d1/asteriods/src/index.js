const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");
const Game = require("./game.js");
const GameView = require("./game_view.js");

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;
window.Game = Game;
window.GameView = GameView;

window.addEventListener('DOMContentLoaded', function() {
    const canvas = document.getElementById("game-canvas");
    const ctx = canvas.getContext('2d');
    // const a1 = new Asteroid({pos: [50,50]});
    // console.log(a1);
    // a1.draw(ctx);
    const v = new GameView(ctx);
    v.start(ctx)
})

console.log("webpack is working!")
console.log("test is working!")
