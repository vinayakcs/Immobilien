# == Schema Information
#
# Table name: languages
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Language < ActiveRecord::Base
 has_many :languageAssoc, :dependent => :destroy
 # has_many :agents, :through => :languageAssoc
 # has_many :clients, :through => :languageAssoc
 belongs_to :agent
 belongs_to :client

 def self.get_all_language_name
 	select('distinct name ').map(&:name)
 end

end
