module GlobalConstants
 extend ActiveSupport::Concern

 SITE_NAME="Immobilien"

#while form submission sanity check
 VALID_MOBILE_REGEX = /^[789]\d{9}$/
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#sample set of sexes which a user can have, other takes care of all medical experimentation
 USER_SEX_MALE="male"
 USER_SEX_FEMALE="female"
 USER_SEX_OTHER="other"
 USER_SEX= [USER_SEX_MALE,USER_SEX_FEMALE,USER_SEX_OTHER]



 USER_AGENT="Agent"
 USER_CLIENT="Client"
 USER_TYPE=[USER_AGENT,USER_CLIENT]

#contact_us.html.erb in layouts have the below mentioned value. one to one mapping is expected.
 FEEDBACK_TYPE=["Complaint","Appreciation"]
 NOT_AVAILABLE="Not Available"

 ADDED_AS_FAVOURITE="Added to your favourites"
 REMOVED_FROM_FAVOURITE="Removed from favouries"
 FAVOURITES_ERROR="Error contact Admins"

 AUTHPROVIDER_FACEBOOK="facebook"
 AUTHPROVIDER_GOOGLEPLUS="google_oauth2"
 AUTH_PROVIDERS=[AUTHPROVIDER_FACEBOOK,AUTHPROVIDER_GOOGLEPLUS]

 AGENT_PER_PAGE=3
 CLIENT_PER_PAGE=3
 MESSAGE_PER_PAGE=2
 CONVERSATION_PER_PAGE=2
 REVIEW_PER_PAGE=3

 MESSAGE_CONVERSATION="conversation"
 MESSAGE_MESSAGE="message"
 MESSAGE_MESSAGE_AND_CONVERSATION="messageandconversation"


end
