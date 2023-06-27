# == Schema Information
#
# Table name: reviews
#
#  id           :integer          not null, primary key
#  from_user_id :integer
#  to_user_id   :integer
#  content      :text
#  overall      :integer
#  isreviewed   :boolean
#  location_id  :integer
#  purpose      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Review < ActiveRecord::Base
  include GlobalConstants
  include Utility
  belongs_to :from_user, class_name: 'Client', inverse_of: :sent_reviews
  belongs_to :to_user, class_name: 'Agent', inverse_of: :received_reviews
  belongs_to :location
  validates :from_user, presence: true
  validates :to_user, presence: true 
  validates :content, presence: true
  validates :purpose, presence: true
  validates :location, presence: true
  validates :overall, presence: true, :numericality => {:greater_than => 0, :less_than => 6}
  scope :recent, -> {
    order('created_at desc')
  }  
  def self.createreview(client,agent,content,purpose,location,score)
    review=Review.new
    review.from_user=client
    review.to_user=agent
    review.content=content
    review.purpose=purpose
    review.location=Location.where(:fullname=>location).first
    review.overall=score
    review.save
    return review
  end  

  def self.get_reviews(id,type)
    if type==GlobalConstants::USER_AGENT
      where('isreviewed=true and to_user_id=?',id).includes(:from_user).includes(:location).select('reviews.id,reviews.from_user_id,reviews.content,reviews.purpose,reviews.overall,reviews.created_at,clients.id,clients.first_name,clients.last_name,locations.fullname').recent.references(:from_user)
    elsif type==GlobalConstants::USER_CLIENT
      where('isreviewed=true and from_user_id=?',id).includes(:to_user).includes(:location).select('reviews.id,reviews.to_user_id,reviews.content,reviews.overall,reviews.purpose,reviews.created_at,agents.id,agents.first_name,agents.last_name,locations.fullname').recent.references(:to_user)  
    end  
  end 

  rails_admin do
    edit do
      field :from_user_id
      field :to_user_id
      field :content, :ck_editor
      field :overall
      field :isreviewed
      field :created_at
      field :updated_at
    end
  end
end
