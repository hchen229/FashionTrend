class BlogsController < ApplicationController
  before_action :find_blog, only: [:show, :edit, :update]

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blogs = Blog.all
  end

  def new
    @blog= current_user.blogs.build
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      redirect_to @blog
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render 'edit'
    end
  end

  def destroy
    Blog.find(params[:id]).destroy

    redirect_to blogs_path
  end

  private

  def find_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :gender, :season, :description, :image)
  end

end
