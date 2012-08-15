class Message < ActiveRecord::Base
  #set_table_name "private_messages"	
  
  #default_scope :order => 'created_at DESC'
  
  belongs_to :user	
  belongs_to :sender, :class_name => 'User', :foreign_key  => :user_id
  belongs_to :recipient, :class_name => 'User', :foreign_key  => :recipient_id
  has_many :replies
  attr_accessible :user_id, :recipient_id
  
  after_create :add_recipient, :add_sender

  def add_recipient
    self.recipient_id = received_messageable_id
    self.save
  end

  def add_sender
    self.user_id = sent_messageable_id
    self.save
  end

  def recipient_name
    user.try(:name)  
  end

  def recipient_name=(name)
    self.user = User.find_by_formatted_name(name) if name.present?        
  end


  def hide_for_user(user)
    if self.from == user
      self.s_hidden = true
      self.save!
    else
      self.r_hidden = true
      self.save!
    end
  end

  # HACK: recv and sent returning type Message::ActAsMessageble
  def Message.count_replies(message)
    message = Message.find(message.id)
    message.replies.count
  end

  def unhide!
    self.s_hidden = false
    self.r_hidden = false
    self.save!
  end

  def replies_count
    replies.count
  end
end
