import React, { Component } from 'react';
import { Router, Route, IndexRoute, browserHistory } from 'react-router'

import App from '../App'
import NotFound from '../NotFound'
import Home from '../Home'
import About from '../About'

class Routes extends Component {
  render() {
    return (
      <Router history={browserHistory}>
        <Route path="/" component={App}>
          <IndexRoute component={Home}/>
          <Route path="about" component={About}/>
          <Route path="*" component={NotFound}/>
        </Route>
      </Router>
    );
  }
}

export default Routes;
