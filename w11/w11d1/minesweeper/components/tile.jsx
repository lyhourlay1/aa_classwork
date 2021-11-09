import React from "react";

class Tile extends React.Component{
    constructor(props){
        super(props)
        
        this.state ={
            revealed : false,
            number: this.props.tile.adjacentBombCount(),
            flagged: this.props.tile.flagged,
            bombed: this.props.tile.bombed
        }
    }
    render(){

        if (this.revealed){
            return (
            <h1 className="revealed">T</h1>)
        }
        else{
            const reveal = this.props.tile.toggleFlag
            return (<h1 onClick={flag} className ="unrevealed">[]</h1>
            )
        }
    }
}
export default Tile;