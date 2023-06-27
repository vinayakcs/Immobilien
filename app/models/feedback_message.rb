# == Schema Information
#
# Table name: feedback_messages
#
#  id            :integer          not null, primary key
#  name          :string
#  email         :string
#  content       :string
#  feedback_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class FeedbackMessage < ActiveRecord::Base
  include GlobalConstants
  validates :name, presence: true, length: { maximum: 120 }
  validates :email, presence: true, length: { maximum: 120 }
  validates :content, presence: true, length: { maximum: 1200 } 
  validates :feedback_type, presence: true, inclusion: {in: GlobalConstants::FEEDBACK_TYPE}
end
