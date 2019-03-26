//import all of named exports in a file using * as what you want to call it
import * as ChirpApiUtil from '../util/chirp_api_util';

export const RECEIVE_CHIRP = 'RECEIVE_CHIRP';
export const RECEIVE_CHIRPS = 'RECEIVE_CHIRPS';
export const REMOVE_CHIRP = 'REMOVE_CHIRP';

//actions have a key of type
//action creators when invoked create actions for us
export const receiveChirp = (chirp) => {
  // debugger
  return {
    type: RECEIVE_CHIRP,
    chirp,
  };
};

export const receiveChirps = (chirps) => {
  // debugger
  return {
    type: RECEIVE_CHIRPS,
    chirps
  };
};

export const removeChirp = id => {
  return {
    type: REMOVE_CHIRP,
    id,
  };
};

export const fetchChirp = (id) => {
  return (dispatch) => {
    return ChirpApiUtil.fetchChirp(id).then (
      (chirp) => {
        dispatch(receiveChirp(chirp));
      }
    );
  };
};

//thunk action creators return functions to invoke AJAX requests
//thunk actions need to be functions
export const fetchChirps = () => {
  // debugger
  // hits the thunk middleware which will invoke the following function
  // with dispatch
  // thunk middleware gives us dispatch
  return (dispatch) => {
    // debugger
    return ChirpApiUtil.fetchChirps().then(
      (chirps) => {
        // console.log(chirps); // chirps will be the responseJSON of the HTTP response
        // debugger

        // hit the middleware then the reducer
        return dispatch(receiveChirps(chirps));
      }
    );
  };
};

export const createChirp = chirp => dispatch => {
  // debugger
  return ChirpApiUtil.createChirp(chirp).then((chirp) => {
    return dispatch(receiveChirp(chirp));
  });
};
