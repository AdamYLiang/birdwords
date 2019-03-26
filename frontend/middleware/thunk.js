//middleware to put inside our redux store 
//needs to accept and expect arguments in a certain order

const thunk = store => next => action => {
    // debugger
    if(typeof action === 'function'){
        // debugger
        return action(store.dispatch, store.getState);
    }
    // debugger
    return next(action);
}

export default thunk;