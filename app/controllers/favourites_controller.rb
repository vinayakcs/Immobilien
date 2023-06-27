class FavouritesController < ApplicationController
	include GlobalConstants
	before_filter -> {redirect_for_guest_user "Client"}
	def favourite
		type=params[:type]
		agentid=params[:id]
		agent=Agent.find(agentid)
		if agent.nil?
			redirect_to :back, notice: GlobalConstants::FAVOURITES_ERROR	
			return	
			if type=="favourite"
				current_user.favourite_agents << agent
				redirect_to :back, notice: GlobalConstants::ADDED_AS_FAVOURITE
			elsif type=="unfavourite"
				current_user.favourite_agents.delete(agent)
				redirect_to :back, notice: GlobalConstants::REMOVED_FROM_FAVOURITE
			else
				redirect_to :back, notice: GlobalConstants::FAVOURITES_ERROR	
			end	
		end		
	end
	def show
		current_user.favourite_agents.includes(:agents)
	end		
end
