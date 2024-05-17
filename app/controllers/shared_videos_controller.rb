class SharedVideosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shared_video, only: [:show, :edit, :update, :destroy]

  def index
    @shared_videos = SharedVideo.includes(:video, :user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @shared_video = SharedVideo.new
  end

  def create
    @shared_video = SharedVideo.new(shared_video_params)
    @shared_video.user = current_user

    youtube_video_id = extract_video_id(params[:shared_video][:youtube_video_id])
    video = initialize_video(youtube_video_id)

    if video.save
      @shared_video.video = video
      save_and_respond
    else
      flash.now[:alert] = video.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @shared_video.update(shared_video_params)
      redirect_to @shared_video, notice: '動画の更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    @shared_video.destroy
    redirect_to shared_videos_url, notice: '動画の削除に成功しました。'
  end

  private

  def set_shared_video
    @shared_video = SharedVideo.find(params[:id])
  end

  def extract_video_id(url)
    URI.parse(url).path.split('/').last.split('?').first
  end

  def shared_video_params
    params.require(:shared_video).permit(:body)
  end

  def initialize_video(youtube_video_id)
    youtube_service = YoutubeService.new
    video_data = youtube_service.fetch_video_data(youtube_video_id)

    if video_data.blank?
      flash.now[:alert] = '動画データの取得に失敗しました。'
      render :new, status: :unprocessable_entity
      return
    end

    Video.find_or_initialize_by(youtube_video_id:).tap do |video|
      video.attributes = video_data
    end
  end

  def save_and_respond
    if @shared_video.save
      respond_to do |format|
        format.html { redirect_to shared_videos_path, notice: '動画の投稿に成功しました。' }
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace('shared_videos_list', partial: 'shared_videos/list', locals: { shared_videos: @shared_videos })
        end
      end
    else
      flash.now[:alert] = @shared_video.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end
end
