# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admins = Admin.create!([{
  email: 'hodari@hiddengeniusproject.org',
  password: 'genius',
  password_confirmation: 'genius'
  admin: 'yes'
  }])
#Admin_User.create([{
# email: 'hodari@hiddengeniusproject.org',
# password: 'genius',
# password_confirmation: 'genius'
# admin: 'yes'
# }])

#User.create(
# email: 'hodariAT@hiddengeniusproject',
# password: 'password',
# password_confirmation: 'password'
# admin: 'no'
# }])

if Rails.env.development?
