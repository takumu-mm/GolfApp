require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'serialize' do
    it 'strengthsが配列として正しく保存されること' do
      profile = create(:profile, strengths: [1, 2, 3])
      expect(profile.strengths).to eq([1, 2, 3])
    end

    it 'weaknessが配列として正しく保存されること' do
      profile = create(:profile, weakness: [4, 5])
      expect(profile.weakness).to eq([4, 5])
    end
  end

  describe 'メソッド' do
    it 'translated_strengthsがカテゴリ名を翻訳して返すこと' do
      category = Category.create(name: 'ドライバー')
      profile = create(:profile, strengths: [category.id])
      allow(Category).to receive(:find_by).with(id: category.id).and_return(category)
      expect(profile.translated_strengths).to include('ドライバー')
    end

    it 'translated_weaknessesがカテゴリ名を翻訳して返すこと' do
      category = Category.create(name: 'アイアン')
      profile = create(:profile, weakness: [category.id])
      allow(Category).to receive(:find_by).with(id: category.id).and_return(category)
      expect(profile.translated_weaknesses).to include('アイアン')
    end
  end
end
