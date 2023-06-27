# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  fullname   :string
#  name       :string
#  lat        :decimal(, )
#  lng        :decimal(, )
#  zip        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ActiveRecord::Base
  has_many :locationAssocs, :dependent => :destroy
  # has_many :agents, :through => :locationAssocs
  # has_many :clients, :through => :locationAssocs
  has_one :review
  belongs_to :agent
  belongs_to :client  
  validates :fullname, presence: true	

  def self.suggestions(query)
  	where("fullname ilike :query ",query: "%#{query}%").select('fullname').limit(5).pluck('fullname')
  end	
end
