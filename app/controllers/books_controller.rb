class BooksController < ApplicationController
  include CurrentCart
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_cart
  
  def index
    @books = Book.all.order('created_at DESC')
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Successfully created new book"
    else
      render 'new'
    end
  end

  def show
    @reviews = Review.where(book_id: @book.id).order("created_at DESC")
    @review = Review.new
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: "Successfully updated book"
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path, notice: "Successfully deleted book"
  end

  private

    def set_book
       @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title,
        :description,
        :price,
        :image,
        :author,
        :publisher,
        :pages,
        :public_date,
        :categories)
    end
end
