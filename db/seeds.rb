# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'alexvak@example.com', password: 'alvakadmin', password_confirmation: 'alvakadmin') if Rails.env.development?
user = User.create(first_name: 'Anton', last_name: 'Konovalov', patronymic: 'Volodymyrovych', email: 'antonkonovalov@example.com', phone_number: '0671234567', password: '11223344')
user.add_role :student


