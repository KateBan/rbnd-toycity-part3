class Transaction

	attr_reader :customer, :product,:id

	@@transactions = []
	@@id = 0

	def initialize(customer,product)
		@customer = customer
		@product = product
		@@id += 1
		@id = @@id
	    add_transaction

	end

	def self.all
		@@transactions
	end
	
	def self.id
		@@id
	end

	def self.find(id)
		@@transactions.find {|transaction| transaction.id == id}
	end

	 
	def add_transaction
    	if product.in_stock?  
      		@@transactions << self
      		product.decrease_stock
    	else
      		raise OutOfStockError, "'#{product.title}' is out of stock."
    	end
  	end
end



