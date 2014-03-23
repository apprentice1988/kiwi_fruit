class VideoExtensionsController < ApplicationController
  def index
    @video_extensions = VideoExtension.all
  end

  def new
    @video_extension = VideoExtension.new
  end

  def create
    @video_extension = VideoExtension.new(video_extension_params)
    respond_to do |format|
      if @video_extension.save
        format.html { redirect_to video_extensions_path, notice: 'Video was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def show
    @video_extension = VideoExtension.find(params[:id])
  end

  private
    def video_extension_params
      params.require(:video_extension).permit(:ori_url)
    end
end
