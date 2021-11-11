import React from "react"


export const TodoListItem = (props)=>{
  // debugger
  let done = props.todo.done ? "Undo" : "Done"

  const toggleDone = (props) => {
    let newTodo = props.todo
    if (newTodo.done){
      done = "Done"
      newTodo.done = false;
    } else {
      done = "Undo"
      newTodo.done = true;
    }
    props.receiveTodo(newTodo);
  }


  return (<li> 
      {props.todo.title}
      <button onClick={()=>{props.removeTodo(props.todo)}}> Remove</button>

      <button onClick={()=>{toggleDone(props)}}>{done}</button>
  </li>)

}