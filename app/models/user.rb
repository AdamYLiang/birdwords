class User < ApplicationRecord
  # validations are for database, if we call User.save/save!
  validates :name, :session_token, :birth_year, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6 }, allow_nil: true

  # rails method, after creating/initializing something it will call the following methods
  # anytime you call User.new
  after_initialize :ensure_session_token

  # validations call getter methods for each attribute
  # since password isn't a column, we need to create a getter method for it
  # lasts for one request cycle, and then it will be destroyed
  attr_reader :password

  #the only thing that has to change is the class name
  #primary key and foreign key stay the same
  has_many :chirps,
    class_name: :Chirp,
    primary_key: :id,
    foreign_key: :author_id

  belongs_to :location,
    class_name: :Location,
    primary_key: :id,
    foreign_key: :location_id

  has_many :likes,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :Like

  has_many :liked_chirps,
    through: :likes, 
    source: :chirp

  def self.find_by_credentials(name, password)
    user = User.find_by(name: name) # could be a user, could be nil
    return nil unless user && user.is_password?(password) # is_password? only executes if user is a User object, not nil
    user
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    # `create` takes a plaintext password, hashes and salts it and spits out a digest
  end

  def reset_session_token!
    # remember to not only generate a new session token, but also to save it to the database
    # this will not work if you don't save to the database
    self.update!(session_token: self.class.generate_session_token)
    # return the new token for convenience
    self.session_token
  end

  def is_password?(password)
    # password_digest is just a string
    # convert it into a BCrypt::Password object so that we can call #is_password? on it
    bcrypt_password = BCrypt::Password.new(self.password_digest) # just turns it into a Password object, doesn't hash it again
    bcrypt_password.is_password?(password) # this is_password? is a different method entirely, on the Bcrypt::Password object
  end

  private

  def ensure_session_token
    # this will run whenever we instantiate a User object
    # that could happen because we're creating a new record,
    # or because we pulled one out of the database
    # that's why we use conditional assignment
    self.session_token ||= self.class.generate_session_token
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64 # a random base64 number/string
  end
end

# Something to help remember all these methods 

# P - password=
# R - reset_session_token! 
# E - ensure_session_token
# F - find_by_credentials
# I - is_password?
# G - generate_session_token 

# Don't forget about the validations! Also try FGRIPE?