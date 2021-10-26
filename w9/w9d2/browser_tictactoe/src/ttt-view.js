class View {
  constructor(game, el) {
    this.game = game
    this.element = el
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
      ul.appendChild(li);
    }
  }
  
  bindEvents() {
    
  }

  handleClick(e) {}

  makeMove(square) {}

}

module.exports = View;
