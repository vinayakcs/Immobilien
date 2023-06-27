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

require 'test_helper'

class AgentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
