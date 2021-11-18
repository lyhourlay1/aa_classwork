import { postSession, postUser, deleteSession } from "../util/session_api_util";
export const RECEIVE_CURRENT_USER = "RECEIVE_CURRENT_USER"
export const LOGOUT_CURRENT_USER = "LOGOUT_CURRENT_USER"
export const RECEIVE_SESSION_ERRORS = "RECEIVE_SESSION_ERRORS"


export const createNewUser = formUser => dispatch => postUser(formUser)
    .then(user => dispatch(receiveCurrentUser(user)), error=> dispatch(receiveSessionErrors(error)));

export const login = formUser => dispatch => postSession(formUser)
    .then(user => dispatch(receiveCurrentUser(user)))

export const logout = () => dispatch => deleteSession()
    .then(() => dispatch(logoutCurrentUser()))

const receiveCurrentUser = user => ({
    type: RECEIVE_CURRENT_USER,
    user
})

const logoutCurrentUser = () => ({
    type: LOGOUT_CURRENT_USER,
})

const receiveSessionErrors = errors =>({
    type: RECEIVE_SESSION_ERRORS,
    errors: errors.responseJSON
})

