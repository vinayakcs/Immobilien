# == Schema Information
#
# Table name: agents
#
#  id                         :integer          not null, primary key
#  url_token                  :string
#  remember_token             :string
#  title                      :string           default("immobilien manager")
#  first_name                 :string
#  last_name                  :string
#  isblocked                  :boolean          default(FALSE)
#  email                      :string
#  phone                      :string
#  address                    :text
#  gender                     :string
#  description                :text
#  fb_link                    :string
#  twitter_link               :string
#  googleplus_link            :string
#  profile_image_file_name    :string
#  profile_image_content_type :string
#  profile_image_file_size    :integer
#  profile_image_updated_at   :datetime
#  is_team                    :boolean          default(FALSE)
#  review_score               :integer          default(0)
#  total_deals                :integer          default(0)
#  price_min                  :decimal(, )      default(0.0)
#  price_max                  :decimal(, )      default(0.0)
#  price_avg                  :decimal(, )      default(0.0)
#  reviews_count              :integer          default(0)
#  unread_message_count       :integer          default(0)
#  impressions_count          :integer          default(0)
#  deals_accepted             :integer          default(0)
#  deals_rejected             :integer          default(0)
#  deals_pending              :integer          default(0)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class Agent < ActiveRecord::Base
  include User
  include Utility
  has_many :locations, :dependent => :destroy
  has_many :languages, :dependent => :destroy
  has_many :properties, :dependent => :destroy

  is_impressionable :counter_cache => true, :column_name => :impressions_count 
  has_many :received_reviews,  class_name: 'Review', foreign_key: 'to_user_id', inverse_of: :to_user
  has_many :favourites
  has_many :favourited_by, through: :favourites, source: :client


  def self.get_coagulation_results_for_preview
   includes(:locations).includes(:properties).includes(:languages)
  end
#get url by injecting url_token and title, provided we already know this, can be used when  object is already known
  def self.get_agent_url_by_params(url_token,title)
    [url_token,title.parameterize.truncate(200,separator:'')].join("-")    
  end
  def self.order_by_review_score
    order('review_score desc')
  end

 
  def self.get_agents_by_location(locationfullname)
    joins(:locations).where("locations.fullname=?",locationfullname)
  end
  def self.get_agents_by_property(propertyId)
    joins(:properties).where("properties.id=?",propertyId)
  end
  def self.get_agents_by_language(languageId)
     joins(:languages).where("languages.id=?",languageId) 
  end  
  def self.search_agent_by_keywords(query, join = "AND")
    db_search(query, join, %w[title first_name last_name])
  end  
#seo-friendly urls, title is used as url  
  def to_param
   Agent.get_agent_url_by_params(url_token,title)
  end

  # def get_reviews
  #   received_reviews.includes(:from_user).includes(:location).select('reviews.id,reviews.from_user_id,reviews.content,reviews.purpose,reviews.overall,reviews.created_at,clients.id,clients.first_name,clients.last_name,locations.fullname').where('reviews.isreviewed=true').recent.references(:from_user)  
  # end  


  rails_admin do
    edit do
      field :isblocked
    end
  end

end
