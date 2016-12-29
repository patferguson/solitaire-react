import APIHelpers from './helpers/APIHelpers';

function version(a_callback) {
  const request = APIHelpers.buildJSONRequest('/api/version.json', { })
  return APIHelpers.sendJSONRequest(request, a_callback)
}

function ping(a_callback) {
  const request = APIHelpers.buildJSONRequest('/api/ping.json', {
    method: 'POST',
    body: JSON.stringify({
      ping_message: 'Ping!'
    })
  })
  return APIHelpers.sendJSONRequest(request, a_callback)
}

// Include all available API actions
const APIClient = {
  version,
  ping
}
export default APIClient
