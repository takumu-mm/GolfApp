require 'rails_helper'

RSpec.describe "コメント機能", type: :system do
  let(:user) { create(:user) }
  let(:shared_video) { create(:shared_video) }

  before do
    driven_by(:rack_test)
    sign_in user
    visit shared_video_path(shared_video)
  end

  describe "コメントの投稿と削除" do
    before do
      fill_in 'comment_body', with: 'これはテストコメントです'
      find('button.btn-primary').click
    end

    it "ユーザーがコメントを作成できる" do
      expect(page).to have_content('これはテストコメントです')
    end

    it "コメント入力フィールドが表示されている" do
      visit shared_video_path(shared_video)
      expect(page).to have_selector('textarea#comment_body', visible: :visible)
    end

    it "コメント削除リンクが表示されている" do
      expect(page).to have_selector('a.delete-comment-link', visible: :visible)
    end

    it "ユーザーがコメントを削除できる" do
      find('a.delete-comment-link').click
      expect(page).not_to have_content('これはテストコメントです')
    end
  end
end
