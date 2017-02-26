import React from 'react';
import ReactDOM from 'react-dom';

import Testing from './Testing';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<Testing />, div);
});
