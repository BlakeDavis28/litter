class LitsController < ApplicationController
  before_action :authenticate_user!

  def index
    @lits = Lit.all
  end

  def new
    @lit = Lit.new
  end

  def create
    @lit = Lit.new(lit_params)
    @lit.user_id = current_user.id
    if @lit.save
      redirect_to '/lits#index'
    else
      render 'new'
    end
  end

  def destroy
    @lit = Lit.find(params[:id])
    @lit.destroy
    redirect_to '/', :notice => "Your fire has been put out"
  end

  def like
    @lit = Lit.find(params[:id])
    @lit.liked_by current_user
    redirect_to '/'
  end

  def dislike
    @lit = Lit.find(params[:id])
    @lit.disliked_by current_user
    redirect_to '/'
  end

  private
  def lit_params
    params.require(:lit).permit(:body)
  end
end
