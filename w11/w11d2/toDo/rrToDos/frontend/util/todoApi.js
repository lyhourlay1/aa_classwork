

export const createTodo = (todo) => {
  $.ajax({
    method: 'POST',
    url: '/api/todos',
    data: {todo: todo}
  })
}

export const updateTodo = (todo) => {
  $.ajax({
    method: 'PATCH',
    url: `/api/todos/${todo.id}`,
    data: { todo: todo }
  })
}

export const indexTodo = (todo) =>{
  $.ajax({
    method: 'GET',
    url: '/api/todos'
  })
}


export const showTodo = (todo) => {
  $.ajax({
    method: 'GET',
    url: `/api/todos/${todo.id}`
  })
}

export const showTodo = (todo) => {
  $.ajax({
    method: 'DELETE',
    url: `/api/todos/${todo.id}`
  })
}