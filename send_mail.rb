require "pony"
require "io/console"

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

my_mail = "52russiadk@mail.ru"

puts "Введите пароль от Вашей почты #{my_mail} для отправки письма:"
password = STDIN.noecho(&:gets).chomp

puts "Кому отправить письмо?"
subject = STDIN.gets.chomp

puts "Введите тему письма:"
send_to = STDIN.gets.chomp

puts "Что написать в письме?"
body = STDIN.gets.chomp

Pony.mail(
{
	:subject => subject,
	:body => body,
	:to => send_to,
	:from => my_mail,

	:via => :smtp,
	:via_options => {
    :address => 'smtp.mail.ru',
    :port => '465',
    :tls => true,
    :user_name => my_mail,
    :password => password,
    :authentication => :plain
  }
}	)

puts "Письмо успешно отправлено!"
