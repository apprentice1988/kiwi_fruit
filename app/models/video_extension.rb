class VideoExtension < ActiveRecord::Base
  has_one :video
  validates :ori_url, :url=>true, :allow_blank => true
  after_create :get_info

  def get_info
    video_info = VideoInfo.new(ori_url)
    self.update(
      title: video_info.title,
      ori_thumbnail_small: video_info.thumbnail_small,
      ori_thumbnail_medium: video_info.thumbnail_medium,
      ori_thumbnail_large: video_info.thumbnail_large,
      provider: video_info.provider,
      duration: video_info.duration,
      date: video_info.date,
      is_available: video_info.available?,
      keywords: video_info.keywords,
      description: video_info.description,
      embed_url: video_info.embed_url,
      dl_urls: ViddlRb.get_urls(ori_url)
    )
  end

  def update_dl_urls
    update_attributes(:dl_urls=>ViddlRb.get_urls(ori_url))
  end
end
