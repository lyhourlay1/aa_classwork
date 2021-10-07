class Artwork < ApplicationRecord

  validates :title, presence: true, uniqueness: { scope: :artist_id }

end
