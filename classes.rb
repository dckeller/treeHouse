class BankAccount
	attr_reader :name

	def initialize(name)
		@name = name
		@transactions = []
		add_transaction("Beginning", 0)
	end

	def credit(description, amount)
		add_transaction(description, amount)
	end 

	def debit(description, amount)
		add_transaction(description, -amount)
	end 

	def add_transaction(description, amount)
		@transactions.push(description: description, amount: amount)
	end

	def balance
		balance = 0
		@transactions.each do |transaction|
			balance += transaction[:amount]
		end
		sprintf("%0.2f", balance) 
	end

	def to_s
		print_amount
	end

	def print_amount
	puts "#{name}'s Account"
	puts "Description\tAmount"
	puts "_______________________"
		@transactions.each do |transaction|
			puts transaction[:description] + "\t" + sprintf("%0.2f", transaction[:amount])
		end
		puts "_______________________"
		puts "Balance:\t#{balance}"
	end   

end

account = BankAccount.new("David")
account.credit("Paycheck", 500)
account.debit("MCDonalds", 10)
account.debit("Electric", 80)
puts account.print_amount
