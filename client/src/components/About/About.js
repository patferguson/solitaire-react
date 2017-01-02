import React, { Component } from 'react'
import { IndexLinkContainer } from 'react-router-bootstrap'
import { Button } from 'react-bootstrap'

import APIVersion from '../App'

class About extends Component {
  render() {
    return (
      <div>
        <p>Learning React + Rails development through creating a simple Solitaire browser game.</p>
        <IndexLinkContainer to={{ pathname: '/' }}>
          <Button>Home</Button>
        </IndexLinkContainer>
        <APIVersion />
      </div>
    );
  }
}

export default About;
