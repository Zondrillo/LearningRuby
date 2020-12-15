require 'net/http'
require 'uri'
require 'cgi'
require 'rexml/document'

# Словарь состояний параметра cloudiness, описанный на сайте метеосервиса
CLOUDINESS = { 0 => 'Ясно', 1 => 'Малооблачно', 2 => 'Облачно', 3 => 'Пасмурно' }.freeze
TOD = { 0 => 'ночь', 1 => 'утро', 2 => 'день', 3 => 'вечер' }.freeze
CITIES = { 1 => 37, 2 => 120, 3 => 69, 4 => 99, 5 => 115, 6 => 121, 7 => 141, 8 => 199 }.freeze
CITIES_NAMES = %w[Москва Нижний-Новгород Санкт-Петербург Новосибирск Орёл Чита Братск Краснодар].freeze

def show_forecast(city_index)
  result = []
  uri = URI.parse("https://www.meteoservice.ru/export/gismeteo?point=#{CITIES[city_index]}")
  response = Net::HTTP.get_response(uri)
  doc = REXML::Document.new(response.body)
  city_name = CGI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])
  result << "#{city_name}\n\n"
  current_forecast = doc.root.elements['REPORT/TOWN'].elements.to_a
  current_forecast.each_with_index do |forecast, index|
    min_temp = forecast.elements['TEMPERATURE'].attributes['min']
    max_temp = forecast.elements['TEMPERATURE'].attributes['max']
    max_wind = forecast.elements['WIND'].attributes['max']
    tod = forecast.attributes['tod'].to_i
    clouds_index = forecast.elements['PHENOMENA'].attributes['cloudiness'].to_i
    clouds = CLOUDINESS[clouds_index]
    time_of_day = TOD[tod]
    result << if index.zero? || index == 1
                "Сегодня, #{time_of_day}\n#{min_temp}..#{max_temp}, ветер #{max_wind} м/с, #{clouds}\n\n"
              else
                "Завтра, #{time_of_day}\n#{min_temp}..#{max_temp}, ветер #{max_wind} м/с, #{clouds}\n\n"
              end
  end
  result
rescue REXML::ParseException
  'Город не найден'
end

puts 'Погоду для какого города Вы хотите узнать?'
CITIES_NAMES.each_with_index { |name, index| puts "#{index + 1}: #{name}" }

user_input = $stdin.gets.chomp.to_i

puts show_forecast(user_input)
