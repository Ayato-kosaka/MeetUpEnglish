class BlogcommentsController < ApplicationController
  skip_before_action :require_Admin


  def new
    @blogcomment = Blogcomment.new
  end

  def destroy
  end

  def create
    @blogcomment = Blog.find(params[:blogId]).comments.new(blogcomment_params)
    if @blogcomment.save
      redirect_to Blog.find(@blogcomment.blogId)
    else
      render :new
    end
  end

  def edit
  end

  private
    def blogcomment_params
      params.require(:blogcomment).permit(:name, :text)
    end
end
