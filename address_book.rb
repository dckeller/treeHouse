require "./contact_class"

class AddressBook
	attr_reader :contacts

	def initialize
		@contacts = []
	end

	def find_by_name(name)
		results = []
		search = name.downcase

		contacts.each do |contact|
			if contact.full_name.downcase.include?(name)
				results.push(contact)
			end 
		end
		puts "Name search results (#{search})"
		results.each do |contact|
			puts contact.to_s("full_name")
			contact.print_numbers
			contact.print_addresses
			puts "-----------------------"
		end
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
		puts "Phone search results (#{search})"  
		results.each do |contact|
			puts contact.to_s("full_name")
			contact.print_numbers
			contact.print_addresses
			puts "-----------------------"
		end
	end

	def print_contact_list
		puts "Contact List"
		contacts.each do |person|
			puts person.to_s('last_first')
		end
	end

end

address_book = AddressBook.new

david = Contact.new
david.first_name = "David"
david.last_name = "Keller"
david.middle_name = "Christen"
david.add_phone_number("Home", "555-555-5555")
david.add_phone_number("Work", "444-444-4444")
david.add_address("Home", "123 South St.", "", "Newark", "Ca", "12345")


bob = Contact.new
bob.first_name = "Bob"
bob.last_name = "Johnson"
bob.middle_name = "Bill"
bob.add_phone_number("Home", "555-555-5555")
bob.add_phone_number("Word", "444-444-4444")
bob.add_address("Work", "111 North St.", "", "Centerville", "Ut", "12345")

address_book.contacts.push(david)
address_book.contacts.push(bob)

# address_book.print_contact_list

# address_book.find_by_name("bob")
# address_book.find_by_name("bill")
address_book.find_by_number("555")  