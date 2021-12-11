class BooksController < ApplicationController


  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params[:id])
    if @book.save
      redirect_to book_path(@book), notice: 'Book was successfully created.'
    else
      @books = Book.all
      render action: :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
  def book_prams
    prams.require(:book).permit(:title, :body)
  end

  def set_book
    @book = Book.find(prams[:id])
  end
end