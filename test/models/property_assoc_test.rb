# == Schema Information
#
# Table name: property_assocs
#
#  id          :integer          not null, primary key
#  agent_id    :integer
#  client_id   :integer
#  property_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class PropertyAssocTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
