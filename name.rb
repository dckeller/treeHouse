class Name
	attr_reader :title, :first_name, :last_name
	attr_writer :title

	def initialize(title, first_name, last_name)
		@title = title
		@first_name = first_name
		@last_name = last_name 
	end 

	def full_name
		first_name + " " + last_name
	end

	def title_name
		title + " " + full_name
	end

	def to_s
		full_name
	end

end

name = Name.new("Mr.", "David", "Keller")

puts name.full_name
puts name.inspect