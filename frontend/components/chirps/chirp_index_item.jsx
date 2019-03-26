import React from 'react';
import { connect } from 'react-redux';
import {
  removeChirp,
} from '../../actions/chirp_actions';
import { Link } from 'react-router-dom';

const ChirpItem = ({ chirp, author, deleteChirp }) => {
  return (
    <li>
      <strong>{author.name}</strong>: {chirp.body}
      <br />
      <Link to={`/chirps/${chirp.id}`}>Go to chirp</Link>
      <br/>
      <button type="button" onClick={() => deleteChirp(chirp.id)}>
        De-chirp Chirp
      </button>
    </li>
  );
};
//second argument are all the props that we have written in the component
//here it will contain the chirp that we passed in from chirp_index
const msp = (state, ownProps) => {
  // debugger
  const defaultAuthor = { name: 'Anonymous' };
  const author = state.entities.users[ownProps.chirp.author_id] || defaultAuthor;
  return {
    author,
  };
};

const mdp = (dispatch) => {
  return {
    deleteChirp: id => dispatch(removeChirp(id)),
  }
}

export default connect(msp, mdp)(ChirpItem);
