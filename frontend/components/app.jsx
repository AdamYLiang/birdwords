import React from 'react';
import ChirpIndex from './chirps/chirp_index';
import NewChirpForm from './chirps/new_chirp_form_container';
import ChirpShow from './chirp/chirp_show';
import UserIndex from './users/user_index';
import { Route, Switch } from 'react-router-dom';

//Component's argument will always be the props
//Implicit returns (one-liners) cannot use debuggers
export default (props) => {
  // debugger
  // return (
  //   <div className="app-content">
  //     <div>
  //       <ChirpIndex />
  //       <NewChirpForm />
  //     </div>
  //     <UserIndex />
  //   </div>
  // );

  return (
    <div className="app-content">
      <div>
        <Switch>
          <Route path="/chirps/:chirpId" component={ChirpShow} />
          <Route path="/new/chirps" component={NewChirpForm} />
          <Route path="/users" component={UserIndex} />
          <Route path="/" component={ChirpIndex} />
        </Switch>
      </div>
    </div>
  );
}
