class Address < ActiveRecord::Base
	belongs_to :user
	validates :name, :address, :email, :mobile, presence: true
end
