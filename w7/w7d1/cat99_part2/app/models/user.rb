# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  username      :string           not null
#  pw_digest     :string           not null
#  session_token :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class User < ApplicationRecord
    before_validation :ensure_session_token

    validates :pw_digest, :session_token, presence: true
    validates :username, presence: true, uniqueness: true

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def password=(password) 
        self.pw_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_valid_password?(password)
        password_object = BCrypt::Password.new(self.pw_digest)
        password_object.is_password?(password)
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64 #if we don't have one, lets set it to a new urlsafe_base64
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        if user && user.is_valid_password?(password)
          return user 
        else
          nil
        end
    end

    has_many :cats,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Cat 

end
