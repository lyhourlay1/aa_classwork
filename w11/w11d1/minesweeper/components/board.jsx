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
                    //const array = Array.from(ele)
                    // console.log(ele.length)
                    <div key={i} class ="container">
                        { 
                            ele.map((tile, j)=>{
                                //console.log(tile)
                                return  <Tile key={j} tile={tile} update={this.props.update}/>
                            })
                        }
                    </div>
                )})
            )           
    }
}

export default Board;