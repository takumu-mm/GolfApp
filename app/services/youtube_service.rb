require 'google/apis/youtube_v3'

class YoutubeService
  YouTube = Google::Apis::YoutubeV3::YouTubeService.new
  YouTube.key = ENV['YOUTUBE_API_KEY']

  def fetch_top_videos_by_category(category_name)
    category = Category.find_by(name: category_name)
    return [] unless category
    search_keyword = category.search_keyword || category.name

    search_response = YouTube.list_searches(
      'id,snippet', q: "ゴルフ #{search_keyword}",
      max_results: 20, type: 'video', order: 'viewCount',
      region_code: 'JP', relevance_language: 'ja'
    )

    video_ids = search_response.items.map(&:id).map(&:video_id)
    video_details = YouTube.list_videos('snippet,statistics', id: video_ids.join(','))

    sorted_videos = video_details.items.sort_by do |video|
      -video.statistics.like_count.to_i * video.statistics.view_count.to_i
    end.first(5)

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
      'アドレス', '握り方', '基本スイング', 'ドライバー', 'アイアン', 'ウッド', 'UT', 'パター',
      'バンカー', 'ラフ', '強風', '雨', 'アプローチ', 'ロブショット', '転がし', 'フック', 'スライス', 
      'ダフリ', 'トップ', 'テンプラ', '飛距離向上', '安定性', 'コースマネジメント', '100切り', '90切り', '80切り'
    ]
    categories.each do |category_name|
      category = Category.find_or_create_by(name: category_name)
      videos = new.fetch_top_videos_by_category(category_name)
      videos.each do |video_data|
        video = Video.create(
          youtube_video_id: video_data[:youtube_video_id],
          title: video_data[:title],
          channel_name: video_data[:channel_name],
          view_count: video_data[:view_count],
          like_count: video_data[:like_count],
        )
        CategoryVideo.create(video: video, category: category)
      end
    end
  end
end