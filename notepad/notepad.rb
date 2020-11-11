if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [$stdin, $stdout].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/post'
require_relative 'lib/memo'
require_relative 'lib/task'
require_relative 'lib/link'

puts 'Привет, я твой блокнот!'
puts 'Что хотите записать?'

choices = Post.post_types

choice = -1

until choice >= 0 && choice < choices.size
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end
  choice = $stdin.gets.chomp.to_i
end

entry = Post.create(choice)

entry.read_from_console
entry.save

puts 'Запись сохранена'