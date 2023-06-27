# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  sender_id     :integer
#  sender_type   :string
#  receiver_id   :integer
#  receiver_type :string
#  read_at       :datetime
#  content       :text
#  status        :string
#  is_deal       :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
