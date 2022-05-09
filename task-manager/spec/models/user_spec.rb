require 'rails_helper'

RSpec.describe User, type: :model do
  let (:user) { FactoryBot.build(:user) }

  context "有効なユーザ" do
    it "有効であること" do
      expect(user).to be_valid
    end
  end

  context "無効なユーザ" do
    it "メールアドレスが無ければ無効なこと" do
      user.email = ""
      expect(user).to_not be_valid
    end

    it "パスワードが無ければ無効なこと" do
      user.password = ""
      expect(user).to_not be_valid
    end
  end
end
