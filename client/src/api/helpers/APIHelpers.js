import _ from 'lodash';

// TODO: Work out how to handle passing the XSRF token validation from the Rails API, see comments on: https://www.fullstackreact.com/articles/how-to-get-create-react-app-to-work-with-your-rails-api/

// TODO: Consider how validating users will work? Consider OAuth2, or API tokens: https://stackoverflow.com/questions/20667404/rails-4-api-with-strong-parameters

/**
 * Builds a request and applies standardised JSON request options.
 * @param  {USVString|Request} a_target Direct URL of the resource to send the request to or a Request object.
 * @param  {Object} a_options Request initialisation options, see: https://developer.mozilla.org/en-US/docs/Web/API/Request/Request
 * @return {Request} Prepared Request object to be sent using the Fetch API.
 */
function buildJSONRequest(a_target, a_options) {
  // Merge in standardised option defaults
  const standardisedOptions = _.assign({}, a_options, {
    credentials: 'same-origin',
    headers: {
      "Accept": "application/json",
      // Add the Content-Type specifier for any request that has a body, e.g. POST
      "Content-Type": "application/json",
    }
  })
  return new Request(a_target, standardisedOptions)
}

/**
 * Wrapper around sending and parsing JSON requests. This provides a standardised interface for future functionality such as request authentication and XSRF token handling.
 * @param  {Request}   a_request Request to send, this will be parsed on response.
 * @param  {Function} callback Function to trigger after the request successfully returns, the first parameter will be the parsed JSON repsonse.
 * @return {Promise}           Promise object based on the result of the request.
 */
function sendJSONRequest(a_request, a_callback) {
  // Send the a_request and parse the response
  return fetch(a_request)
    .then(checkStatus)
    .then(parseJSON)
    .then(a_callback)
}

function checkStatus(a_response) {
  if (a_response.status >= 200 && a_response.status < 300) {
    return a_response
  } else {
    const error = new Error(`HTTP Error ${a_response.statusText}`)
    error.status = a_response.statusText
    error.response = a_response
    console.log(error) // eslint-disable-line no-console
    throw error
  }
}

function parseJSON(a_response) {
  return a_response.json()
}

// Include all public API helper actions
const APIHelpers = {
  buildJSONRequest,
  sendJSONRequest
}
export default APIHelpers
