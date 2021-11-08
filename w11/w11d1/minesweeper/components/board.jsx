import React from "react"
import * as Minesweeper from "./minesweeper"

class Board extends React.Component{
    constructor(props){
        super(props)
    }
    render(){
        return(
        this.props.board.map((ele,i)=>{
            ele.map((pos, j)=>{ 
                const newTile = new Tile(this,[i,j])
                const keyValue = i+j   
                <div key={keyValue}>
                    <Tile tile={newTile} update={this.props.update}/>
                </div>
            })
        })
    }
}

export default Board