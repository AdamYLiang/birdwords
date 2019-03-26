import {
  RECEIVE_CHIRP,
  REMOVE_CHIRP,
  RECEIVE_CHIRPS,
} from '../../actions/chirp_actions';

export default (state = {}, action) => {
  // debugger
  const oldState = Object.freeze(state);
  // const { chirp } = action;

  switch (action.type) {
    case RECEIVE_CHIRPS:
      // debugger 
      const newChirps = {};
      action.chirps.forEach(chirp => newChirps[chirp.id] = chirp)
      return Object.assign({}, oldState, newChirps);
    case RECEIVE_CHIRP:
      // debugger
      //Object.assign, for our purposes, does the same thing as lodash { merge }
      return Object.assign({}, oldState, { [action.chirp.id]: action.chirp });
    case REMOVE_CHIRP:
      const newState = Object.assign({}, oldState);
      delete newState[action.id];
      return newState;
    default:
      return state; 
  }
};