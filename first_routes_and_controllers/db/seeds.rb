# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

users = User.create!([
    {username: 'Andre'}, 
    {username: 'Brendon'}, 
    {username: 'Kane'}, 
    {username: 'Sarah'}, 
    {username: 'Shelly'}
])

artworks = Artwork.create!([
    {title: 'Fruit Painting', artist_id: users[0].id, image_url: 'first_routes_and_controllers/app/assets/images/fruitpainting.jpg'},
    {title: 'Deadpool Poster', artist_id: users[1].id, image_url: 'first_routes_and_controllers/app/assets/images/deadpool.jpg'},
    {title: 'Joker Picture', artist_id: users[2].id, image_url: 'first_routes_and_controllers/app/assets/images/joker.jpg'},
    {title: 'Pizza Image', artist_id: users[3].id, image_url: 'first_routes_and_controllers/app/assets/images/pizza.jpg'}
])

ArtworkShare.create!(viewer_id: users[1].id, artwork_id: artworks[0].id)
ArtworkShare.create!(viewer_id: users[2].id, artwork_id: artworks[3].id)
ArtworkShare.create!(viewer_id: users[3].id, artwork_id: artworks[3].id)
ArtworkShare.create!(viewer_id: users[4].id, artwork_id: artworks[2].id)
ArtworkShare.create!(viewer_id: users[1].id, artwork_id: artworks[1].id)
ArtworkShare.create!(viewer_id: users[3].id, artwork_id: artworks[2].id)
ArtworkShare.create!(viewer_id: users[4].id, artwork_id: artworks[0].id)