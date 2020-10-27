require_relative 'game'
require_relative 'result_printer'
require_relative 'word_reader'

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [$stdin, $stdout].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

printer = ResultPrinter.new
reader = WordReader.new
word = reader.read_from_file('words.txt')
game = Game.new(word)

while game.status.zero?
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
