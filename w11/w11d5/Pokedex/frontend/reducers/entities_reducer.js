import { combineReducers } from 'redux'
import pokemonsReducer from './pokemons_reducer'

export const entitiesReducer = combineReducers({
  pokemons: pokemonsReducer,
})

