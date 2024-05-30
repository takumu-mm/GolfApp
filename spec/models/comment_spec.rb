require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーション' do
    it '本文があれば有効である' do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it '本文がなければ無効である' do
      comment = build(:comment, body: nil)
      comment.valid?
      expect(comment.errors[:body]).to include("を入力してください")
    end

    it '本文が1000文字を超える場合は無効である' do
      comment = build(:comment, body: "a" * 1001)
      comment.valid?
      expect(comment.errors[:body]).to include("1000文字以下で入力してください")
    end
  end
end
