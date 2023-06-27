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

require 'test_helper'

class FeedbackMessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
