class User < ActiveRecord::Base
 # Remember to create a migration!
  has_many :created_events, :class_name => 'Event'
  has_many :attended_events, :class_name => 'Event'

  validates :email, :password_digest, :presence => true  
  validates :email, :uniqueness => true

  # validates :key => "value", password, :length => { :minimum => 5}
  # before_create :password_digest
  # # validate :valid_email

  include BCrypt

  # def valid_email
  #   unless email =~ /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  #     errors.add(:email, "Not a valid email")
  #   end
  # end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    return nil unless user
    db_password = Password.new(user.password)
    db_password == password ? user : nil  
  end

  def password
    @password
  end
  
  def encrypt_password
    self.password_digest = Password.create(self.password)
  end 
end