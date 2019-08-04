class PhrasesController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_phrase, only: [:show, :edit, :update, :destroy] 
  
  
  def new
    @phrase = Phrase.new
  end

  def create
    @phrase = Phrase.new(phrase_params)
    @phrase.book_id = params[:book_id]
    @phrase.user_id = current_user.id
    
    if @phrase.save
      flash[:success] = 'フレーズを投稿しました'
      redirect_to root_url
    else
      flash[:danger] = '投稿できませんでした'
      render :new
    end
  end

  def show
    @book = @phrase.book_id
    @author = @book.author_id
  end

  def edit
  end

  def update
    
    if @phrase.update(phrase_params)
      flash[:success] = 'フレーズを更新しました'
      redirect_to @phrase
    else
      flash[:danger] = '更新に失敗しました'
      render :edit
    end
  end

  def destroy
    
    if @phrase.destroy
      flash[:success] = 'フレーズを削除しました'
      redirect_to root_url
    end
  end
  
  private
  
  def phrase_params
    params.require(:phrase).permit(:content, :comment)
  end
  
  def set_phrase
    @phrase = Phrase.find(params[:id])
  end
end
