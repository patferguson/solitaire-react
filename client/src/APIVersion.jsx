import React, { Component } from 'react';
import APIClient from './APIClient';
import _ from 'lodash';

class APIVersion extends Component {
  constructor(props) {
    super(props)

    // Explicitely set initial state
    this.state = {
      version: "",
      versionDescription: "",
      isFetchingVersion: false,
    };
  }

  componentDidMount() {
    this.setState(_.assign({}, this.state, {
      isFetchingVersion: true,
    }));

    // Retrieve the Rails API version information and store
    APIClient.version((data) => {
      this.setState({
        version: data["version"],
        versionDescription: data["version_description"],
        isFetchingVersion: false,
      });
    });
  }

  render() {
    const VersionInfo = (
      <span>
        <h1>
          {`API Version: ${this.state.version}`}
        </h1>
        <p>
          {`${this.state.versionDescription}`}
        </p>
      </span>
    );

    return (
      <div className="APIVersion">
        {
          this.state.isFetchingVersion ?
            (<p>Fetching version..</p>) : (VersionInfo)
        }
      </div>
    );
  }
}

export default APIVersion;
