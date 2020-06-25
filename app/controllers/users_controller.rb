class UsersController < ApplicationController
  def profile
    @userid = params[:user_id]
    @userinfo = User.find(params[:user_id])
    @usercount = @userinfo.lits
    @lits = Lit.all
  end

end
