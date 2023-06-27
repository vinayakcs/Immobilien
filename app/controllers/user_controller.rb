class UserController < ApplicationController
	include SessionsHelper
	before_filter -> {redirect_for_guest_user nil}

	def profile
		@user=current_user
		@reviews=Review.get_reviews(current_user.id,current_user_type)
		@reviews=@reviews.get_pagination_data(1)
		@usertype=current_user_type
	end	
	
end
