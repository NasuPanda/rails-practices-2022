require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { FactoryBot.create(:task) }

  context "有効な属性の時" do
    it "有効であること" do
      expect(task).to be_valid
    end
  end

  context "無効な属性を含む時" do
    it "無効であること" do
      task.name = ""
      task.description = ""
      task.due_on = ""
      expect(task).to_not be_valid
    end

    it "名前が長過ぎれば無効であること" do
      task.name = "a" * 51
      expect(task).to_not be_valid
    end

    it "descriptionが長すぎれば無効であること" do
      task.description = "a" * 51
      expect(task).to_not be_valid
    end

    it "completedが存在しなければ無効であること" do
      task.completed = nil
      expect(task).to_not be_valid
    end
  end
end
