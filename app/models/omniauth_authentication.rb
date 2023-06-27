# == Schema Information
#
# Table name: omniauth_authentications
#
#  id                :integer          not null, primary key
#  provider          :string
#  uid               :string
#  url               :string
#  first_name        :string
#  last_name         :string
#  email             :string
#  gender            :string
#  signup_token      :string
#  signupdate        :datetime
#  omniauthable_id   :integer
#  omniauthable_type :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class OmniauthAuthentication < ActiveRecord::Base
  include Tokenable
  include GlobalConstants
  belongs_to :omniauthable, :polymorphic => true
  validates :provider, presence: true , inclusion: {in: GlobalConstants::AUTH_PROVIDERS}, length: {maximum: 250}
  validates :url, length: {maximum: 250}
  validates :uid, presence: true, length: {maximum: 250},uniqueness: {scope: [:uid]}

  def self.find_with_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid'])
  end


end
