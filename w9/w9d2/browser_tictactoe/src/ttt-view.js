const Game = require("../ttt_node/game.js");
class View {
  constructor(game, el) {
    this.game = game;
    this.element = el;
    this.setupBoard();
    this.bindEvents();
  }

  setupBoard() {
    this.element.innerHTML = `<ul></ul><p></p>`
    let ul = this.element.querySelector("ul")
    ul.classList.add('ul-default');
    // ul.style.display = "flex"
    // ul.style.flexWrap= "wrap"
    // ul.style.width = "270px"

    for(let i=0; i< 9; i++){
      let li = document.createElement("li");
      // li.addEventListener("mouseenter", (event) => {
      //   event.target.classList.toggle('hover-over')
      // })
      // li.addEventListener("mouseenter", (event) => {
      //   event.target.style.backgroundColor = "red"
      // })
      // li.addEventListener("mouseleave", (event) => {
      //   event.target.style.backgroundColor = "white"
      // })
      li.setAttribute("data-id", i);
      li.setAttribute("data-col", i%3);
      li.setAttribute("data-row", Math.floor(i/3));
      li.classList.add('list-default')
      // li.style.display = "block";
      // li.style.width = "75px";
      // li.style.height = "75px";
      // li.style.backgroundColor= "white";
      // li.style.border = "5px solid black";
      ul.appendChild(li);
    }
  }
  
  bindEvents() {
    // let lis = this.element.querySelectorAll("li");
    // lis.forEach((li) => {
    //   li.addEventListener("click", this.handleClick.bind(this))
    // })
    
    let ul = this.element.querySelector("ul");
    ul.addEventListener("click", this.handleClick.bind(this))

    // this.element.addEventListener("click", function(){
    //   console.log(this)
    // }) //this is the element inside of the function

    // this.element.addEventListener("click", (e) => {
    //   e.target.textContent = "x"//this.game.currentPlayer
    //   let pos = [e.target.dataset.row, e.target.dataset.col]
    //   this.game.playMove(pos)
    // })
  }

  handleClick(e) {
    let pos = [e.target.dataset.row, e.target.dataset.col]
    let noError = true;
    let currentPlayer = this.game.currentPlayer
    try{this.game.playMove(pos)}
    catch(error){noError = false}
    if (noError) {
      this.makeMove(e.target, currentPlayer)
    } else {
      alert("invalid position")
    }
  }

  makeMove(square, currentPlayer) {
    square.textContent = currentPlayer.toUpperCase()
    if (this.game.currentPlayer === "x") {
      square.classList.add('x-clicked')
    } else {
      square.classList.add('o-clicked')
    }
    if (this.game.isOver()) {
      console.log(this.game.winner());
      let p = this.element.querySelector("p")
      if (this.game.winner()) {
        p.textContent = `The winner is ${this.game.winner()}!`
        this.element.querySelector("ul").removeEventListener("click", ()=>{});
      } else {
        p.textContent = 'Its a tie!'
      }
    }
  }

}

module.exports = View;
