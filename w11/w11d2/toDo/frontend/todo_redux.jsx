import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import {receiveTodos, receiveTodo, removeTodo} from "./actions/todo_actions";
import {receiveSteps, receiveStep, removeStep} from "./actions/step_actions";

document.addEventListener("DOMContentLoaded", ()=>{
    const root= document.getElementById("root")
    ReactDOM.render(<h1>to dos app</h1>, root)

    const store = configureStore();

    const newSteps = [{ id: 1, title: 'Dispatch actions', done: false, todo_id: 1 }, { id: 2, title: 'Dispatch actions', done: false, todo_id: 2}, { id: 3, title: 'Dispatch actions', done: false, todo_id: 3 }];

    const newTodos = [{ id: 1, title: 'Learn Redux', body: 'It is fundamental', done: false }, { id: 2, title: 'Learn Redux2', body: 'It is fundamental', done: false }, { id: 3, title: 'Learn Redux2', body: 'It is fundamental', done: false }];

    window.newSteps = newSteps
    window.newTodos = newTodos

    window.store = store;
    window.receiveTodos = receiveTodos;
    window.receiveTodo = receiveTodo;
    window.removeTodo = removeTodo;
    window.receiveSteps = receiveSteps;
    window.receiveStep = receiveStep;
    window.removeStep = removeStep;
})

