# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(name: "SalesManager")
Role.create(name: "SalesAssociate")


u = User.new
u.full_name = "admin"
u.email = "admin@gmail.com"
u.role_id = 1
u.password = "123456"
u.save