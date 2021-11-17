# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  email           :string           not null
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord

    attr_reader :password # validate password length without storing in the database 

    validates :username, presence: true, uniqueness:true
    validates :password_digest, :session_token, presence: true
    validates :password, length: {minimum: 6}, allow_nil: true

    after_initialize :ensure_session_token

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user
        if user.is_password?(password)
            return user
        else
            return nil
        end
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
    # Use BCrypt's built-in method for checking if the password provided is the user's password
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def ensure_session_token
    # Generate the initial session_token so that we pass the validation
    # This method runs right after the model is initialized, before any validations are run
    self.session_token ||= SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    # When a user logs out, we want to scramble their session_token so that bad people cannot use the old one
    self.session_token = SecureRandom.urlsafe_base64
    self.save
    self.session_token
  end

end
