class Book < ActiveRecord::Base
	validates :title, :description, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	validates :title, uniqueness: true

	has_attached_file :image, styles: { small: "135x189>", medium: "232x357>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
