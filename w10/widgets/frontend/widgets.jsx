import React from 'react';
import ReactDOM from 'react-dom';
import Clock from "./clock"

document.addEventListener("DOMContentLoaded", ()=>{
    const root = document.getElementById("root");
    //const name = "EFRM"
    const main = document.getElementById("root");
    ReactDOM.render(<Clock/>, root )
})

//export default Widgets