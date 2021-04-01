# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:require "open-uri"

#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts "Cleaning database..."
Megalith.destroy_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'megaliths_seed.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Megalith.new
  t.name = row['Name']
  t.city = row['City']
  t.address = row['Address']
  t.category = row['Category']
  t.description = row['Description']
  t.latitude = row['Latitude']
  t.longitude = row['Longitude']
  t.save
  puts "#{t.name}, #{t.city} saved"
end

puts "There are now #{Megalith.count} rows in the megaliths table"

megaliths = Megalith.all
megaliths.each do |megalith|
  megalith.photo.attach(io:File.open("db/fixtures/megaliths/#{megalith.city}/#{megalith.name}/#{megalith.name}_1.jpg"), filename: '#{megalith.name}_1.jpg', content_type: 'image/jpg')
end
