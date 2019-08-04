class BooksController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @books = Book.all.includes(:phrases)
  end

  def new
    @book = Book.new
    # params[:author_id]
  end

  def create
    @book = Book.new(book_params)
    @book.author_id = params[:author_id]
    
    if @book.save
      flash[:success] = '本の登録ができました'
      redirect_to new_phrase_path(book_id: @book.id)
    else
      flash[:danger] = '登録できませんでした'
      render :new
    end
  end
  
  private
  def book_params
    params.require(:book).permit(:name)
  end
end
