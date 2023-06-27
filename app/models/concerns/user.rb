module User
 extend ActiveSupport::Concern
 include Tokenable
 include GlobalConstants


 included do
  before_validation :set_url_token, on: :create
  has_attached_file :profile_image, default_url: ":style/default_user.png"
  validates_attachment_size :profile_image, :less_than => 400.kilobytes
  validates_attachment_content_type :profile_image, content_type: /\Aimage/
  validates_attachment_file_name :profile_image, matches: [/png\Z/, /jpe?g\Z/]
  has_many :languageAssocs, :dependent => :destroy
  has_many :languages,-> { uniq }, :through => :languageAssocs
  has_many :locationAssocs, :dependent => :destroy
  has_many :locations,-> { uniq }, :through => :locationAssocs 
  has_many :propertyAssocs, :dependent => :destroy
  has_many :properties,-> { uniq }, :through => :propertyAssocs  
  has_many :sent_messages, :class_name => "Message", :as => :sender
  has_many :received_messages, :class_name => "Message", :as => :receiver
  has_one :omniauth_authentication, as: :omniauthable
  validates :gender, allow_nil: true, inclusion: {in: GlobalConstants::USER_SEX}
  validates :email, length: {maximum: 250}
  validates :first_name, length: {maximum: 250}, presence: true
  validates :last_name, length: {maximum: 250}, presence: true
  validates :url_token, presence: true
  validates :omniauth_authentication, presence: true


  scope :recent, -> {
    order('created_at desc')
  }

#url token is used for hiding actual object id
  def set_url_token
   self.url_token=get_rand_token(self.class.name.classify.constantize,"url_token") 
  end
#this is for session authentication
  def get_remember_token
   get_rand_token(self.class.name.classify.constantize,"remember_token")
  end
  def get_user_type
    return self.class.name
  end  
  def self.get_visible_user_for_listing
    where('isblocked=false')
  end 
  def self.order_by_creation 
    order('created_at desc')
  end
  def self.db_search(query, join,searchParams )
    where(query.split(/\s+/).map do |word|
      '(' + searchParams.map { |col| "#{col} LIKE #{sanitize('%' + word.to_s + '%')}" }.join(' OR ') + ')'
    end.join(" #{join} "))
  end  


 end

end
