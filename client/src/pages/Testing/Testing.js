import React, { Component } from 'react'
import { LinkContainer } from 'react-router-bootstrap'
import { Button } from 'react-bootstrap'

import './Testing.scss';

import logo from './logo.svg';

import Ping from '../../components/Ping';
import APIVersion from '../../components/APIVersion';
import ReactComponentsTest from '../../components/ReactComponentsTest';
import Card from '../../components/Card';

class Testing extends Component {
  render() {
    return (
      <div className="Testing">
        <div className="Testing-header">
          <img src={logo} className="Testing-logo" alt="logo" />
          <h2>Welcome to React</h2>
        </div>
        <p className="Testing-intro">
          To get started, edit <code>src/Testing.js</code> and save to reload.
        </p>

        <div>
          <p>Bootstrap Glyphicons:</p>
          <p>Envelope icon: <span className="glyphicon glyphicon-envelope" aria-hidden="true"></span></p>
          <p>Search icon: <span className="glyphicon glyphicon-search" aria-hidden="true"></span></p>
          <p>Print icon: <span className="glyphicon glyphicon-print" aria-hidden="true"></span></p>
        </div>

        <div>
          <p>Font Awesome Icons:</p>
          <p>Envelope icon: <span className="fa fa-envelope" aria-hidden="true"></span></p>
          <p>Search icon: <span className="fa fa-search" aria-hidden="true"></span></p>
          <p>Print icon: <span className="fa fa-print" aria-hidden="true"></span></p>
        </div>

        <LinkContainer to={{ pathname: '/' }}>
          <Button>Home</Button>
        </LinkContainer>
        <LinkContainer to={{ pathname: '/about' }}>
          <Button>About</Button>
        </LinkContainer>

        <ReactComponentsTest />
        <Ping />
        <APIVersion />
        <Card suit='spade' faceValue={0} />
      </div>
    );
  }
}

export default Testing;
