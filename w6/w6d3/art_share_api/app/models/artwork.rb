# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord

  validates :title, presence: true, uniqueness: { scope: :artist_id }
  validates :artist_id, presence: true

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :shared_viewers,
    through: :shared_artworks,
    source: :viewer

  has_many :shared_artworks,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare

end
