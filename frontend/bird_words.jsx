import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';
// import * as ChirpActions from './actions/chirp_actions';

// const defaultState = {
//     entities: {
//         users: {
//             1: {
//                 id: 1,
//                 name: 'Ada Lovelace',
//                 birth_year: 1815,
//             },
//         },
//         chirps: {
//             1: {
//                 id: 1,
//                 body: "who is screaming \"log off\" at my house. show yourself, coward. i will never log off",
//                 author_id: 1,
//             },
//             2: {
//                 id: 2,
//                 body: "hear this trolls: ive been secretly respecting the flag in the privacy of my garage for 12 hrs a day , maxing out its power to insane levels",
//                 author_id: 1,
//             },
//         }
//     }
// }

document.addEventListener('DOMContentLoaded', () => {
  // debugger
  // can pass in a preloaded state here if needed
  const store = configureStore();

//  TESTING!!!//
  window.getState = store.getState;
//   window.dispatch = store.dispatch;
//   window.fetchChirps = ChirpActions.fetchChirps;
//  TESTING!!!//

  const root = document.getElementById('root');
  ReactDOM.render(<Root store={store} />, root);
});
