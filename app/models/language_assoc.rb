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

class LanguageAssoc < ActiveRecord::Base
 belongs_to :language
 belongs_to :agent
 belongs_to :client
end
