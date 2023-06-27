# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  sender_id     :integer
#  sender_type   :string
#  receiver_id   :integer
#  receiver_type :string
#  read_at       :datetime
#  content       :text
#  status        :string
#  is_deal       :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Message < ActiveRecord::Base
 include Utility	
 belongs_to :sender, :polymorphic => true
 belongs_to :receiver, :polymorphic => true
 validates :sender, presence: true
 validates :receiver, presence: true

  scope :recent, -> {
    order('created_at desc')
  }

 def self.get_conversation(userid,type)
  where("(sender_id=? and sender_type=?) or (receiver_id=? and receiver_type=?)",userid,type,userid,type).includes(:sender).includes(:receiver).select('distinct on (messages.sender_id,messages.receiver_id) *').order('messages.sender_id,messages.receiver_id,messages.created_at desc')  
  #where("(sender_id=? and sender_type=?) or (receiver_id=? and receiver_type=?)",userid,type,userid,type).includes(:sender).includes(:receiver).recent
 end

 def self.get_message_and_mark_read(senderid,sendertype,receiverid,receivertype,isread)
 	if !isread
    mark_as_read(senderid,sendertype,receiverid,receivertype)
  end
  where("(sender_id=? and sender_type=? and receiver_id=? and receiver_type=?) or (sender_id=? and sender_type=? and receiver_id=? and receiver_type=?)",senderid,sendertype,receiverid,receivertype,receiverid,receivertype,senderid,sendertype).includes(:sender).includes(:receiver).recent
 end
 
 def self.create_message_for_user(send_user,receive_user,msg)
  msg_instance=Message.new
  msg_instance.sender=send_user
  msg_instance.receiver=receive_user
  msg_instance.content=msg
  msg_instance.save
  return msg_instance 
 end

 private
 
 def self.mark_as_read(senderid,sendertype,receiverid,receivertype)
  where('(sender_id=? and sender_type=? and receiver_id=? and receiver_type=?) or (sender_id=? and sender_type=? and receiver_id=? and receiver_type=?) and read_at is null',senderid,sendertype,receiverid,receivertype,receiverid,receivertype,senderid,sendertype).update_all(read_at: Time.zone.now)
 end	

end
