class PostsController < ApplicationController

  before_action :authenticate_user!, except: :show
  before_action :authorize_user, except: [:index, :show]

  def index
  @posts = Post.paginate(page: params[:page], per_page: 8).order('created_at DESC')

    if params[:search]
      @posts = Post.search(params[:search]).paginate(page: params[:page], per_page: 8).order("created_at DESC")
    else
      @posts = Post.paginate(page: params[:page], per_page: 8).order('created_at DESC')
    end
  end

  def show
  @post = Post.find(params[:id])
  end

  def new
  @post = Post.new
  end
  
  def create
    @post = Post.new
    @post.title = params[:post][:title] 
    @post.body = params[:post][:body]
    @post.tags = params[:post][:tags]
    @post.featured = params[:post][:featured]
    @post.user = current_user

     if @post.save
       flash[:notice] = "Post was saved."
       redirect_to @post
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :new
     end
   end

  def edit
  @post = Post.find(params[:id])
  end

  def update
     @post = Post.find(params[:id])
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]
     @post.tags = params[:post][:tags]
     @post.featured = params[:post][:featured]

     if @post.save
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
   end

   def destroy
     @post = Post.find(params[:id])
 
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to posts_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end

  private 

  def authorize_user
    unless current_user.admin?
      flash[:alert] = "You must be an administrator to do that."
      redirect_to posts_path
    end
  end
end
