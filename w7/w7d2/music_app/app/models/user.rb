class User < ApplicationRecord
    attr_reader :password
    before_validation :ensure_session_token 
    #validates :password, length {minimum:6}, allow_nil: true

    def self.generate_session_token
        SecureRanom::urlsafe_base64
    end

    def self.find_by_credentials(email, password)
        user = User.find_by(:email, email)
        if user && user.is_valid(password)
            return user
        else
            nil
        end
    end

    def password=(password)
        @password = password #allows to check the model validation
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_valid_password?(password)
        pw_obj = BCrypt::Password.new(self.password_digest)
        pw_obj.is_password?(password)
    end

    def reset_session_token!
        self.session_token = generate_session_token
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= generate_session_token
    end

end
