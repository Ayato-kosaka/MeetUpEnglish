class BlogsController < ApplicationController
  include Pagy::Backend
  protect_from_forgery
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  skip_before_action :require_Admin,only:[:index, :show]

  # GET /blogs
  # GET /blogs.json
  def index
    @category = Blogcategory.all.order(:id)
    @selected_category_id = params[:event_search] ? Blogcategory.find_by(name: params[:event_search]).id : 1
    @pagy, @blogs = pagy( (@selected_category_id == 1) ? Blog.all.order(id: "DESC") : Blog.where( category_id: @selected_category_id ).order(id: "DESC"), items: 8 )
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    @next_blog =  Blog.where("id > "+@blog.id.to_s).order(:id).limit(1)[0]
    @before_blog =  Blog.where("id < "+@blog.id.to_s).order(:id)[-1]
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog
    else
      render :new
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    if @blog.update(blog_params)
      redirect_to @blog
    else
      render :edit
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    Section.where(blogId: @blog.id).each{|n|n.destroy}
    Blogcomment.where(blogId: @blog.id).each{|n|n.destroy}
    redirect_to blogs_url
  end

  def new_category
    @blogcategory = Blogcategory.new
  end

  def create_category
    @blogcategory = Blogcategory.new(category_params)
    if @blogcategory.save
      redirect_to blogs_url
    else
      render:new_category
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :text, :image, :category_id)
    end

    def category_params
      params.require(:blogcategory).permit(:name, :image)
    end

    def event_search_params
      params.require(:event_search).permit(:keyword)
    end
end
