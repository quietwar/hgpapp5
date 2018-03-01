# if Rails.env.development?
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') #if Rails.env.development?
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# require 'csv'
#
# csv_text = File.read(Rails.root.join('lib', 'seeds', 'Cohort.csv'))
#puts csv_text
# csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
# csv.each do |row|
#   c = Cohort.new
#   c.cohort = row['cohort']
#   c.genius = row['genius']
#   c.cell = row['cell']
#   c.email = row['email']
#   c.email2 = row['email2']
#   c.city = row['city']
#   c.save
#   puts "#{c.cohort}, #{c.genius}, #{c.cell}, #{c.email}, #{c.email2}, #{c.city} saved"
# end
# puts "There are now #{Cohort.count} rows in the cohort table"

%i[guest user staff director admin].each do |role|
  AdminUser.find_or_create_by!(email: "#{role}hodari@hiddengeniusproject.org") do |admin_user|
    admin_user.first_name = 'Hodari'
    admin_user.last_name = 'Toure'
    admin_user.role = 'admin'
    admin_user.password = 'password'
    admin_user.password_confirmation = 'password'
  end
end
# # Examples:
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
# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
