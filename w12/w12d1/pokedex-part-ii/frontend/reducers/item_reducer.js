import { receiveAllPokemon, receiveSinglePokemon, RECEIVE_SINGLE_POKEMON } from "../actions/pokemon_actions";

const itemsReducer = (state={}, action)=>{
    Object.freeze(state);
    let nextState = Object.assign({}, state)
    switch(action.type){
        case RECEIVE_SINGLE_POKEMON:
            nextState[action.items]= action.items
            return nextState
        default:
            return state
    }
}
export default itemsReducer