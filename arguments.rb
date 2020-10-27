if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

argument = ARGV[0]

if argument == "дурак"
  puts "Сам дурак!"
else
  puts "Здравствуй, дорогой!"
end
