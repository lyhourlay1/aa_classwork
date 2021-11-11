import React from "react"
import { TodoListItem } from "../todo_list/todo_list_item";
import {TodoForm} from "../todo_list/todo_form"

const TodoList = (props) => {
  // debugger
  return (
    <div>
      <h1>this is to do list</h1>
      <ul>
        {
          props.todos.map((todo,index) => <TodoListItem todo={todo} key={index} removeTodo= {props.removeTodo} receiveTodo={props.receiveTodo}/>)
        }
      </ul>
      <TodoForm receiveTodo ={props.receiveTodo}/>

    </div>
  )
}


export default TodoList;
