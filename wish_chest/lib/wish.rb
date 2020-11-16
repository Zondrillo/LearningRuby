class Wish

  attr_accessor :file_path

  def self.xml_file_reader
    xml_file = File.open(Wish.new.file_path, 'r:UTF-8')
    begin
      doc = REXML::Document.new(xml_file)
    rescue REXML::ParseException => e
      puts 'XML file is corrupted'
      abort e.message
    end
    xml_file.close
    doc
  end

  def initialize
    @file_path = './data/wishes.xml'
    unless File.exist?(@file_path)
      File.open(@file_path, 'w:UTF-8') do |file|
        file.puts "<?xml version='1.0' encoding='UTF-8'?>"
        file.puts '<wishes></wishes>'
      end
    end
  end

  def write
    doc = Wish.xml_file_reader
    puts 'В этом сундуке хранятся ваши желания.'
    puts 'Чего бы Вы хотели?'
    wish_input = $stdin.gets.chomp
    puts "До какого числа вы хотите осуществить это желание?\n(укажите дату в формате ДД.ММ.ГГГГ)"
    date_input = $stdin.gets.chomp
    estimate_date = if date_input == ''
                      Date.today
                    else
                      Date.parse(date_input)
                    end
    wishes = doc.elements.find('wishes').first
    wish = wishes.add_element('wish', {'date' => estimate_date.strftime('%d.%m.%Y')})
    wish.text = wish_input
    File.open(file_path, 'w:UTF-8') do |file|
      doc.write(file, 2)
    end
    puts 'Ваше желание в сундуке'
  end

  def read
    doc = Wish.xml_file_reader
    back_wishes = {}
    coming_wishes = {}
    doc.root.elements.each do |item|
      if Date.parse(item['date']) <= Date.today
        back_wishes[item['date']] = item.text.strip
      else
        coming_wishes[item['date']] = item.text.strip
      end
    end
    puts 'Эти желания должны уже были сбыться к сегодняшнему дню:'
    back_wishes.each_pair do |key, value|
      puts "#{key}: #{value}"
    end
    puts
    puts 'А этим желаниям ещё предстоит сбыться:'
    coming_wishes.each_pair do |key, value|
      puts "#{key}: #{value}"
    end
  end

end
