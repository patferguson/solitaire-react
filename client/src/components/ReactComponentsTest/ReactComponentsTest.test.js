import React from 'react';
import ReactDOM from 'react-dom';

import ReactComponentsTest from './ReactComponentsTest';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<ReactComponentsTest />, div);
});
