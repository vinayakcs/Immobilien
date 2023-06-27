class MessagesController < ApplicationController
  include SessionsHelper
  include Controllerutility
  before_filter -> {redirect_for_guest_user nil}
  def create
  	user=current_user
  	receiverid=params[:counterpartid]
    receivertype=params[:counterparttype]
  	msg=params[:message][:content]
    @source=params[:source]
    receiver=nil
    @status=false
    @msginstance=nil

    if !receiverid.nil? and !receivertype.nil?
  	  receiver=get_user_fromfield('url_token',receiverid,receivertype)
    end
    if !receiver.nil?
      @msginstance=Message.create_message_for_user(user,receiver,msg)
  	end
    if !@msginstance.nil? and !@msginstance.new_record?
      @status=true
    end  
    respond_to do |format|
        format.html{} 
        format.js {render :file => "messages/message_create_confirmation.js.erb"}
    end     	
  end

  def show
    @user=current_user
    @messagetype=params[:type]
    @pageval=1
    @pageval=params[:page] if !params[:page].blank? 
    if @pageval.is_a? String 
      @pageval=Integer(@pageval)
    end   
    @counterpartid=params[:counterpartid]
    @counterparttype=params[:counterparttype]
    @loadmore=params[:loadmore]
    if !@loadmore.nil?
      @loadmore = @loadmore=="true" ? true : false
    end  
    @conversations=nil
    @messages=nil
    isread=params[:isread]
    if !isread.nil?
      isread = isread=="true" ? true : false
    end
    counterpartid_id=nil
    @isLastResults=false
    user=get_user_fromfield('url_token',@counterpartid,@counterparttype)
    counterpartid_id = user.id if !user.nil?
    if @messagetype==GlobalConstants::MESSAGE_CONVERSATION
      @conversations,@isLastResults=getConversation(@pageval)
    elsif @messagetype==GlobalConstants::MESSAGE_MESSAGE
      @messages,@isLastResults=getMessage(@pageval,counterpartid_id,@counterparttype,isread)
    else @messagetype==GlobalConstants::MESSAGE_MESSAGE_AND_CONVERSATION
      @conversations,@conversationisLastResults=getConversation(@pageval)
      counterpartid_id,@counterparttype,isread=getFirstConversation(@conversations)
      user=get_user_fromfield('id',counterpartid_id,@counterparttype)
      @counterpartid=user.url_token if !user.nil?
      @messages,@messagesisLastResults=getMessage(@pageval,counterpartid_id,@counterparttype,isread)   
    end 
    respond_to do |format|
        format.html{} 
        format.js {render :file => "messages/message_render.js.erb"}
    end     
  end  

  def updateReadTime
    msgid=params[:msgid]
    receiverid=current_user.id
    receivertype=current_user_type
    Message.mark_as_read(msgid,receiverid,receivertype)
  end  

  private
  
  def getFirstConversation(conversations)
    counterpartid=nil
    counterparttype=nil
    if !conversations.nil? and !conversations.empty?
      conversation=conversations[0]
      isread=(!conversation.read_at.nil?)
      if current_user.id==conversation.sender_id and current_user_type==conversation.sender_type
        counterpartid=conversation.receiver_id
        counterparttype=conversation.receiver_type
      elsif current_user.id==conversation.receiver_id and current_user_type==conversation.receiver_type
        counterpartid=conversation.sender_id
        counterparttype=conversation.sender_type
      end  
    end  
    return counterpartid,counterparttype,isread
  end  

  def getConversation(pageval)
    user=current_user
    isLastResults=false
    conversations=Message.get_conversation(user.id,current_user_type)
    page_val=1
    page_val=pageval if !pageval.blank?
    if !conversations.nil?
      conversations=conversations.get_pagination_data(page_val)
    end  
    if conversations.nil? || conversations.empty? || conversations.length<GlobalConstants::CONVERSATION_PER_PAGE
     isLastResults=true
    end

    return conversations,isLastResults        
  end 

  def getMessage(pageval,counterpartid,counterparttype,isread)
    isLastResults=false
    messages=Message.get_message_and_mark_read(current_user.id,current_user_type,counterpartid,counterparttype,isread)
    page_val=1
    page_val=pageval if !pageval.blank?
    if !messages.nil?
      messages=messages.get_pagination_data(page_val)
    end  
    if messages.nil? || messages.empty? || messages.length<GlobalConstants::MESSAGE_PER_PAGE
     isLastResults=true
    end
    return messages,isLastResults
  end


  

 
end

