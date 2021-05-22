class BlogsController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def index
    @blogs = @q.result.page(params[:page]).reverse_order
    @blogs_new = Blog.all.order(created_at: "DESC").limit(5) #新着
    # .order('count(blog.favorites) desc')
    @blogs_ran = Blog.select('blogs.*', 'count(favorites.id) AS favorites').
      left_joins(:favorites).
      group('blogs.id').
      order('favorites DESC').
      limit(5) #ランキング
  end

  def new
    @blog = Blog.new
    @genres = Genre.all
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = current_user
    @blog.save
    redirect_to blogs_path
  end

  def show
    @blogs = Blog.all
    @blog = Blog.find(params[:id])
    @blog_comment = BlogComment.new
  end

  def edit
    @blog = Blog.find(params[:id])
    @genres = Genre.all
  end

  def update
    @blog = Blog.find(params[:id])
    @blog.update(blog_params)
    redirect_to blog_path(@blog)
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  def search
    @results = @q.result.page(params[:page]).reverse_order
  end

  def sort # sort機能　params受け取り
    @params = params[:scene]
    @blogs = Blog.where(scene: @params)
  end

  private

  def blog_params
    params.require(:blog).permit(:image, :scene, :partner, :name, :price, :title, :body, :genre_id)
  end

  def set_q
    @q = Blog.ransack(params[:q])
  end
end
