class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @user = current_user
      @microposts = current_user.microposts.paginate(page: params[:page])
    else
      redirect_to signin_url
    end
  end
end