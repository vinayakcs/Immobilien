module SpamHelper

  def isSpamfeedback(session)
   if !session['anitspam_tsf'].nil?
    submission_duration = Time.now - session['anitspam_tsf']
    if submission_duration < Rails.application.config.antispam_feedback_duration
     return true 
    end
   end
     return false
  end


  def anti_spamfeedback
    session['anitspam_tsf']= Time.now
  end


end
