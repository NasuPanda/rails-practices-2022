require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  let (:task) { FactoryBot.create(:task) }
  let (:valid_params) { FactoryBot.attributes_for(:task) }
  let (:invalid_params) { FactoryBot.attributes_for(:task, :invalid) }

  before do
    sign_in task.user
    visit root_path
  end

  describe "タスクの作成" do
    context "有効なパラメータ" do
      scenario "タスクの作成に成功する" do
        expect {
          click_link "新規タスク作成"
          fill_in "プロジェクト名",	with: valid_params[:name]
          fill_in "プロジェクト概要",	with: valid_params[:description]
          fill_in "期日",	with: valid_params[:due_on]
          click_button "登録"

          expect(page).to have_content "タスクの作成に成功しました"
          expect(page).to have_content valid_params[:name]
        }.to change(Task, :count).by(1)
      end
    end
    context "無効なパラメータ" do
      scenario "タスクの作成に失敗する" do
        expect {
          click_link "新規タスク作成"
          fill_in "プロジェクト名",	with: invalid_params[:name]
          fill_in "プロジェクト概要",	with: invalid_params[:description]
          fill_in "期日",	with: invalid_params[:due_on]
          click_button "登録"

          expect(page).to have_content "タスクの作成に失敗しました"
          expect(page).to have_content "タスクの作成"
        }.to_not change(Task, :count)
      end
    end
  end

  describe "タスクの編集" do
    before do
      visit task_path(task)
    end
    context "有効なパラメータ" do
      scenario "タスクの編集に成功する" do
        click_link "タスクの編集"
        fill_in "プロジェクト名", with: "New Name"
        fill_in "プロジェクト概要", with: "New Description"
        click_button "更新する"

        expect(page).to have_content "タスクの編集に成功しました"
        expect(page).to have_content "New Name"
        expect(page).to have_content "New Description"
      end
    end
    context "無効なパラメータ" do
      scenario "タスクの編集に失敗する" do
        click_link "タスクの編集"
        fill_in "プロジェクト名", with: invalid_params[:name]
        fill_in "プロジェクト概要", with: invalid_params[:description]
        click_button "更新する"

        expect(page).to have_content "タスクの編集に失敗しました"
        expect(page).to_not have_content invalid_params[:name]
        expect(page).to_not have_content invalid_params[:description]
      end
    end
  end

  describe "タスクの削除", js: true do
    before do
      visit task_path(task)
    end
    scenario "タスクを削除する" do
      click_link "タスクの削除"
      expect {
        expect(page.dismiss_confirm).to eq "本当に削除しますか?"
        expect(page).to_not have_content "削除しました"
      }.to_not change(Task, :count)

      click_link "タスクの削除"
      expect {
        expect(page.accept_confirm).to eq "本当に削除しますか?"
        expect(page).to have_content "削除しました"
      }.to change(Task, :count).by -1
    end
  end
end
