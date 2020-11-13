require 'rexml/document'

current_path = File.dirname(__FILE__)
file_name = "#{current_path}/my_vc.xml"

abort "File #{file_name} not found" unless File.exist?(file_name)

file = File.new(file_name)

doc = REXML::Document.new(file)

file.close

input_data = { first_name: '',
               last_name: '',
               phone: '',
               email: '',
               description: '' }

input_data.each_key do |key|
  input_data[key] = doc.root.text(key.to_s).strip
end


puts "#{input_data[:first_name]} #{input_data[:last_name]}"
puts "#{input_data[:phone]}, #{input_data[:email]}"
puts "#{input_data[:description]}"
