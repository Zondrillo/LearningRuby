if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

regexp = /#[[:word:]-]+/i

puts "Введите строку с хэштегами:"
user_string = STDIN.gets.chomp

matchObj = user_string.scan(regexp)

puts 'Нашли вот такие хэштеги: ' + matchObj.join(', ')
