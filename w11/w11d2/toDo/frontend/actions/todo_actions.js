export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";

const receiveTodos = (todos) => {
    return {
        type: RECEIVE_TODOS,
        todos,
    };
};