import { combineReducers } from 'redux';
import entities from './entities/entities_reducer';

export default combineReducers({
    entities,
    // errors,
    // session,
    // ui
});

// this determines the state shape