import React from 'react'
//import Widgets from "./widgets"

class Clock extends React.Component{
    constructor(props){
        super(props)
        this.state = {
            newDate: new Date()
        }
        
        this.tick= this.tick.bind(this)

    }
    componentDidMount(){
        this.intervalId =setInterval(this.tick, 1000)
    }
    componentWillUnmount(){
        clearInterval(this.intervalId);
    }
    
    tick(){
        this.setState({newDate: new Date()})
    }
    render(){
        let date = this.state.newDate
        return (
            <div>             
                <h1>{date.getHours().toString()}:{date.getMinutes().toString()}:{date.getSeconds().toString()}</h1>
            </div>
        )
    }
}
export default Clock