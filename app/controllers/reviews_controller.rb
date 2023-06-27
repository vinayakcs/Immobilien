class ReviewsController < ApplicationController
	include SessionsHelper
	include Controllerutility
    before_filter -> {redirect_for_guest_user "Client"}, :except => [:index] 	
	def create
		fromuser=current_user
		@status=false
		purpose=params[:review][:purpose]
		content=params[:review][:content]
		location=params[:tokenfield].gsub(/,\s+/, ",")
.split(',')||[]
		if !location.nil? and location.size>0
			location=location[0]
		end	
		score=params[:rating]
		touser=get_user_fromfield('url_token',params[:toreview],"Agent")

		review=Review.createreview(fromuser,touser,content,purpose,location,score)
		if !review.new_record?
			# TODO while updating isreviewed for review
			# touser.reviews_count+=1
			# touser.review_score+=Integer(score)
			# touser.save
			@status=true
		end	
		respond_to do |format|
    		format.js {render :file => "reviews/review_create_confirmation.js.erb"}
  		end		
	end
	def index
		@reviews=nil
		userid=params[:userid]
		usertype=params[:usertype]
		user=get_user_fromfield('url_token',userid,usertype)
		if !user.nil?
			@reviews=Review.get_reviews(user.id,user.class.name)
		end
		@isLastResults=false
		page_val=1
  		page_val=params[:page] if !params[:page].blank?		
		if !@reviews.nil?
			@reviews=@reviews.get_pagination_data(page_val)	
		end
	    if @reviews.nil? || @reviews.empty? || @reviews.length<GlobalConstants::REVIEW_PER_PAGE
	     @isLastResults=true
	    end		
		respond_to do |format|
    		format.js {render :file => "reviews/load_more.js.erb"}
  		end
	end	
end
