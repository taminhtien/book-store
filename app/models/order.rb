class Order < ActiveRecord::Base
	PAYMENT_TYPES = [ "At destination place",
		"Internet Banking",
		"Visa, MasterCard" ]
	validates :name, :address, :email, :mobile, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPES
end
