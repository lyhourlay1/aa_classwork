import React from 'react';
import ReactDOM from 'react-dom';
import Clock from "./clock"
import Tabs from "./tabs"

const panel = [
    {title: "one", content: "I am the first one"}, 
    {title: "two", content: "I am the second one"}, 
    {title: "three", content: "I am the third one"}, 
]
function Root() {
    return (
        <div>
            <Clock />
            <Tabs panel={panel}/>
        </div>
    );
}
document.addEventListener("DOMContentLoaded", ()=>{
    ReactDOM.render(<Root/>, document.getElementById("main") )
})
