import React from "react"
import { Link } from "react-router-dom";

class PokemonIndexItem extends React.Component {

  render() {
    
    return (
      <li className='pokemon-index-item' >
        <Link  to={`/pokemon/${this.props.pokemon.id}`}>
          <h3>{this.props.pokemon.name}</h3>
          <img src={this.props.pokemon.imageUrl}/>
        </Link>
      </li>
    )
  }

}

export default PokemonIndexItem