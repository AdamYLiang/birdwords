import { connect } from 'react-redux';
import {
  createChirp,
} from '../../actions/chirp_actions';
import ChirpForm from './chirp_form';

const msp = (state) => {
  return {
    body: '',
    inputLabel: 'New Chirp',
  };
};

const mdp = (dispatch) => {
  return {
    chirpAction: chirp => dispatch(createChirp(chirp)),
  };
};

export default connect(msp, mdp)(ChirpForm);