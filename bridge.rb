class Bridge

	def initialize
		puts "Bridge created"
		@opened = false
	end

	def open
		puts "Bridge is open, let's go!"
		@opened = true
	end

	def is_opened?
		return @opened
	end

end
