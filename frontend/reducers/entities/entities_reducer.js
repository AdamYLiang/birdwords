import { combineReducers } from 'redux';
import users from './users_reducer';
import chirps from './chirps_reducer';
import locations from './locations_reducer';

export default combineReducers({
    users,
    chirps,
    locations,
});