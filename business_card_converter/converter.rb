require 'rexml/document'

html_file_path = './data/my_business_card.html'
xml_file_path = './data/my_business_card.xml'
img_path = '../images/Stewie_Griffin.png'

begin
  xml_file = File.open(xml_file_path, 'r:UTF-8')
rescue Errno::ENOENT => e
  regexp = %r{/data/(.*)}i
  file_name = xml_file_path.scan(regexp)
  puts "XML file #{file_name} not found"
  abort e.message
end

xml = REXML::Document.new(xml_file)
xml_file.close

xml_data = {}
xml.root.elements.each do |item|
  xml_data[item.name] = item.text
end

unless File.exist?(html_file_path)
  File.open(html_file_path, 'w:UTF-8') do |file|
    file.puts '<!DOCTYPE html>'
  end
end

html_file = File.open(html_file_path, 'r:UTF-8')
html = REXML::Document.new(html_file)
html_file.close

html.add_element('html', {'lang' => 'en'})
head = html.root.add_element('head')
head.add_element('meta', {'charset' => 'UTF-8'})
title = head.add_element('title').add_text("#{xml_data['first_name']} #{xml_data['last_name']}")
body = html.root.add_element('body')
body.add_element('p').add_element('img', {'src' => img_path}) # image
body.add_element('p').add_text(title.text) # name
body.add_element('p').add_text(xml_data['description']) # description
body.add_element('p').add_text("Phone: #{xml_data['phone']}") # phone
body.add_element('p').add_text("Email: #{xml_data['email']}") # email

File.open(html_file_path, 'w:UTF-8') do |html_file|
  html.write(html_file, 4)
end
