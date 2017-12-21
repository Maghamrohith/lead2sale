class CustomersController < ApplicationController

	def index
		if current_user.role?("SalesManager")
		 @customers = Customer.all
		else
		 @customers = current_user.customers
		end	
	end
end
