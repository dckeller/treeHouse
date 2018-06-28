def ask(question, kind="string")
	puts question + " "
	answer = gets.chomp
	answer = answer.to_i if kind == "number"

	answer
end

def add_contact
	contact = {name: "", phone: []}

	contact[:name] = ask("What is your name?")

	answer = ""
	while answer != "n"
		answer = ask("Would you like to put a phone number? (y/n)")
		if answer == "y"
			phone_number = ask("Enter a number:")
			contact[:phone].push(phone_number)
		end
	end  

	contact
end  

contact_list = []

answer = ""
while answer != "n"
	contact_list.push(add_contact)
	answer = ask("Would you like to add another contact? (y/n)")
end 

puts "---"

contact_list.each do |contact|
	puts "Name: #{contact[:name]}"

	if contact[:phone].count > 0
		contact[:phone].each do |numbers|
			puts "Numbers: #{numbers}"
		end 
	end
	puts "---\n" 
end 
