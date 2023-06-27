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

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
