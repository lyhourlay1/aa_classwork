import React from 'react'

function uniqueId() {
    return new Date().getTime();
}

export class TodoForm extends React.Component {
    constructor(props){
        super(props)

        this.state={
            title: "",
            id: uniqueId(),
            done: false
        }

        this.handleSubmit= this.handleSubmit.bind(this)
        this.updateTitle = this.updateTitle.bind(this)

    }

    handleSubmit(e){
        e.preventDefault()
        let todo = this.state
        this.props.receiveTodo(todo)

        this.setState({
            title: "",
            id: uniqueId(),
            done: false
        })
    }

    updateTitle(e){
        this.setState({
            title: e.target.value
        })
    }

    render(){
        console.log(this.state)
        // debugger
        return (
          <>
          <h2>create a new to do item</h2>
            <form onSubmit={this.handleSubmit}>
                <label>title
                    <input type="text" onChange={this.updateTitle} value ={this.state.title} />
                </label>

                <input type="submit" value="SUBMIT" />
            </form>
          </>
        )
    }
}