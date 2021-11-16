import React from 'react'

class PokemonDetail extends React.Component{

    componentDidMount(){
        this.props.requestSinglePokemon()
    }

    render(){

    }

}

export default PokemonDetail