class LocationSuggestions
 def initialize(app) 
 	@app=app
 end	
 def call(env)
 	if env["PATH_INFO"] == "/locationsuggestion"
 		request = Rack::Request.new(env)
 		terms = Location.suggestions(request.params[:term])
 		[200,{"Content-Type"=>"application/json"},[terms.to_json]]
 	else
 		@app.call(env)
 	end	

 end	
end