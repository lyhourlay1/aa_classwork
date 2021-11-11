import React from "react"

export const TodoListItem = (props)=>{
    return (<li> 
        {props.todo.title}
        <button onClick={props.removeTodo}> Remove</button>
    </li>)

}