import { RECEIVE_USER, RECEIVE_USERS } from '../../actions/user_actions';

export default (state = {}, action) => {
    // debugger
    const newState = Object.assign({}, state);

    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_USERS:
            // let users = {};
            // action.users.map(user => users[user.id] = user);
            // return users;
            return action.users;
        case RECEIVE_USER:
            // debugger
            newState[action.user.id] = action.user;
            return newState;
        default:
            return state;
    }
}; 