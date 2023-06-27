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

class PropertyAssoc < ActiveRecord::Base
 belongs_to :property
 belongs_to :agent
 belongs_to :client
end
