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

require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
