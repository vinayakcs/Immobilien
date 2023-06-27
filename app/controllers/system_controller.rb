class SystemController < ApplicationController
 include SpamHelper
 include SessionsHelper

  def index
 
  end

  def privacy_policy
  end

  def terms_of_service
  end

  def feedback
   if !params[:email].blank? or isSpamfeedback(session)
    render :json => {:message => "Caught by spam filter,try submission later", :success=>true }
   else
    @feedbackMessage=FeedbackMessage.new
    @feedbackMessage.name=params[:feedback_message][:name]
    @feedbackMessage.email=params[:feedback_message][:email]
    @feedbackMessage.content=params[:feedback_message][:content]
    @feedbackMessage.feedback_type=params[:feedback_message][:feedback_type]
    if @feedbackMessage.save
     anti_spamfeedback
     render :json => {:message => "Thanks for sharing your feedback.", :success=>true }
    else
     render :json => {:message => @feedbackMessage.errors.full_messages.first, :success=>true }
    end
   end
  end
end
