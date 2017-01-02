// Import polyfills script
require('./polyfills.js')

// Library for mocking fetch requests
// See: https://github.com/jefflau/jest-fetch-mock
global.fetch = require('jest-fetch-mock');
