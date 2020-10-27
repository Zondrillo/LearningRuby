def walker(file_name)
	current_path = File.dirname(__FILE__)
	file_path = current_path + "/" + file_name
	unless File.exist?(file_path)
		abort "File #{file_name} not found"
	end
	file = File.new(file_path, 'r:UTF-8')
	output_holidays = file.readlines
	file.close
	return output_holidays
end

holidays = walker("holidays.txt")
for item in holidays do
	item.chomp!
end

time = Time.now
week_day = time.wday
date = time.strftime("%d.%m")

if week_day == 6 || week_day == 0
	puts "Сегодня выходной!"
elsif holidays.include?(date)
  puts "Сегодня праздник!"
else
  puts "Сегодня будний день, за работу!"
end
