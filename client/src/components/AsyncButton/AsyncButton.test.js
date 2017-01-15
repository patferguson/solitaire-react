import React from 'react';
import ReactDOM from 'react-dom';

import AsyncButton from './AsyncButton';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<AsyncButton />, div);
});
