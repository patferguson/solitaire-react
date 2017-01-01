import React, { Component } from 'react';
import _ from 'lodash';

import { Button } from 'react-bootstrap';

class AsyncButton extends Component {
  constructor(props) {
    super(props)

    // Explicitely set initial state
    this.state = {
      isLoading: false,
    };
  }

  /**
   * Called whenever the user clicks on the button.
   * @param asyncFunc {React.propTypes.func} Function to call to trigger the async action.
   */
  handleClick(asyncFunc) {
    this.setState({isLoading: true});

    // Trigger the async function that this button represents
    if (asyncFunc) {
      asyncFunc(() => {
        // The async action has been completed, restore the button's text
        this.setState({isLoading: false});
      });
    } else {
      // No function specified, immediately revert the button
      this.setState({isLoading: false});
    }
  }

  render() {
    // Filter known props from props collection before passing to child
    // See: https://github.com/react-bootstrap/react-bootstrap/issues/1994
    const { asyncFunc, btnAsyncText, btnText, ...extraProps } = this.props

    return (
      <div className="AsyncButton">
        <Button
          disabled={this.state.isLoading}
          onClick={!this.state.isLoading ? this.handleClick.bind(this, asyncFunc) : null}
          {...extraProps}>
          { this.state.isLoading ? btnAsyncText : btnText }
        </Button>
      </div>
    );
  }
}

// Run-time React prop type checking
// See: https://facebook.github.io/react/docs/typechecking-with-proptypes.html
AsyncButton.propTypes = {
  /**
   * Function to call when the user clicks the button, this should accept a callback function from AsyncButton to revert its state
   * @type {React.PropTypes.func}
   */
  asyncFunc: React.PropTypes.func,
  /**
   * Text to display on the button before the user interacts with it.
   * @type {React.PropTypes.string}
   */
  btnText: React.PropTypes.string,
  /**
   * Text to display while the async function is running.
   * @type {React.PropTypes.string}
   */
  btnAsyncText: React.PropTypes.string,
};

// Default values for the props
AsyncButton.defaultProps = {
  btnText: 'Submit',
  btnAsyncText: 'Submitting..',
};

export default AsyncButton;
