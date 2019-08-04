class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).includes(:phrases).per(25)
  end

  def show
    @user = User.find(params[:id])
    @phrases = @user.phrases.order(id: :desc).page(params[:page]).per(25)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザ登録完了しました'
      redirect_to @user
    else
      flash[:danger] = '登録できませんでした'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end