require 'json'

file = File.read('business_card.json', encoding: 'UTF-8')
business_card = JSON.parse(file)

puts "#{business_card['first_name']} #{business_card['last_name']}"
puts "#{business_card['phone']}, #{business_card['email']}"
puts business_card['description'].to_s
