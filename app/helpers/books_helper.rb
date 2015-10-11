module BooksHelper
	def avg_review(book)
    @reviews = Review.where(book_id: book.id).order("created_at DESC")
    if @reviews.blank?
      0
    else
      @reviews.average(:rating).round(2)
    end
  end

  def count_review(book)
  	Review.where(book_id: book.id).count
  end

  def recent_reviews
  	@recent_reviews = Review.all.order('created_at DESC').limit(5)
  end
end
