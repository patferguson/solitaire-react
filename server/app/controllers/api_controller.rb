class ApiController < ApplicationController
  def version
    version_data = {
      version: APP_VERSION,
      version_description: APP_VERSION_DESCRIPTION,
    }
    render status: 200, json: version_data
  end
end
