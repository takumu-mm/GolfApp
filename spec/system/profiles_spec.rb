require 'rails_helper'

RSpec.describe "プロフィール機能", type: :system do
  let(:user) { create(:user) }
  let!(:profile) { create(:profile, user:) }

  before do
    driven_by(:rack_test)
    sign_in user
    visit edit_profile_path(profile)
  end

  it "プロフィール編集フォームのタイトルが正しく表示される" do
    expect(page).to have_selector('h1.title-contents', text: I18n.t('profiles.edit.title'))
  end

  it "プロフィール編集フォームが表示される" do
    expect(page).to have_selector('form.edit_profile')
  end

  it "プロフィールが正しく更新されたことを確認する" do
    select '80台', from: 'profile[score]'
    click_button I18n.t('helpers.submit.update')
    expect(page).to have_content(I18n.t('defaults.flash_message.profile_update'))
  end

  it "プロフィールのスコアが正しく更新されていることを確認する" do
    select '80台', from: 'profile[score]'
    click_button I18n.t('helpers.submit.update')
    expect(profile.reload.score).to eq('80台')
  end
end
