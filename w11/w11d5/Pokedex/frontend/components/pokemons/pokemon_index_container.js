import {connect} from 'react-redux'
import { selectAllPokemon } from '../../reducers/selectors';
import { requestAllPokemon } from '../../actions/pokemon_actions';
import {PokemonIndex} from ''

const mapStateToProps = state => ({
    // piece of state that container subscribes to
    pokemons: selectAllPokemon(state)
});

const mapDispatchToProps = dispatch => ({
    requestAllPokemon: (pokemons) => dispatch(requestAllPokemon(pokemons))
    // dispatch requestAllPokemon action.
});

const pokemonContainer = connect(mapStateToProps, mapDispatchToProps)(PokemonIndex)
export {pokemonContainer} 