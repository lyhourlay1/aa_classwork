import { combineReducers } from 'redux'
import pokemonsReducer from './pokemons_reducer'

export const rootReducer = combineReducers({
  pokemons: pokemonsReducer
})

