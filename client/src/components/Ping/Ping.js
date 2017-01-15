import React, { Component } from 'react';
import APIClient from '../../api/APIClient';
import _ from 'lodash';

import AsyncButton from '../AsyncButton';

class Ping extends Component {
  constructor(props) {
    super(props)

    // Explicitely set initial state
    this.state = {
      message: "",
      isSendingPing: false,
    };
  }

  /**
   * Sends a 'Ping!' message to the server.
   * @param callback {React.propTypes.func} Function to call once the API request has returned.
   */
  sendPing(callback) {
    this.setState(_.assign({}, this.state, {
      isSendingPing: true,
    }));

    // Post a basic ping message to the server and store the response
    APIClient.ping((data) => {
      this.setState({
        message: data["ping_response"],
        isSendingPing: false,
      });

      callback();
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
        <AsyncButton
          bsStyle="primary"
          asyncFunc={this.sendPing.bind(this)}
          btnText="Ping"
          btnAsyncText="Pinging.."
          />
        {
          this.state.isSendingPing ?
            (<p>Submitting 'Ping!' message..</p>) : (PingResponse)
        }
      </div>
    );
  }
}

export default Ping;
