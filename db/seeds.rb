# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

#Create users

10.times do 
    User.create(email: Faker::Internet.email, password: 'lukitas')
end


['Disenio','Programacion','Tecnologia'].each do |category_name|
    c = Category.create!(name: category_name, color: Faker::Color.hex_color)
    3.times do
        a = Article.new(title:Faker::Commerce.product_name , body:Faker::Lorem.paragraphs,user:User.all.sample)
        a.categories=[c]
        a.save
    end
end

