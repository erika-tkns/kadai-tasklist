# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(name: "b", email: "b@b.jp", password: "12345678")
(1..100).each do |number|
  Task.create(user: user, status: "pending", content: 'test content ' + number.to_s)
end