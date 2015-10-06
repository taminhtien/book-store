class Book < ActiveRecord::Base
	before_destroy :ensure_not_referenced_by_any_line_item

	validates :title, :description, presence: true
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	validates :title, uniqueness: true

	has_attached_file :image, styles: { small: "135x189>", medium: "232x357>" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

	belongs_to :user
	has_many :reviews
	has_many :line_items

	private

		# Ensures that there are no line items referencing this product
		def ensure_not_referenced_by_any_line_item
			if line_items.empty?
				return true
			else
				errors.add(:base, 'Line Items present')
				return false
			end
		end
end
