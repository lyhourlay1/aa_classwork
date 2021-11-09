import { combineReducers} from "redux";
import todosReducer from "./todos_reducer";

export const rootReducer = combineReducers({
  todos: todosReducer
})

