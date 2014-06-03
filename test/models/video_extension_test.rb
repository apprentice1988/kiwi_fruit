require "test_helper"

class VideoExtensionTest < ActiveSupport::TestCase
  TEST_URL = 'https://www.youtube.com/watch?v=rvOdBdbZ-k4'
  ATTRI = ['title','ori_thumbnail_medium','provider', 'duration', 'date', 'keywords','description', 'dl_urls']
  def video_extension
    @video_extension || VideoExtension.create!(ori_url: TEST_URL)
  end

  def test_valid
    ATTRI.each do |attr|
      refute_nil(video_extension.send(attr), "video extension'#{attr} cann't be nil")
    end
  end
end
