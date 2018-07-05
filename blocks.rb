# def block_method
# 	puts "This is inside the method"
# 	yield
# end

# block_method do 
# 	puts "This is the yield"
# end 


# def get_name(prompt, &block) 
# 	if block_given?
# 		puts prompt
# 		name = gets.chomp
# 		puts "Age?: "
# 		age = gets.chomp
# 		yield name, age
# 		name
# 	else
# 		puts "No block given."
# 	end 
# end 

# my_name = get_name("Enter your name:") do |name, age|
# 	puts "That's a cool name #{name}, and you're #{age} years old."
# end 

# puts "my_name: #{my_name}"

# haiku = <<-EOF
# This is all
# part of one
# big long sentence.
# EOF

# haiku.each_line { |line| puts "+ #{line}" }

# class BenchMarker
# 	def run(description, &block)
# 		start_time = Time.now
# 		yield
# 		end_time = Time.now
# 		elapsed_time = end_time - start_time
# 		puts "Description: #{description}"
# 		puts "Elapsed Time: #{elapsed_time}"
# 	end 
# end

# benchmark = BenchMarker.new
# benchmark.run("Sleep a random amount of time")do
# 	5.times do 
# 		print "+"
# 		sleep(rand(1..2))
# 	end
# end    