# == Schema Information
#
# Table name: language_assocs
#
#  id          :integer          not null, primary key
#  language_id :integer
#  agent_id    :integer
#  client_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class LanguageAssocTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
