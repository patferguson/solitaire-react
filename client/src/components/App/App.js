import React, { Component } from 'react';
import logo from './logo.svg';
import '../../css/global.scss';
import './App.scss';

import Ping from '../Ping';
import APIVersion from '../APIVersion';
import ReactComponentsTest from '../ReactComponentsTest';

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
        </p>

        <div>
          <p>Bootstrap Glyphicons:</p>
          <p>Envelope icon: <span className="glyphicon glyphicon-envelope"></span></p>
          <p>Search icon: <span className="glyphicon glyphicon-search"></span></p>
          <p>Print icon: <span className="glyphicon glyphicon-print"></span></p>
        </div>

        <ReactComponentsTest />
        <Ping />
        <APIVersion />
      </div>
    );
  }
}

export default App;
