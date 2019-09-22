module ApplicationHelper
  def default_meta_tags
  {
    site: 'Meet Up English 日常にプチ留学を',
    reverse: true,
    separator: '|',
    og: defalut_og,
    twitter: default_twitter_card
  }
end

  private

    def defalut_og
      {
        title: :full_title,          # :full_title とすると、サイトに表示される <title> と全く同じものを表示できる
        description: :description,   # 上に同じ
        url: request.url,
        image: 'https://firebasestorage.googleapis.com/v0/b/test-8d0bf.appspot.com/o/images%2FS__5120002.jpg?alt=media&token=0d0a3277-931a-4822-a88c-9bed623c0c19'
      }
    end

    def default_twitter_card
      {
        card: 'summary_large_image', # または summary
        site: '@meetup_english'            # twitter ID
      }
    end
end
