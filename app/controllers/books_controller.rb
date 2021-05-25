class BooksController < ApplicationController

  def index
    @user = current_user
    @new_book = Book.new
    @books = Book.all
  end

  def show
    @user = current_user
    @new_book = Book.new
    @book = Book.find(params[:id])
    @book_user = @book.user
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    @new_book.save
    redirect_to book_path(@new_book)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
