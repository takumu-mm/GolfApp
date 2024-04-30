require 'google/apis/youtube_v3'

class YoutubeService
  YouTube = Google::Apis::YoutubeV3::YouTubeService.new
  YouTube.key = ENV['YOUTUBE_API_KEY']

  def fetch_top_videos_by_category(category_name)
    category = Category.find_by(name: category_name)
    return [] unless category
    search_keyword = category.search_keyword || category.name
    related_keywords = category.related_keywords.split(',').map(&:strip)  # カテゴリの関連キーワードを配列に変換
    related_keywords << category_name  # カテゴリ名も検索キーワードに追加

    search_response = YouTube.list_searches(
      'id,snippet', q: "ゴルフ #{search_keyword}",
      max_results: 20, type: 'video', order: 'viewCount',
      region_code: 'JP', relevance_language: 'ja'
    )

    video_ids = search_response.items.map(&:id).map(&:video_id)
    video_details = YouTube.list_videos('snippet,contentDetails,statistics', id: video_ids.join(','))

    sorted_videos = video_details.items.select do |video|
      title = video.snippet.title.downcase
      description = video.snippet.description.downcase
      tags = (video.snippet.tags || []).map(&:downcase)

      # 関連キーワードのいずれかがタイトル、説明、タグに含まれているかをチェック
    related_keywords.any? { |keyword| 
      title.include?(keyword.downcase) || 
      description.include?(keyword.downcase) || 
      tags.any? { |tag| tag.include?(keyword.downcase) }
      }
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
      'アドレス', '握り方', '基本スイング', 'ドライバー', 'アイアン', 'ウッド', 'ユーティリティ', 'パター',
      'バンカー', 'ラフ', '強風', '雨', 'アプローチ', 'ロブショット', '転がし', 'フック', 'スライス', 
      'ダフリ', 'トップ', 'シャンク', 'チャックリ', 'テンプラ', '飛距離', '安定性', 'コースマネジメント', '100切り', '90切り', '80切り'
    ]
    categories.each do |category_name|
      category = Category.find_or_create_by(name: category_name)
      videos = new.fetch_top_videos_by_category(category_name)
      videos.each do |video_data|
        video = Video.find_or_create_by(youtube_video_id: video_data[:youtube_video_id]) do |v|
          v.title = video_data[:title]
          v.channel_name = video_data[:channel_name]
          v.view_count = video_data[:view_count]
          v.like_count = video_data[:like_count]
        end
        CategoryVideo.find_or_create_by(video: video, category: category)
      end
    end
  end
end