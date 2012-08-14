class User < ActiveRecord::Base
  ROLES = %w[jobseeker employer]
  INDUSTRIES = %w[accounting computer_games computer_software design nanotechnology]
  belongs_to :wall
  	
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  
  has_many :confirms
  has_many :confirmed_events, :through => :confirms, :class_name => 'Event', :foreign_key => 'user_id'#, :date.gte => Date.today 
  has_many :pendings
  has_many :pending_events, :through => :pendings, :class_name => 'Event', :foreign_key => 'user_id'#, :date.gte => Date.today 
  
  has_many :statuses
  has_many :requests
  has_many :activities
  has_many :posts
  has_many :comments
  has_many :likes # delete this
  has_many :pages
  has_many :photos # not sure to add this feature
  has_many :memberships
  has_many :groups, :through => :memberships
  has_one  :profile
  has_many :jobs
  has_many :applications
  has_many :interviews
  has_many :watches
  has_many :watched_jobs, through: :watches, class_name: 'Job', foreign_key: 'user_id'
  has_many :blocks 
  has_many :blocked_jobs, through: :blocks, class_name: 'Job', foreign_key: 'user_id'
  has_many :avatars

  #has_many :messages
  #has_many :sent_messages, :class_name => 'Message', :foreign_key => 'user_id'
  #has_many :received_messages, :class_name => 'Message', :foreign_key => 'recipient_id'
  
  validates :username, :email, :first_name, :last_name, :presence => true
 # validates_uniqueness_of  :username, :on => :create
  validates :email, :email_format => true
  validates :password, :presence => true,
                       :length => {:within => 6..40}
  validates_format_of :username, :with => /\A[A-Za-z0-9_]+\z/
  validates_length_of :username, :maximum => 12, :minimum => 3
  #validates_confirmation_of :password, :on => :create
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable #, :validatable
         
   acts_as_messageable :table_name => "messages",
                       :required   => [:topic, :body],           
                       :class_name => "ActsAsMessageable::Message"           
  
  after_create :create_wall, :add_formatted_name                       
  #after_update :add_formatted_name
  # Setting up accessible (or protected) attributes for the model
  attr_accessible :username, :first_name, :last_name, :formatted_name, :role, :email, :password, :password_confirmation, :remember_me, :message_id, :mobile_number, :work_number, :company_name, :industry
  
  # Methods to manage the user roles
  def role_symbols
    [role.to_sym]
  end
  
  def role?(current_role)
    role == current_role.to_s	
  end
  
  def employer?
    role?('employer')
  end

  def employee?
    role?('jobseeker')
  end

  def admin?
    role?('admin')
  end

  # methods to nullify the user instead of delete it
  def recv
  	# super
    Message.where(:r_hidden=>false).order("created_at DESC")
  end

  def sent
    Message.where(:s_hidden=>false).order("created_at DESC")
  end
  
  def add_friend(user)
    self.friendships.create(:friend_id => user.id)  
  end
  
  def friends2
    (inverse_friends + friends).uniq
  end  
  
  def feed
    feed = activities

    feed = [] + activities
    friends.each do |friend|
      feed += friend.activities
    end
    # feed
    return feed.sort {|x,y| y.created_at <=> x.created_at}
  end

  def possessive_pronoun
  	'male' #if sex == nil
    #sex.downcase == 'male' ? 'his' : 'her'
  end
  
  def pronoun
  	'he'# if sex == nil
    #sex.downcase == 'male' ? 'he' : 'she' 
  end
  
  def create_wall
    self.wall = Wall.create
    self.save
  end

  def create_profile
    self.profile = Profile.create(first_name: first_name, last_name: last_name)
    self.save
  end

  def add_formatted_name    
    self.formatted_name = "#{first_name} #{last_name}"
    self.save      
  end

  def update_name(first, last)
    formatted = "#{first} #{last}"
    if first && last
      self.first_name = first
      self.last_name = last
      self.formatted_name = formatted
      self.save   
    end
  end
  
  def all_events
    self.confirmed_events + self.pending_events
  end

  def friend_events
    events = []
    friends.each do |friend|
      events += friend.confirmed_events
    end
    return events.sort {|x,y| y.time <=> x.time}    
  end
  
  def friend_groups
    groups = []
    friends.each do |friend|
      groups += friend.groups
    end
    groups - self.groups
  end
  
  def self.search(search)
  	q = "%#{search}%"
    if search
      where('username LIKE ? or formatted_name LIKE ?', q, q)
    else
      where('username LIKE ? or formatted_name LIKE ?', nil, nil)
    end
  end
end
