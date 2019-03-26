import React from 'react';
import { connect } from 'react-redux';
import { fetchChirp } from '../../actions/chirp_actions';

class ChirpShow extends React.Component {
  // constructor(props) {
  //   super(props); // super is the constructor function inherited from React.Component
  // }

  componentDidMount() {
    // called only when finished creating the component NOT when it re renders
    // changing the chirpId in the url does not cause the component to unmount 
    // and mount again. changing the chirpId just causes it to re render
    // only when the page refreshes does it unmount and mount again
    debugger
    this.props.fetchChirp(this.props.match.params.chirpId);
  }

  componentDidUpdate(prevProps) {
    // componentDidUpdate will be called every time after a RE render, 
    // BUT not the FIRST render
    // we need specify when this should be called otherwise we will fetch the 
    // chirp every time the component re-renders
    debugger
    if (prevProps.match.params.chirpId !== this.props.match.params.chirpId) {
      // looking for a change in chirpId is very specific. If we have other
      // url options on the same page after the chirpId, this is only looking
      // for a change in chirpId, so fetchChirp will not be called
      // fetch the chirp again if the chirpId changes in the url
      this.props.fetchChirp(this.props.match.params.chirpId);
    }
  }

  render() {
    debugger
    // if (!this.props.chirp) {
    //   return (null);
    // }
    // if this.prop.chirp is undefined, then if we try to call .body on it,
    // then our app will error out and break
    return (
      <h4>{this.props.chirp.body}</h4>
    );
  }
}

const msp = (state, ownProps) => {
  const { chirpId } = ownProps.match.params;
  const chirp = state.entities.chirps[chirpId] || {};
  debugger
  return {
    chirp
  };
};

const mdp = dispatch => {
  return {
    fetchChirp: (id) => dispatch(fetchChirp(id))
  };
};

export default connect(msp, mdp)(ChirpShow);