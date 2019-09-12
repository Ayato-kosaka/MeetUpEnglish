class BlogcommentsController < ApplicationController
  skip_before_action :require_Admin


  def new
    @blogcomment = Blogcomment.new
  end

  def destroy
  end

  def create
    @blogcomment = Blogcomment.new(blogcomment_params)
    respond_to do |format|
      if @blogcomment.save
        format.html { redirect_to Blog.find(@blogcomment.blogId) }
      else
        format.html { render 'new', { blogId: params[:blogId],blogcomment: @blogcomment} }
      end
    end
  end

  def edit
  end

  private
    def blogcomment_params
      params.permit(:name, :text, :blogId)
    end
end
