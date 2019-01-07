# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# rails new backend_project_name --api --database=postgresql
# rails new <my-project> --api -T --database=postgresql
require 'faker'


Location.destroy_all
Menu.destroy_all
Stylist.destroy_all
Customer.destroy_all
Service.destroy_all

10.times do
  Stylist.create({
    firstName: Faker::Name.first_name,
    lastName: Faker::Name.last_name
      })
end
10.times do
  Customer.create({
    firstName: Faker::Name.first_name,
    lastName: Faker::Name.last_name
      })
end
10.times do
  Service.create({
    stylist_id: Faker::Number.between(1, 10),
    customer_id: Faker::Number.between(1, 10)
      })
end
10.times do
  Menu.create({
    service_name: Faker::Hipster.word,
    price: Faker::Number.number(2),
    service_id: Faker::Number.between(1, 10)
    })
  end
  10.times do
    Location.create({
      address: Faker::Address.street_address,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      stylist_id: Faker::Number.between(1, 10),
      customer_id: Faker::Number.between(1, 10)
      })
    end
