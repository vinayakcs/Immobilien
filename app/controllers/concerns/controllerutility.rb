module Controllerutility
 extend ActiveSupport::Concern


  def get_user_fromfield(field,id,type)
    res=nil
    if type==GlobalConstants::USER_AGENT and !id.nil? and !type.nil?
      res=Agent.where(field+'=?',id)
    elsif type==GlobalConstants::USER_CLIENT and !id.nil? and !type.nil?
      res=Client.where(field+'=?',id)
    end 
    if !res.nil? and res.size>0 
      res=res[0]
    end  
    return res
  end  


end
