//npm install webpack webpack - cli react react - dom react - router - dom redux react - redux @babel/core @babel/preset - react @babel/preset-env babel-loader
// frontend/bench_bnb.jsx

import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";
import { deleteSession, postSession, postUser } from "./util/session_api_util";
import {createNewUser} from "./actions/session"

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
    window.postUser = postUser
    window.postSession = postSession
    window.deleteSession = deleteSession
    const store = configureStore()
    window.store= store;
    window.getState = store.getState;
    window.dispatch = store.dispatch;
    window.createNewUser = createNewUser;

    //  const test = store.dispatch(createNewUser(
    //     { username: "lee", password: "password", email: "lyhourlhdfsd" }))
    // window.test = test
});