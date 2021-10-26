const Game = require("../ttt_node/game.js");
class View {
  constructor(game, el) {
    this.game = game
    this.element = el
    this.bindEvents()
  }

  setupBoard() {
    this.element.innerHTML = `<ul></ul>`
    let ul = this.element.querySelector("ul")
    ul.style.display = "flex"
    ul.style.flexWrap= "wrap"
    ul.style.width = "270px"

    for(let i=0; i< 9; i++){
      let li = document.createElement("li");
      // li.addEventListener("mouseenter", (event) => {
      //   event.target.classList.toggle('hover-over')
      // })
      li.addEventListener("mouseenter", (event) => {
        event.target.style.backgroundColor = "red"
      })
      li.addEventListener("mouseleave", (event) => {
        event.target.style.backgroundColor = "white"
      })
      li.setAttribute("data-id", i);
      li.setAttribute("data-col", i%3);
      li.setAttribute("data-row", Math.floor(i/3));
      li.style.display = "block";
      li.style.width = "75px";
      li.style.height = "75px";
      li.style.backgroundColor= "white";
      li.style.border = "5px solid black";
      console.log(li.dataset.row)
      ul.appendChild(li);
    }
  }
  
  bindEvents() {
    this.element.addEventListener("click", this.handleClick)
  }

  handleClick(e) {
    e.target.textContent = "x"//this.game.currentPlayer
    let pos = [e.target.dataset.row, e.target.dataset.col]
    this.game.playMove(pos)
  }

  makeMove(square) {}

}

module.exports = View;
