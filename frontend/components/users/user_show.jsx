import React from 'react';
import { connect } from 'react-redux';
import { fetchUser } from '../../actions/user_actions';

class UserShow extends React.Component {
  componentDidMount() {
    // debugger
    const { chirperId, fetchChirper } = this.props;
    fetchChirper(chirperId);
  }

  componentDidUpdate(prevProps) {
    // debugger
    const { chirperId, fetchChirper } = this.props;
    if (chirperId != prevProps.chirperId) {
      fetchChirper(chirperId);
    }
  }

  render() {
    const { chirper = {}, location = {}, closeShow, chirpCount } = this.props;

    return (
      <aside className="user-show">
        <h3>{chirper.name}</h3>
        <h5>{location.name}</h5>
        <p><strong>Chirp count:</strong>{chirpCount}</p>
        <button onClick={closeShow}>Close</button>
      </aside>
    );
  }
}

const msp = (state, ownProps) => {
  const chirper = state.entities.users[ownProps.chirperId];
  const location = state.entities.locations[chirper.location_id];
  const chirpCount = Object.values(state.entities.chirps).filter(chirp => chirp.author_id == ownProps.chirperId).length
  return {
    chirper,
    chirpCount,
    location,
  };
};

const mdp = dispatch => {
  return {
    fetchChirper: id => dispatch(fetchUser(id)),
  };
};

export default connect(msp, mdp)(UserShow);