# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username:'Soto', email: 'sotirios.dimitriou@gmail.com', password: 111111, admin: true)
# User.create(username:'Saoma', email: 'saoma@soto.com', password: 111111)


# rake db:seed:seed_file_name
# rake db:seed:all
