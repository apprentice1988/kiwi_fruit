class Video < ActiveRecord::Base
  has_one :caption
  belongs_to :industrie, :counter_cache => true
  belongs_to :video_extension
  delegate :ori_url,:provider,:dl_url,:description,:keywords,:embed_url,:is_available,:duration,:title,:ori_thumbnail_small,:ori_thumbnail_medium, :ori_thumbnail_large, :to=>:video_extensions, :allow_nil=>true
end
