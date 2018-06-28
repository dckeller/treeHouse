## Working with Hashes ##

def create_list
	puts "What is the name of the list?"
	list_name = gets.chomp

	list_name_hash = {name: list_name, items: Array.new}
	list_name_hash
end

def add_list_item
	puts "What item would you like to add?"
	item_name = gets.chomp

	puts "How many?"
	item_quantity = gets.chomp

	item_hash = {item_name: item_name, item_quantity: item_quantity}
	item_hash
end

def print_seperator(character="-")
	puts character * 40
end 

def print_list(list)
	puts "List: #{list[:name]}"
	print_seperator

	list[:items].each do |item|
		puts "Name: " + item[:item_name] + "\t" + "Quantity: " + item[:item_quantity]
		print_seperator
	end
end  


list = create_list

loop do
	puts "would you like to add another item? (y/n)"
	answer = gets.chomp
	
	if answer == "n"
		break
	else
		list[:items].push(add_list_item)
	end
end   

print_list(list)

## Working with loops and REGEXP ##

def get_name
	name = ""
	loop do 
		puts "Please enter your name (min 2 characters)"
		name = gets.chomp

		if name.length >= 2 && !name.index(/\d/)
			break
		else
			puts "Must contain 2 characts and no numbers"
		end
	end
	name
end

name = get_name
# puts "Hi, #{name}" 

## While loop stuff ##

def bottles_left(starting_bottles)
	i = starting_bottles

	while i > 0
		puts "#{i} bottles of beer, take one down pass it around #{i - 1}"
		i -= 1
	end

puts "No more bottles" 
end

# bottles_left(10) 

## Until loop stuff ##

def countdown(start)
	i = start
	
	until i == 0
		puts "#{i}"
		i -= 1
	end

puts "Blast off!!!"
end 

countdown(10)