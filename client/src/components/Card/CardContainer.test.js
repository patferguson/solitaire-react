import React from 'react';
import ReactDOM from 'react-dom';

import CardContainer from './CardContainer';

it('renders without crashing', () => {
  const div = document.createElement('div');
  ReactDOM.render(<CardContainer suit='heart' faceValue={0} />, div);
});
