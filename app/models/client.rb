# == Schema Information
#
# Table name: clients
#
#  id                         :integer          not null, primary key
#  url_token                  :string
#  remember_token             :string
#  address                    :string
#  first_name                 :string
#  last_name                  :string
#  gender                     :string
#  email                      :string
#  phone                      :string
#  isblocked                  :boolean          default(FALSE)
#  profile_image_file_name    :string
#  profile_image_content_type :string
#  profile_image_file_size    :integer
#  profile_image_updated_at   :datetime
#  location_name              :string
#  reviews_count              :integer
#  deals_accepted             :integer
#  deals_rejected             :integer
#  deals_pending              :integer
#  unread_message_count       :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class Client < ActiveRecord::Base
  include User
  has_many :sent_reviews, class_name: 'Review', foreign_key: 'from_user_id', inverse_of: :from_user
  has_many :favourites
  has_many :favourite_agents, through: :favourites, source: :agent

#non seo-friendly urls, only url_token
  def to_param
   url_token
  end 
  # def get_reviews
  #   sent_reviews.includes(:to_user).includes(:location).select('reviews.id,reviews.to_user_id,reviews.content,reviews.overall,reviews.purpose,reviews.created_at,agents.id,agents.first_name,agents.last_name,locations.fullname').where('reviews.isreviewed=true').recent.references(:to_user)  
  # end  
  def get_favourites
    favourite_agents.includes(:agent).recent
  end  
  rails_admin do
    edit do
      field :isblocked
    end
  end   

end
