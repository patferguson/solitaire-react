import React, { Component } from 'react';
import _ from 'lodash';

import Card from './Card';

class CardContainer extends Component {
  constructor(props) {
    super(props)
  }

  render() {
    // Filter known props from props collection before passing to child
    // See: https://github.com/react-bootstrap/react-bootstrap/issues/1994
    const { ...extraProps } = this.props

    return (
      <Card {...extraProps}></Card>
    );
  }
}

export default CardContainer;
