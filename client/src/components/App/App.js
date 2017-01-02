import React, { Component } from 'react';

import '../../css/global.scss';

class App extends Component {
  render() {
    return (
      <div className="App">
        {this.props.children}
      </div>
    );
  }
}

App.propTypes = {
  /**
   * Collection of children components to render.
   * @type {React.PropTypes.arrayOf(React.PropTypes.element)}
   */
  asyncFunc: React.PropTypes.arrayOf(React.PropTypes.element),
};

export default App;
