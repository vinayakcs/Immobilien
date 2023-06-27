module Utility
 extend ActiveSupport::Concern
 include GlobalConstants

  included do
    def self.get_pagination_data(page_val)
     limit=0
     offset=0
     if self.name.classify.constantize.to_s=="Agent"
      limit=GlobalConstants::AGENT_PER_PAGE
      offset=(page_val.to_i-1)*GlobalConstants::AGENT_PER_PAGE
     elsif self.name.classify.constantize.to_s=="Message"
      limit=GlobalConstants::MESSAGE_PER_PAGE
      offset=(page_val.to_i-1)*GlobalConstants::MESSAGE_PER_PAGE
     elsif self.name.classify.constantize.to_s=="Review"
      limit=GlobalConstants::REVIEW_PER_PAGE
      offset=(page_val.to_i-1)*GlobalConstants::REVIEW_PER_PAGE          	
     end
     limit(limit).offset(offset)
    end
  end


end
