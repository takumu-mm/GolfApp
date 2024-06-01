class VideosController < ApplicationController
  def autocomplete
    term = params[:q]
    # Videoのtitleに基づく検索結果を取得
    video_results = SharedVideo.joins(:video).where('videos.title ILIKE ?', "%#{term}%")

    # オートコンプリートの結果はVideoのtitleのみを表示
    @results = video_results.map { |shared_video| OpenStruct.new(id: shared_video.id, name: shared_video.video.title) }.uniq(&:name).first(5)

    render partial: 'shared_videos/autocomplete_results', locals: { results: @results }
  end
end
