const Game = require("./Game")


function GameView(ctx){
    this.game = new Game(ctx)
}

GameView.prototype.start= function(ctx){
    setInterval(()=>{this.game.moveObjects(ctx)}, 20)
}

module.exports = GameView;