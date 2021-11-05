import React from "react"
import Widgets from "./widgets"

// const Clock =(props)=>{
//     return (
//         <div>
//             <h1>React works</h1>
//         </div>
//     )
// }
class Clock extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            newDate: new Date()
        }
        
        this.tick= this.tick.bind(this)

    }
    render(){
        return (
            <div>             
                <h1>{this.state.newDate.toString()}</h1>
            </div>
        )
    }
    addComponentDidMount(){
        setInterval(this.tick, 1000)
    }

    tick(){
        this.setState({newData: new Date()})
    }
}
export default Clock