class LikesController < ApplicationController
  before_action :find_like, only: [:destroy]
  before_action :find_lit

  def create
    if already_liked?
      flash[:notice] = "no double ups"
    else
      @lit.likes.create(user_id: current_user.id)
      redirect_to lit_path(@lit)
    end

  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "cannot unlike"
    else
      @like.destroy
      redirect_to lit_path(@lit)
    end
  end

  private
  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id].exists?)
  end

  def find_lit
    @lit = Lit.find(params[:lit_id])
end

  def find_like
    @like = @lit.likes.find(params[:id])
  end

end
