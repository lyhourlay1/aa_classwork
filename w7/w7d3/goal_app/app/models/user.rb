class User < ApplicationRecord
  attr_reader :password
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6}, allow_nil: true
  after_initialize :ensure_session_token

  
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def is_valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token

  end

  def self.find_by_credentials(username, password)
      user = User.find_by(username: username)
      if user && user.is_valid_password?(password)
        return user
      else
        nil
      end
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  # has_many :goals,
  #   primary_key: :id,
  #   foregin_key: :goal_id,
  #   class_name: :Goal
end
