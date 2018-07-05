class Monster
	attr_reader :name, :actions

	def initialize(name)
		@name = name
		@actions = {
			scream: 0,
			scare: 0
		}
	end

	def say(&block)
		print "#{name} says....."
		yield
	end 

	def scream(&block)
		actions[:scream] += 1
		print "#{name} screams..."
		yield
	end

	def scare(&block)
		actions[:scare] += 1
		print "#{name} scares you by yelling...." 
		yield self if block_given?
	end

	def inspect
		puts "<< #{name}, #{actions} >>"
	end  

end

monster = Monster.new("Fluffy")
monster.say { puts "Welcome to my cave!" }  

monster.scream do 
	puts "RAAWWRRR!!!"
end

monster.scare do |m|
	puts "Go away!!!"
	puts m.inspect
end 