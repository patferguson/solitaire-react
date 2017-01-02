import React from 'react';
import ReactDOM from 'react-dom';

import APIVersion from './APIVersion';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<APIVersion />, div);
});
