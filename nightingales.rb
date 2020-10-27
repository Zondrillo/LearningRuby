if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

temperature = ARGV[0].to_i
season = ARGV[1].to_i

unless temperature != 0 && season != 0
  puts "Какая сейчас температура?"
  temperature = STDIN.gets.to_i
  puts "Какое сейчас время года? (0 - весна, 1 - лето, 2 - осень, 3 - зима)"
  season = STDIN.gets.to_i
end
if season == 1 && temperature.between?(15, 35) || season != 1 && temperature.between?(22, 30)
  puts "Скорее идите в парк, соловьи поют!"
else
  puts "Сейчас соловьи молчат, греются или прохлаждаются :)"
end
