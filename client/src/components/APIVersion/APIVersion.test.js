import React from 'react'
import ReactDOM from 'react-dom'

import APIVersion from './APIVersion'

/**
 * Mocks the response to the API version web request.
 */
const mockAPIVersionResponse = () => {
  fetch.mockResponse(JSON.stringify({
    version: '0.1.0',
    version_description: 'Initial Rails API project setup'
  }), {
    "status": "200"
  })
}

it('renders without crashing', () => {
  mockAPIVersionResponse()
  const div = document.createElement('div')
  ReactDOM.render(<APIVersion />, div)
})
