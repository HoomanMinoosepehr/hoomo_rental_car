# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
CarProfile.destroy_all

User.create(
    first_name: 'hooman',
    last_name: 'minoo',
    email: 'hooman@minoo.com',
    password: '1H234567',
    password_confirmation: '1H234567',
    admin: true
)

user = User.find_by(email: 'hooman@minoo.com')

car_profile = CarProfile.new(
    model: 'civic',
    year: '2000',
    mileage: '194000',
    price: '25',
    user: user,
    content: 'Runs perfect',
    location: 'Burnaby'
)

image_path_civic = Rails.root.join('image','2005-Honda-Civic.jpg')
car_profile.image.attach(io: File.open(image_path_civic), filename: '2005-Honda-Civic.jpg')

car_profile.save!

car_profile_2 = CarProfile.new(
    model: 'BMW',
    year: '2015',
    mileage: '67000',
    price: '155',
    user: user,
    content: 'Like new!',
    location: 'Coquitlam'
)

image_path_bmw = Rails.root.join('image','m3-2015.jpg')
car_profile_2.image.attach(io: File.open(image_path_bmw), filename: 'm3-2015.jpg')

car_profile_2.save!

car_profile_3 = CarProfile.new(
    model: 'Rav-4',
    year: '2015',
    mileage: '167000',
    price: '100',
    user: user,
    content: 'Clean',
    location: 'Vancouver'
)

image_path_rav4 = Rails.root.join('image','rav4 2015.jpg')
car_profile_3.image.attach(io: File.open(image_path_rav4), filename: 'rav4 2015.jpg')

car_profile_3.save!

