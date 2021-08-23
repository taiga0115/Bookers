class BooksController < ApplicationController

  def top
  end

  def index
    @books = Book.all
    @book = Book.new

  end

  def create
    flash[:notice] = "Book was successfully updated." 
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
    redirect_to book_path(@book.id)
    else
    render :index

    end
  end

  def show
        @book = Book.find(params[:id])

  end

  def new
    @book = Book.new
  end

  def edit
    @books = Book.all
     @book = Book.find(params[:id])

  end

  def update
    flash[:notice] = "Book was successfully updated." 
    @book = Book.find(params[:id])
     if @book.update(book_params)
    redirect_to book_path(@book.id)
  else
    render :edit
    
  end 
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

 private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body,)
  end
  
  
end
