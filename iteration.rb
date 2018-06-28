array = [0, 1, 2, 3, 4, 5]
hash = {
	one: 1,
	two: 2,
	three: 3
}

def array_checker(array)
	array.each do |number|
		puts "The current number is #{number}"
	end
end

def addition_array(array)
	array.each do |number|
		puts "The current num #{number} + 2 is " + (number + 2).to_s
	end 
end 

# array_checker(array)  
# addition_array(array)

def hash_check(hash)
	hash.each do |key, value|
		puts "The key is #{key}, and the value is #{value}."
	end 
end 

#hash_check(hash)

## The times iterator ##

def times_iterator(value)
	value.times do |num|
		puts "This has gone through #{num} times!"
	end 
end 

# times_iterator(5)

## The for loop ##

def num_for_loop(array)
	for item in array 
		puts "This is my favorite #{item}!"
	end
end

# num_for_loop(array)  
