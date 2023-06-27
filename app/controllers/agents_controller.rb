class AgentsController < ApplicationController
 include Urltokenable
 include SessionsHelper
 before_filter -> {redirect_for_guest_user "Agent"}, :except => [:show,:index] 
 def index

  if !check_auth_user? and params[:page].blank? and params[:name].blank? and params[:location].blank? and params[:property].blank? and params[:language].blank?
    redirect_to :controller => 'system', :action => 'index' 
    return 
  end  
  @isLastResults=false
  @agents=Agent.get_visible_user_for_listing.order_by_review_score
  page_val=1
  page_val=params[:page] if !params[:page].blank?
  if !@agents.nil?
    @agents=@agents.get_pagination_data(page_val)
  end  
  if  !params[:name].blank?
    @agents=@agents.db_search(params[:name], "AND",%w[first_name last_name] )
  end
  if !params[:location].blank?
    @agents=@agents.get_agents_by_location(params[:location])
  end  

  if !params[:property].blank? and !params[:property][:name].blank?
    @agents=@agents.get_agents_by_property(params[:property][:name])
  end
  if !params[:language].blank? and !params[:language][:name].blank?
    @agents=@agents.get_agents_by_language(params[:language][:name])
  end  
  if @agents.nil? || @agents.empty? || @agents.length<GlobalConstants::AGENT_PER_PAGE
   @isLastResults=true
  end
  @agents=@agents.get_coagulation_results_for_preview
  respond_to do |format|
      format.html {@agents}
      format.rss
      format.js { render :file => "agents/load_more.js.erb"}
  end  
 end
 def message
  @user=current_user
 end 
 def edit
  @user=current_user
 end

 def show
  @agent=search_by_url_token(Agent.name.classify.constantize,params)
  @reviews=nil
  if @agent.nil?
  	redirect_to root_path,:notice => t('common.does_not_exist')
    return
  end

  @reviews=Review.get_reviews(@agent.id,'Agent')
  @reviews=@reviews.get_pagination_data(1)
 end

 def update
  @user=current_user
  agent_info=params[:agent]
  if @user.nil?
    redirect_to root_path,:notice => t('common.does_not_exist')
    return
  end 
  @user.first_name=agent_info[:first_name]
  @user.last_name=agent_info[:last_name]
  @user.phone=agent_info[:phone]
  @user.fb_link=agent_info[:fb_link]
  @user.googleplus_link=agent_info[:googleplus_link]
  @user.twitter_link=agent_info[:twitter_link]
  @user.description=agent_info[:description]
  @user.address=agent_info[:address]
  @user.profile_image=agent_info[:profile_image]
  @user.properties=Property.find(agent_info[:property_ids]||[])
  @user.languages=Language.find(agent_info[:language_ids]||[])
  @user.locations=Location.where(:fullname=>params[:tokenfield].gsub(/,\s+/, ",")
.split(',')||[])
  @user.is_team=agent_info[:is_team].to_i==1
  if @user.save
    flash[:success] = t('common.updatedsuccess')
  else
    flash[:danger]=@user.errors.full_messages
  end  
  respond_to do |format|
    format.html { redirect_to edit_agent_path(@user) }
  end    
 end 

end
