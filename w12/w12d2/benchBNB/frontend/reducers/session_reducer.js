import { LOGOUT_CURRENT_USER, RECEIVE_CURRENT_USER, RECEIVE_ERRORS } from "../actions/session";

const nullSession = {id: null}
export const sessionReducer= (state =nullSession,action)=>{
    Object.freeze(state);
    switch(action.type){
        case RECEIVE_CURRENT_USER:
            return Object.assign({}, {id: action.user.id})
        case LOGOUT_CURRENT_USER:
            return nullSession
        default:
            return state
    }
}