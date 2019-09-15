# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://meet-up-english.herokuapp.com"

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  add root_path, changefreq: 'daily'                       #  県スケジュール一覧ページ
  add overview_path, changefreq: 'daily'                       #  料金/すきま時間英会話とはページ
  Prefecture.find_each do |prefecture|                               # 県スケジュール詳細ページ
    add schedule_path(prefecture.id), changefreq: 'daily',
                               lastmod: prefecture.updated_at
  end

  add blogs_path, changefreq: 'daily'                       # ブログ一覧ページ
  Blog.find_each do |blog|                               # ブログ詳細ページ
    add blog_path(blog), changefreq: 'daily',
                               lastmod: blog.updated_at
  end
end
