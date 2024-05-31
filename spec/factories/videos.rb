# spec/factories/videos.rb
FactoryBot.define do
  factory :video do
    youtube_video_id { "dQw4w9WgXcQ" }
    title { "Example Video Title" }
    channel_name { "Example Channel" }
    view_count { 1234 }
    like_count { 56 }
  end
end
