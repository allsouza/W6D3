# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

User.create!(username: 'Andre')
User.create!(username: 'Brendon')
User.create!(username: 'Kane')
User.create!(username: 'Sarah')
User.create!(username: 'Shelly')

Artwork.create!(title: 'Fruit Painting', artist_id: 1, image_url: 'first_routes_and_controllers/app/assets/images/fruitpainting.jpg')
Artwork.create!(title: 'Deadpool Poster', artist_id: 4, image_url: 'first_routes_and_controllers/app/assets/images/deadpool.jpg')
Artwork.create!(title: 'Joker Picture', artist_id: 2, image_url: 'first_routes_and_controllers/app/assets/images/joker.jpg')
Artwork.create!(title: 'Pizza Image', artist_id: 1, image_url: 'first_routes_and_controllers/app/assets/images/pizza.jpg')

ArtworkShare.create!(viewer_id: 1, artwork_id: 1)
ArtworkShare.create!(viewer_id: 4, artwork_id: 4)
ArtworkShare.create!(viewer_id: 5, artwork_id: 3)
ArtworkShare.create!(viewer_id: 2, artwork_id: 2)
ArtworkShare.create!(viewer_id: 4, artwork_id: 1)
ArtworkShare.create!(viewer_id: 3, artwork_id: 3)
ArtworkShare.create!(viewer_id: 2, artwork_id: 4)