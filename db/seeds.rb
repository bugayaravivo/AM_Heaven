# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: '1@1',password: '123456')
 # Adminユーザーの作成
# admin = Admin.find_or_create_by!(email: "admin@test") do |admin|
#   admin.password = "123456"
# end

# Publicユーザーの作成
# olivia = User.find_or_create_by!(email: "olivia@example.com") do |user|
#   user.name = "Olivia"
#   user.password = "password"
#   user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename: "sample-user1.jpg")
# end