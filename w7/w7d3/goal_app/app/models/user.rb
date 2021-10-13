class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true

  # has_many :goals,
  #   primary_key: :id,
  #   foregin_key: :goal_id,
  #   class_name: :Goal
end
