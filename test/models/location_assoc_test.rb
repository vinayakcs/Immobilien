# == Schema Information
#
# Table name: location_assocs
#
#  id          :integer          not null, primary key
#  location_id :integer
#  agent_id    :integer
#  client_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class LocationAssocTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
