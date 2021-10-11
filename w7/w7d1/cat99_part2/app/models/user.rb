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
    validates :pw_digest, :session_token, presence: true
    validates :username, presence: true, uniqueness: true

    def reset_session_token!
        
    end




end
