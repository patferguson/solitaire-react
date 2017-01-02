import React from 'react';
import ReactDOM from 'react-dom';

import Ping from './Ping';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<Ping />, div);
});
