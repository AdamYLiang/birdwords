import * as UserAPIUtil from '../util/user_api_util';

export const RECEIVE_USER = 'RECEIVE_USER';
export const RECEIVE_USERS = 'RECEIVE_USERS';

const receiveUser = payload => {
  // debugger
  return {
    type: RECEIVE_USER,
    user: payload.user,
    location: payload.location
  };
};

const receiveUsers = users => {
  // debugger
  return {
    type: RECEIVE_USERS,
    users
  };
};

export const fetchUser = id => {
  // debugger
  return dispatch => {
    // debugger
    UserAPIUtil.fetchUser(id).then(payload => {
      // debugger
      return dispatch(receiveUser(payload));
    });
  };
};

export const fetchUsers = () => {
  // debugger
  return dispatch => {
    // debugger
    UserAPIUtil.fetchUsers().then(user => {
      // debugger
      return dispatch(receiveUsers(user));
    });
  };
}; 