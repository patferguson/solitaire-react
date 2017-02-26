import React, { Component } from 'react'
import { LinkContainer } from 'react-router-bootstrap'
import { Button } from 'react-bootstrap'

import Card from '../../components/Card'

class Home extends Component {
  render() {
    return (
      <div className="Home">
        <LinkContainer to={{ pathname: '/about' }}>
          <Button>About</Button>
        </LinkContainer>
        <LinkContainer to={{ pathname: '/testing' }}>
          <Button>Testing</Button>
        </LinkContainer>

        <Card suit='spade' faceValue={0} />
      </div>
    );
  }
}

export default Home;
