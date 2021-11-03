require 'faker'

nb_users = 10
nb_cities = 10
nb_gossips = 20
nb_tags = 10
nb_comments = 5

Faker::Config.locale = 'fr'

puts "Purge de la base de données..."

Gossip.destroy_all
User.destroy_all
City.destroy_all
Comment.destroy_all
Tag.destroy_all

puts "Début de l'insémination..."

# Ajout de n City à la base de données
cities_array = []
while cities_array.length < nb_cities
  city = Faker::Address.city
  cities_array << city unless cities_array.include?(city)
end
cities_array.each{ |city| City.create(name: city, zip_code: Faker::Address.zip_code) }

puts "#{City.all.count} villes sont en base de données."
  
# Ajout de n User à la base de données
nb_users.times do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: rand(18..70),
    city: City.all[i],
    avatar_link: Faker::Avatar.image
    )
end

puts "#{User.all.count} users sont en base de données"

# Ajout de n Tag à la base de données
tags_array = []
while tags_array.length < nb_tags
  tag = Faker::Emotion.noun
  tags_array << tag unless tags_array.include?(tag)
end
tags_array.each{ |tag| Tag.create(title: tag) }

puts "#{Tag.all.count} tags sont en base de données."

# Ajout de n Gossip à la base de données
nb_gossips.times do
  gossip = Gossip.create(
  title: Faker::Lorem.sentence(word_count: 1),
  content: Faker::ChuckNorris.fact,
  user: User.all.sample
  )
  rand(1..4).times do
    tag = Tag.all.sample
    gossip.tags << tag unless gossip.tags.include?(tag)
  end
end
puts "#{Gossip.all.count} gossips sont en base de données"

# Ajout d'un User "Anonymous"
User.create(
  first_name: "anonymous",
  last_name: "anonymous",
  description: Faker::Lorem.sentence,
  email: Faker::Internet.email,
  age: rand(18..70),
  city: City.all.sample,
  avatar_link: Faker::Avatar.image
  )

puts "L'utilisateur \"anonymous\" a bien été crée"

Gossip.all.each do |gossip|
  rand(0..nb_comments).times do |i|
    Comment.create(
      content: "Ceci est le commentaire numéro #{i}",
      gossip: gossip,
      user: User.all.sample
    )
  end
end

puts "#{Comment.all.count} commentaires sont en base de données"
