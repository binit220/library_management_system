class BooksController < ApplicationController
  skip_forgery_protection
  def index
    @books = Book.all
  end

  def show
    # books = Book.find(params[:id])
  end

  def new
    @book = Book.new()
  end

  def create
    @book = Book.create(book_params)
    if @book.save!
      redirect_to books_path
    else
      render new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :author, :genr, :isbn, :availability, :item_count)
  end

end
