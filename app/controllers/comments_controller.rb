class CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:delete]
  def new
    @comment = Comment.new
  end
  
  def create
    if signed_in? 
      @user_id = current_user.id
    else
      @user_id = 0
    end
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.create(comment_params.merge(:user_id => @user_id))
    if @micropost.save
      flash[:success] = "Cooment just added ^^"
      redirect_to micropost_path(@micropost)
    else
      flash[:success] = "Name and Comment can't be blank !"
      redirect_to micropost_path(@micropost)
    end
  end
  
  def delete
    @comment = Comment.find_by(id: params[:id])
    data = Array.new
    if @comment.present?
      @comment.destroy
      data = {'ERROR' => '0'}
      render json: data
    else
      data = {'ERROR' => '1'}
      render json: data
    end
  end
  
  private

    def comment_params
      params.require(:comment).permit(:name, :content)
    end
end