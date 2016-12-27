module Api
  class ApiController < ApplicationController
    def version
      version_data = {
        version: APP_VERSION,
        version_description: APP_VERSION_DESCRIPTION,
      }
      render status: 200, json: version_data
    end

    def ping
      filtered_params = ping_params
      if (filtered_params[:ping_message] == "Ping!")
        render status: 200, json: { ping_response: "Pong!" }
      else
        render status: 422, json: { ping_response: "Unknown Ping message!" }
      end
    end

    private
      def ping_params
        params.permit(:format, :ping_message)
      end
  end
end
