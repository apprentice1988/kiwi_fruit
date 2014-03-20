class Video < ActiveRecord::Base
  validates_presence_of :url, :src, :tag_id, :title
  before_create :set_src
  def set_src
    if url =~ /youtube/
      id = url.match(/v=\S*/).to_s.slice(2..-1)
      src = "//www.youtube.com/embed/#{id}"
    elsif url =~ /vimeo/
      id = url.match(/\d*\z/).to_s
      src = "//player.vimeo.com/video/#{id}"
    elsif url =~ /youku/
      id = url.match(/id_\w*/).to_s.slice(3..-1)
      src = "http://player.youku.com/embed/#{id}"
    else
      self.errors.add(:url,"url invalid")
    end
  end
end
