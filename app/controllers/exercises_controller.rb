class ExercisesController < ApplicationController
    before_action :authenticate_user!
    def search
    end
    
    def fetch_exercises
        url = "https://wger.de/api/v2/exerciseinfo/?limit=20&offset=0"  # Adjust as needed
        api_key = Rails.application.credentials.apiKey  # Make sure your API key is stored correctly in credentials.yml.enc
    
        # Make a GET request to the Wger API
        response = Faraday.get(url, nil, { 'Authorization' => "Bearer #{api_key}" })
    
        if response.status == 200
          # Return the fetched data as JSON
          render json: response.body
        else
          # If there was an error with the request, return an error response
          render json: { error: 'Failed to fetch exercises' }, status: response.status
        end
      end
end
