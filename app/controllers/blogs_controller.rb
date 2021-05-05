class BlogsController < ApplicationController

  before_action :set_q, only: [:index, :search]

  def index
    @blogs = @q.result
  end

  def new
    @blog=Blog.new
    @genres = Genre.all
  end

  def create
    #byebug
    @blog=Blog.new(blog_params)
    @blog.user = current_user
    @blog.save
    redirect_to blogs_path
  end

  def show
    @blog=Blog.find(params[:id])
    @blog_comment=BlogComment.new
  end

  def edit
    @blog=Blog.find(params[:id])
    @genres = Genre.all
  end

  def update
    @blog=Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to blog_path(@blog)
  end

  def destroy
    @blog=Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  def search
    @results = @q.result
  end

  private
  def  blog_params
  params.require(:blog).permit(:image,:name,:price,:title,:body,:genre_id)
  end


  def set_q
    @q = Blog.ransack(params[:q])
  end

end
