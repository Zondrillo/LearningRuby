require 'digest'

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [$stdin, $stdout].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

puts 'Введите слово или фразу для шифрования:'
phrase = $stdin.gets.chomp

puts "Каким способом зашифровать:\n1. MD5\n2. SHA1"
way = $stdin.gets.to_i

puts 'Вот что получилось:'
case way
when 1
  puts Digest::MD5.hexdigest phrase
when 2
  puts Digest::SHA1.hexdigest phrase
else
  puts 'Неожиданный способ шифрования'
end
