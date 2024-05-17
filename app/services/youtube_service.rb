require 'google/apis/youtube_v3'

class YoutubeService
  YouTube = Google::Apis::YoutubeV3::YouTubeService.new
  YouTube.key = ENV['YOUTUBE_API_KEY']

  def fetch_top_videos_by_category(category_name)
    category = Category.find_by(name: category_name)
    return [] unless category
    search_keyword = category.search_keyword
    related_keywords = category.related_keywords.split(',').map(&:strip)  # カテゴリの関連キーワードを配列に変換

    search_response = YouTube.list_searches(
      'id,snippet', q: "ゴルフ #{search_keyword}",
      max_results: 50, type: 'video', order: 'viewCount',
      region_code: 'JP', relevance_language: 'ja'
    )

    video_ids = search_response.items.map(&:id).map(&:video_id)
    video_details = YouTube.list_videos('snippet,contentDetails,statistics', id: video_ids.join(','))

    sorted_videos = video_details.items.select do |video|
      title = video.snippet.title.downcase

    # 関連キーワードのいずれかがタイトルに含まれているかをチェック
    related_keywords.any? { |keyword| title.include?(keyword.downcase) }
    end.sort_by do |video|
      -video.statistics.like_count.to_i * video.statistics.view_count.to_i
    end.first(10)

    sorted_videos.map do |video|
      {
        youtube_video_id: video.id,
        title: video.snippet.title,
        channel_name: video.snippet.channel_title,
        view_count: video.statistics.view_count,
        like_count: video.statistics.like_count
      }
    end
  end

  def self.insert_initial_data
    categories = [
      'address', 'grip', 'basic_swing', 'driver', 'iron', 'wood', 'utility', 'putter',
      'bunker', 'rough', 'gradient', 'strong_wind', 'rain', 'approach', 'lob_shot', 'ground_ball', 
      'hook', 'slice', 'duff', 'topped_shot', 'shank', 'chunk', 'skied_ball', 
      'flight_distance', 'stability', 'management', 'hundred_or_less', 'ninety_or_less', 'eighty_or_less'
    ]
    categories.each do |category_name|
      category = Category.find_or_create_by(name: category_name)
      videos = new.fetch_top_videos_by_category(category_name)
      videos.each do |video_data|
        video = Video.find_or_initialize_by(youtube_video_id: video_data[:youtube_video_id])
        video.title = video_data[:title]
        video.channel_name = video_data[:channel_name]
        video.view_count = video_data[:view_count]
        video.like_count = video_data[:like_count]
        video.save
        CategoryVideo.find_or_create_by(video: video, category: category)
      end
    end
  end

  def fetch_video_data(youtube_video_id)
    video_details = YouTube.list_videos('snippet,statistics', id: youtube_video_id)
    video = video_details.items.first
    return nil unless video

    {
      youtube_video_id: video.id,
      title: video.snippet.title,
      channel_name: video.snippet.channel_title,
      view_count: video.statistics.view_count,
      like_count: video.statistics.like_count
    }
  end
end