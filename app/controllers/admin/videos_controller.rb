class Admin::VideosController < Admin::ApplicationController
  def index
    @video_extensions = VideoExtension.all
  end
end
