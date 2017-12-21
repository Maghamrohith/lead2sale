class Customer < ActiveRecord::Base
	belongs_to :user, foreign_key: :managed_by
	after_create :empty_prospect
	def empty_prospect
		user = self.user
		user.prospects.each do |prospect|
			if prospect.full_name == self.full_name
				prospect.delete
			end
		end

	end
end
