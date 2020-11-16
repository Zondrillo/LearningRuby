require 'rexml/document'

html_file_path = './data/my_business_card.html'
xml_file_path = './data/my_business_card.xml'
img_path = '../images/Stewie_Griffin.png'

unless File.exist?(html_file_path)
  File.open(html_file_path, 'w:UTF-8') do |file|
    file.puts '<!DOCTYPE html>'
    file.puts '<html lang="en"></html>'
  end
end

xml_file = File.open(xml_file_path, 'r:UTF-8')
xml = REXML::Document.new(xml_file)
xml_file.close

xml_data = {}
xml.root.elements.each do |item|
  xml_data[item.name] = item.text
end

html_file = File.open(html_file_path, 'r:UTF-8')
html = REXML::Document.new(html_file)
html_file.close

html_tag = html.elements.find('html').first
head = html_tag.add_element('head')
head.add_element('meta', {'charset' => 'UTF-8'})
title = head.add_element('title')
title.text = "#{xml_data['first_name']} #{xml_data['last_name']}"
body = html_tag.add_element('body')
body.add_element('img', {'src' => img_path})
name = body.add_element('p')
name.text = title.text
description = body.add_element('p')
description.text = xml_data['description']
phone = body.add_element('p')
phone.text = "Phone: #{xml_data['phone']}"
email = body.add_element('p')
email.text = "Email: #{xml_data['email']}"

File.open(html_file_path, 'w:UTF-8') do |html_file|
  html.write(html_file, 4)
end
