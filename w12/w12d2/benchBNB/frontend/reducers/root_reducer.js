import { combineReducers } from "redux";
import {entitiesReducer} from "./entities_reducer";
import { sessionReducer } from "./session_reducer";
import { errorsReducer } from "./errors_reducer";

export const rootReducer= combineReducers({
    entitites: entitiesReducer,
    session: sessionReducer,
    errors: errorsReducer
})