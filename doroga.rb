require_relative "bridge.rb"

puts "Let'go!"

sleep 1

puts "Wow, it's a river!"

sleep 1

bridge = Bridge.new

sleep 1

if !bridge.is_opened?
  bridge.open
end

puts bridge.is_opened?.to_s
