import React from "react";
import * as Minesweeper from "./components/minesweeper"; 

class Game extends React.Component {

    constructor(props){
        super(props);
        this.state = {
            board: new Minesweeper.Board(9, 5)
        }
        console.log(this.state)
    }

    render(){
        return (
            <h1>Test is working!</h1>

        )
    }

}

export default Game;