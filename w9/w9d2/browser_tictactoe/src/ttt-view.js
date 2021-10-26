class View {
  constructor(game, el) {
    this.game = game
    this.element = el
    this.setupBoard()
  }

  setupBoard() {
    this.element.innerHTML = `<ul></ul>`
    let ul = this.element.querySelector("ul")
    //ul.innerHTML = `<p> kdf</p>`
    for(let i=1; i< 10; i++){
      let li = document.createElement("li")
      li.setAttribute("data-id", i)
      ul.appendChild(li)
    }
  }
  
  bindEvents() {}

  handleClick(e) {}

  makeMove(square) {}

}

module.exports = View;
