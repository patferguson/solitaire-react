/* eslint-disable no-undef */
function version(callback) {
  return fetch('/api/version', {
    accept: 'application/json',
  }).then(checkStatus)
    .then(parseJSON)
    .then(callback);
}

// TODO: Move the checkStatus and parseJSON methods into a helper class for API interaction

// TODO: Work out how to handle passing the XSRF token validation from the Rails API, see comments on: https://www.fullstackreact.com/articles/how-to-get-create-react-app-to-work-with-your-rails-api/

function checkStatus(response) {
  if (response.status >= 200 && response.status < 300) {
    return response;
  } else {
    const error = new Error(`HTTP Error ${response.statusText}`);
    error.status = response.statusText;
    error.response = response;
    console.log(error); // eslint-disable-line no-console
    throw error;
  }
}

function parseJSON(response) {
  return response.json();
}

const APIClient = {
  version
};
export default APIClient;
