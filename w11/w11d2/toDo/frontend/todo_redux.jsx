import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import {receiveTodos, receiveTodo, removeTodo} from "./actions/todo_actions";

document.addEventListener("DOMContentLoaded", ()=>{
    const root= document.getElementById("root")
    ReactDOM.render(<h1>to dos app</h1>, root)

    const store = configureStore();
    window.store = store;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.removeTodo = removeTodo;
})

