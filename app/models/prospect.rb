class Prospect < ActiveRecord::Base
	belongs_to :stage
	belongs_to :user, foreign_key: :managed_by
	 validates_presence_of :full_name, :phone, :email, :location
	  validates_uniqueness_of :phone, :email
	before_save :change_to_customer

	def change_to_customer
		w = Stage.find_by(name:"Won").id
		if self.stage_id == w
			customer = Customer.new
			customer.full_name = self.full_name
			customer.email = self.email
			customer.phone = self.phone
			customer.location = self.location
			customer.managed_by = self.managed_by
			customer.save
		end
	end
end
