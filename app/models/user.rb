class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :customers, foreign_key: :managed_by
  has_many :prospects, foreign_key: :managed_by
  belongs_to :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         validates_presence_of :full_name,:phone
         validates_uniqueness_of :phone, :email
         validates_numericality_of :phone
         before_create :assign_role


         def assign_role
         	role =Role.find_by(name:"SalesAssociate").id
         	self.role_id = role 
         end
         def role?(role)
         	self.role.name.include? role
        end
end
