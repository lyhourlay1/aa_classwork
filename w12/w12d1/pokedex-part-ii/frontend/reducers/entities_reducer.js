import {combineReducers} from 'redux';
import pokemonReducer from './pokemon_reducer';
import itemReducer from './item_reducer';

const entitiesReducer = combineReducers({
  pokemon: pokemonReducer,
  items: itemReducer
})

export default entitiesReducer;