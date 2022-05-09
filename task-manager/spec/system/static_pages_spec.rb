require 'rails_helper'

RSpec.describe "StaticPages", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "root" do
    let(:user) { FactoryBot.create(:user) }

    context "ログイン済ユーザーとして" do
      before do
        sign_in user
        # deviseヘルパーメソッドではセッションが作成されるだけなのでvisitしておく
        visit root_path
      end
      it "正しくリンクが表示されること" do
        expect(page).to have_link "登録情報編集", href: edit_user_registration_path
        expect(page).to have_link "ログアウト", href: destroy_user_session_path
      end
    end
    context "非ログインユーザーとして" do
      it "正しくリンクが表示されること" do
        visit root_path
        expect(page).to have_link "サインアップ", href: new_user_registration_path
        expect(page).to have_link "ログイン", href: new_user_session_path
      end
    end
  end
end
