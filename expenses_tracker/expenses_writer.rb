if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [$stdin, $stdout].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'rexml/document'
require 'date'

current_path = File.dirname(__FILE__)
file_name = "#{current_path}/my_expenses.xml"

file = File.open(file_name, 'r:UTF-8')
begin
  doc = REXML::Document.new(file)
rescue REXML::ParseException => e
  puts 'XML file is corrupted'
  abort e.message
end
file.close

puts 'На что потрачены деньги?'
expense_text = $stdin.gets.chomp

puts 'Сколько потратили?'
expense_amount = $stdin.gets.chomp.to_i

puts 'Укажите дату траты в формате ДД.ММ.ГГГГ, например 12.05.2003 (пустое поле - сегодня)'
date_input = $stdin.gets.chomp

expense_date = if date_input == ''
                 Date.today
               else
                 Date.parse(date_input)
               end

puts 'В какую категорию занести трату'
expense_category = $stdin.gets.chomp

expenses = doc.elements.find('expenses').first

expense = expenses.add_element('expense', {
    'amount' => expense_amount,
    'category' => expense_category,
    'date' => expense_date.to_s
})
expense.text = expense_text

file = File.new(file_name, 'w:UTF-8')
doc.write(file, 2)
file.close

puts 'Запись успешно сохранена'
