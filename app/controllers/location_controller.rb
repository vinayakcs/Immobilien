class LocationController < ApplicationController
 def search
  location= Location.suggestions(params[:term])
  puts location
  respond_to do |format|
      format.json { 
        render json: location
      }
    end
  end	
end
