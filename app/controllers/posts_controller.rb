class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
    redirect_to posts_path , notice: 'successfully posted'
    else
      flash.now[:alert] = 'failed'
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
   @post = Post.find_by(id: params[:id])
   if @post.update(content:  params[:content])
     flash[:notice] = "Your comment has been updated."
    redirect_to("/posts/index")
   else
    redirect_to("/posts/#{@post.id}/edit")
  end
 end

 def destroy
   @post = Post.find_by(id: params[:id])
   if @post.present?
   @post.destroy
    flash[:notice] = "Your comment has been deleted."
   redirect_to("/posts/index")
   else
   redirect_to ("/")
 end
 end

 private
  def post_params
    params.require(:post).permit(:job,:place,:start_date,:end_date,:content)
  end
end
