require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    it '名前がなければ無効である' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it 'メールアドレスがなければ無効である' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it '重複したメールアドレスなら無効である' do
      create(:user, email: 'test@example.com')
      user2 = build(:user, email: 'test@example.com')
      user2.valid?
      expect(user2.errors[:email]).to include("はすでに存在します")
    end

    it 'パスワードが6文字未満なら無効である' do
      user = build(:user, password: '12345', password_confirmation: '12345')
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
  end
end
