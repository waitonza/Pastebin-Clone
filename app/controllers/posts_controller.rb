class PostsController < ApplicationController

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		flash[:notice] = "You Paste successfully"
  		flash[:color] = "valid"
  		redirect_to @post
  	else
  		flash[:notice] = "Form is invalid"
  		flash[:color] = "invalid"
  		redirect_to new_web_path(:post => @post)
  	end
  end

  private
    def post_params
      params.require(:post).permit(:name, :user, :paste_content)
    end

end
