import { RECEIVE_USER } from '../../actions/user_actions';

export default (state = {}, action) => {
  const newState = Object.assign({}, state);

  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_USER:
      newState[action.location.id] = action.location;
      return newState;
      // const newerState = Object.assign(newState, action.location);
      // debugger
      // return newerState;
    default:
      return state;
  }
}