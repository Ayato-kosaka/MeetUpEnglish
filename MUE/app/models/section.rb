class Section < ApplicationRecord
  has_one_attached :image
  belongs_to :blog
  after_validation do |section|
    if section.title == "前回の開催の様子"
      category_id = 4
      this_blog = section.blog
      last_blog = Blog.where(blogcategory_id: category_id).where('created_at<?', this_blog.created_at).last
      a_href = "href='/blogs/#{last_blog.id}'"
      section.text += ("<div id='last_lesson'><a class='image' #{a_href}><img src='#{ last_blog.image.attachment.service.send(:object_for, last_blog.image.key).public_url }'></a><a class='title' #{a_href}>#{ last_blog.title }</a></div>")
    end
  end
end
