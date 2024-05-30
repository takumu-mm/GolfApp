require 'rails_helper'

RSpec.describe "カテゴリー表示", type: :system do
  let(:user) { create(:user) }
  let!(:category) { create(:category, name: "driving") }
  let!(:videos) do
    create_list(:video, 5).each do |video|
      video.categories << category
      video.save
    end
  end

  before do
    driven_by(:rack_test)
    sign_in user
    visit category_path(name: category.name)
  end

  it "ページタイトルが正しく表示される" do
    expect(page).to have_selector 'h1', text: "Driving おすすめ動画"
  end

  it "スコア順にビデオが降順で表示される" do
    sorted_videos = videos.sort_by { |v| -(v.view_count * v.like_count) }
    expect(page).to have_content(sorted_videos.first.title)
  end
end
