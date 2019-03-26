import React from 'react';
import { connect } from 'react-redux';
import ChirpIndexItem from './chirp_index_item';
import { fetchChirps } from '../../actions/chirp_actions';

// PRESENTATIONAL
class ChirpIndex extends React.Component {
  constructor(props){
    // debugger
    super(props);
  }

  //componentDidMount is invoked after the first render
  componentDidMount() {
    //invoke function to fetch chirps
    // debugger
    // this.props.getChirps();
    const { getChirps } = this.props;
    getChirps();
  }

  // re-render occurs if props or state changes (or parent component re-renders)
  //by convention render is the last defined method in a class component
  render() {
    // will be rendered twice initially, once before we get the chirps,
    // then again after our props change because we now have the chirps
    // in our redux store
    // debugger
    const { chirps } = this.props;
    // chirpItems will be an empty array if chirps is an empty array
    const chirpItems = chirps.map(chirp => {
      return (<ChirpIndexItem key={chirp.id} chirp={chirp} />);
    });
  
    return (
      <div className="chirp-index">
        <h3>Check out all the Chirps!</h3>
        <ul>
          {chirpItems}
        </ul>
      </div>
    );
  }
}

//Use a class component when:
// 1. We need component state
// 2. we need lifecycle methods.

// CONTAINER (Connected Component)
  // connects the store to the presentational component
  // makes rendering the presentational component efficient by only
  // passing props that need the redux store into the presentational 
  // component (the presentational will only rerender when these change)
// mapStateToProps: props from our store's state
const msp = (state, ownProps) => {
  // ownProps is the props that get passed into the container component
  // all of ownProps is also accessible in presentational component by default
  // so there is no need to return them in mapStateToProps
  // ownProps will get merged into the presentational component's props
  // BUT sometimes we need information from ownProps to access some parts of the
  // redux store state to pass down into the presentational component
  const { chirps } = state.entities;
  // debugger
  return {
    // get all the chirps in an array of objects
    // (chirps won't be undefined. it will always be an object)
    chirps: Object.values(chirps), // will be empty array if no chirps
  };
};

// mapDispatchToProps: props that can have access to dispatch
  // whenever we need props that can dispatch actions, we put them
  // in mapDispatchToProps
const mdp = (dispatch, ownProps) => {
  return {
    getChirps: () => dispatch(fetchChirps()),
  }
}

// the return objects of mapStateToProps and mapDispatchToProps
// will be merged into the presentational component's props object

// can have container and presentational component in the same file
// not just `export default ChirpIndex` anymore
// we always want to render the connected (container) component

//connect method links our redux store with our react components
//connect returns a function, and then it is invoked and returns a connected component
export default connect(msp, mdp)(ChirpIndex);
