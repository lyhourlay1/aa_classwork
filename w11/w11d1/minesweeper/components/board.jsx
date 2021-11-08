import React from "react"
import Tile from "./tile"

class Board extends React.Component{
    constructor(props){
        super(props)
    }
    render(){
        return(
            this.props.board.grid.map((ele,i)=>{
                return (
                    <div>

                        ele.map((tile, j)=>{
                            console.log(tile)
                            return  <Tile tile={tile} update={this.props.update}/>
                        })
                    </div>
                )})
            )           
    }
}

export default Board;