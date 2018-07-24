require "./contact_class"
require "yaml"

class AddressBook
	attr_reader :contacts

	def initialize
		@contacts = []
		open()
	end

	def open
		if File.exists?("contacts.yml")
			@contacts = YAML.load_file("contacts.yml")
		end 
	end

	def save
		File.open("contacts.yml", "w") do |file|
			file.write(contacts.to_yaml)
		end 
	end  

	def find_by_name(name)
		results = []
		search = name.downcase

		contacts.each do |contact|
			if contact.full_name.downcase.include?(name)
				results.push(contact)
			end 
		end
		print_results("Name search results (#{search})", results)
	end

	def find_by_number(number)
		results = []
		search = number.gsub("-", "")

		contacts.each do |contact|
			contact.phone_numbers.each do |number|
				if number.number.gsub("-", "").include?(search)
					results.push(contact)
				end
			end 
		end
		print_results("Phone search results (#{search})", results)  
	end

	def find_by_address(query)
		results = []
		search = query.downcase

		contacts.each do |contact|
			contact.addresses.each do |address|
				if address.to_s("long").downcase.include?(search)
					results.push(contact) unless results.include?(contact)
				end 
			end
		end
		print_results("Address search results (#{search})", results)  
	end 

	def print_contact_list
		puts "Contact List"
		contacts.each do |person|
			puts person.to_s('last_first')
		end
	end

	def print_results(search, results)
		puts search
		results.each do |contact|
			puts contact.to_s("full_name")
			contact.print_numbers
			contact.print_addresses
			puts "\n"
		end 
	end

	def add_contact
		contact = Contact.new
		print "First Name: "
		contact.first_name = gets.chomp
		print "Middle Name: "
		contact.middle_name = gets.chomp
		print "Last Name: "
		contact.last_name = gets.chomp
		contacts.push(contact)

		loop do 
			puts "Add Phone or Address? "
			puts "p: Phone"
			puts "a: Address"
			puts "(Any other key to go back)"
			response = gets.chomp.downcase
			case response
			when "p"
				phone = PhoneNumber.new
				print "What kind of number? (Home, Work, Etc.): "
				phone.kind = gets.chomp
				print "Number: "
				phone.number = gets.chomp
				contact.phone_numbers.push(phone)
			when "a"
				address = Address.new
	      print "Address Kind (Home, Work, etc): "
	      address.kind = gets.chomp
	      print "Address line 1: "
	      address.street_1 = gets.chomp
	      print "Address line 2: "
	      address.street_2 = gets.chomp
	      print "City: "
	      address.city = gets.chomp
	      print "State: "
	      address.state = gets.chomp
	      print "Postal Code: "
	      address.postal_code = gets.chomp
	      contact.addresses.push(address)
			else
				print "\n"
				break
			end 
		end
	end 

	def run	
		loop do 
			puts "Address Book"
			puts "e: exit"
			puts "p: Print Address Book"
			puts "a: Add Contact"
			puts "s: Search"
			print "Please enter your choice: "
			input = gets.chomp.downcase
			case input
			when "p"
				print_contact_list
			when "a"
				add_contact
			when "s"
				print "Search term: "
				search = gets.chomp.downcase
				find_by_address(search)
				find_by_number(search)
				find_by_name(search)
			when "e"
				save()
				break
			end
		end 
	end  

end

address_book = AddressBook.new
address_book.run
  