class User < ApplicationRecord
    validates :username, :password_digest, :session_token, presence:true
    validates :username, uniqueness:true
    validates :password, length: {minimum: 6}, allow_nil: true

    attr_reader :password

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

    
end
