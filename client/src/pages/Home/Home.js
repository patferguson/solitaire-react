import React, { Component } from 'react';
import { LinkContainer } from 'react-router-bootstrap'
import { Button } from 'react-bootstrap'

import './Home.scss';

import logo from './logo.svg';

import Ping from '../components/Ping';
import APIVersion from '../components/APIVersion';
import ReactComponentsTest from '../components/ReactComponentsTest';

class Home extends Component {
  render() {
    return (
      <div className="Home">
        <div className="Home-header">
          <img src={logo} className="Home-logo" alt="logo" />
          <h2>Welcome to React</h2>
        </div>
        <p className="Home-intro">
          To get started, edit <code>src/Home.js</code> and save to reload.
        </p>

        <div>
          <p>Bootstrap Glyphicons:</p>
          <p>Envelope icon: <span className="glyphicon glyphicon-envelope"></span></p>
          <p>Search icon: <span className="glyphicon glyphicon-search"></span></p>
          <p>Print icon: <span className="glyphicon glyphicon-print"></span></p>
        </div>

        <LinkContainer to={{ pathname: '/about' }}>
          <Button>About</Button>
        </LinkContainer>

        <ReactComponentsTest />
        <Ping />
        <APIVersion />
      </div>
    );
  }
}

export default Home;
