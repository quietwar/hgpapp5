# if Rails.env.development?
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') #if Rails.env.development?
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'Cohort.csv'))
puts csv_text
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
puts csv

csv.each do |row|
  u = User.new
  u.cohort_id = row['cohort_1d']
  u.genius = row['genius']
  u.cell = row['cell']
  u.email = row['email']
  u.email2 = row['email2']
  u.city = row['city']
  u.password = row['password']
  u.password confirmation = row['password confirmation']
  u.save
  puts "#{u.cohort_id}, #{u.genius}, #{u.cell}, #{u.email}, #{u.email2}, #{u.city} saved"
end
puts "There are now #{User.count} rows in the user table"
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# admins = Admin.create!([{
#   email: 'hodari@hiddengeniusproject.org',
#   password: 'genius',
#   password_confirmation: 'genius'
#   admin: 'yes'
#   }])
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
# end
