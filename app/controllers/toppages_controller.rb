class ToppagesController < ApplicationController
  def index
    if logged_in?
      @phrases = current_user.phrases.order(id: :desc).page(params[:page])
    end
  end
end
