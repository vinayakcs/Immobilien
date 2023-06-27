# == Schema Information
#
# Table name: favourites
#
#  id         :integer          not null, primary key
#  agent_id   :integer
#  client_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favourite < ActiveRecord::Base
 belongs_to :agent
 belongs_to :client
	
end
