# == Schema Information
#
# Table name: properties
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Property < ActiveRecord::Base
 has_many :propertyAssoc, :dependent => :destroy
 # has_many :agents, :through => :propertyAssoc
 # has_many :clients, :through => :propertyAssoc
 belongs_to :agent
 belongs_to :client


 def self.get_all_property_name
 	select('distinct name ').map(&:name)
 end	
end
