import { Provider } from 'react-redux';
import React from 'react';
import App from './app';
import { HashRouter } from 'react-router-dom';

export default (props) => {
  // debugger
  return (
    <Provider store={props.store}>
      <HashRouter>
        <App />
      </HashRouter>
    </Provider  >
  );
}