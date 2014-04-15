class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @video_extension = VideoExtension.find(params[:video_extension_id])
    enc_dl_url = Qiniu::Utils.urlsafe_base64_encode(@video_extension.ori_thumbnail_small)
    encode_entry_uri = Qiniu::Utils.encode_entry_uri('thebeast',"#{Time.now}.mp4")
    path = "/fetch/#{enc_dl_url}/to/#{encode_entry_uri}"
    host = "http://iovip.qbox.me"
    uri = URI.parse "#{host}#{path}"
    http = Net::HTTP.new(uri.host, uri.port)
    #http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    signing_str = path+"\n"
    encoded_sign = HMAC::SHA1.digest(signing_str,Qiniu::Config.settings[:secret_key])
    request = Net::HTTP::Post.new(uri.path)
    request.add_field('Content-Type', 'application/x-www-form-urlencoded')
    request.add_field('Host','iovip.qbox.me')
    request.add_field("Athorization","QBox #{Qiniu::Config.settings[:access_key]}:#{encoded_sign}")
    response = http.request(request)
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @video }
      else
        format.html { render action: 'new' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @video }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:url)
    end
end
