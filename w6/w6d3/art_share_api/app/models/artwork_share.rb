# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
    validates :artwork_id, presence: true, uniqueness: {scope: :viewer_id}
    validates :viewer_id, presence: true

    belongs_to :viewer,
      primary_key: :id,
      foreign_key: :viewer_id,
      class_name: :User

    belongs_to :artwork,
      primary_key: :id,
      foreign_key: :artwork_id,
      class_name: :Artwork

    



end
