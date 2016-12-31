import React, { Component } from 'react';
import logo from './logo.svg';
import '../../css/global.scss';
import './App.scss';

import Ping from '../Ping';
import APIVersion from '../APIVersion';

class App extends Component {
  render() {
    return (
      <div className="App">
        <div className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h2>Welcome to React</h2>
        </div>
        <p className="App-intro">
          To get started, edit <code>src/App.js</code> and save to reload.
          <p>Bootstrap Glyphicons:
            <p>Envelope icon: <span className="glyphicon glyphicon-envelope"></span></p>
            <p>Search icon: <span className="glyphicon glyphicon-search"></span></p>
            <p>Print icon: <span className="glyphicon glyphicon-print"></span></p>
          </p>
        </p>

        <Ping />
        <APIVersion />
      </div>
    );
  }
}

export default App;
