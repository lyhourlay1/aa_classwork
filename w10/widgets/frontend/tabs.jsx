import React from "react";

class Tabs extends React.Component{
    constructor(props){
        super(props)
        this.state = {panelNum: 0}
        this.showTap = this.showTap.bind(this)
    }
    showTap(key){
        
        this.setState({panelNum: key})
    }
    render(){
        const header =this.props.panel.map((pane, index) =>{
            return(
                <li key={index} onClick={()=> this.showTap(index)}>{pane.title}</li>
            )
        })
        return (
            <div>{header} {this.props.panel[this.state.panelNum].content}</div>
            
        )
    }
}

export default Tabs