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

class LocationAssoc < ActiveRecord::Base
 belongs_to :location
 belongs_to :agent
 belongs_to :client
end
