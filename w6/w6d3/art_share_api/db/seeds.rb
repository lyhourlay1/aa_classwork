# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artists = User.create([{ username: 'Chris' }, { username: 'Lee' }, { username: 'Domino' }])
artworks = Artwork.create([{title: 'art1', image_url: 'url1', artist_id: 1},
 {title: 'art2', image_url: 'url2', artist_id: 2}, {title: 'art3', image_url: 'url3', artist_id: 3}, 
{title: 'art1', image_url: 'url4', artist_id:2 }, {title: 'art1', image_url: 'url5', artist_id:3 }])
shared_artworks = ArtworkShare.create([{artwork_id: 1, viewer_id: 1}, {artwork_id: 2, viewer_id: 2},
{artwork_id: 3, viewer_id: 3}, {artwork_id: 4, viewer_id: 2}])


