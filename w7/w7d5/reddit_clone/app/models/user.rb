class User < ApplicationRecord
    validates :username, :password_digest, :session_token, presence:true
    validates :username, uniqueness:true
    validates :password, length: {minimum: 6}, allow_nil: true

    attr_reader :password

    after_initialize :ensure_session_token

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def self.find_by_credentials(password, username)
        @user = User.find_by(username: username)
        if @user && @user.is_valid_password?(password)
            @user
        else
            nil
        end
    end

    def is_valid_password?(password)
        pw_obj = BCrypt::Password.new(self.password_digest)
        pw_obj.is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom::base64(64)
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::base64(64)
    end
    
end
