class AuthorsController < ApplicationController
  before_action :require_user_logged_in

  def index
    @authors = Author.order(id: :desc).page(params[:page]).includes(:books).per(25)
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    
    if @author.save
      flash[:success] = '著者が登録できました'
      redirect_to new_book_path(author_id: @author.id)
    else
      flash[:danger] = '登録できませんでした'
      render :new
    end
  end
  
  private
  
  def author_params
    params.require(:author).permit(:name)
  end
    
  
  
end
