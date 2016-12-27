import React, { Component } from 'react';
import APIClient from './APIClient';
import _ from 'lodash';

class Ping extends Component {
  constructor(props) {
    super(props)

    // Explicitely set initial state
    this.state = {
      message: "",
      isSendingPing: false,
    };
  }

  componentDidMount() {
    this.setState(_.assign({}, this.state, {
      isSendingPing: true,
    }));

    // Post a basic ping message to the server and store the response
    APIClient.ping((data) => {
      this.setState({
        message: data["ping_response"],
        isSendingPing: false,
      });
    });
  }

  render() {
    const PingResponse = (
      <span>
        <p>
          {`Response: ${this.state.message}`}
        </p>
      </span>
    );

    return (
      <div className="Ping">
        {
          this.state.isSendingPing ?
            (<p>Submitting 'Ping!' message..</p>) : (PingResponse)
        }
      </div>
    );
  }
}

export default Ping;
