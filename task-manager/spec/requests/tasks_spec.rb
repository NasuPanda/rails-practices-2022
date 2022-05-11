require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:task) { FactoryBot.create(:task) }
  let(:valid_params) { FactoryBot.attributes_for(:task) }

  context "ログインユーザーとして" do
    before do
      sign_in task.user
    end

    describe "GET /tasks" do
      it "正常なレスポンスが返ってくること" do
        get tasks_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /tasks/:id" do
      it "正常なレスポンスが返ってくること" do
        get task_path(task)
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /tasks/new" do
      it "正常なレスポンスが返ってくること" do
        get new_task_path
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /tasks/:id/edit" do
      it "正常なレスポンスが返ってくること" do
        get edit_task_path(task)
        expect(response).to have_http_status(:success)
      end
    end

    describe "DELETE /tasks/:id" do
      it "タスクが削除されること" do
        expect {
          delete task_path(task)
        }.to change(Task, :count).by -1
      end

      it "/tasks にリダイレクトされること" do
        delete task_path(task)
        expect(response).to redirect_to tasks_path
      end
    end

    context "有効なパラメータ" do
      describe "POST /tasks" do
        it "タスクが作成されること" do
          expect {
            post tasks_path,
              params: {
                task: {
                  name: valid_params[:name],
                  description: valid_params[:description],
                  due_on: valid_params[:due_on],
                  completed: valid_params[:completed],
                  user_id: task.user_id
                }
              }
          }.to change(Task, :count).by 1
        end

        it "/tasks/:id にリダイレクトされること" do
          post tasks_path,
            params: {
              task: {
                name: valid_params[:name],
                description: valid_params[:description],
                due_on: valid_params[:due_on],
                completed: valid_params[:completed],
                user_id: task.user_id
              }
            }
            expect(response).to redirect_to task_path(Task.last)
        end
      end

      describe "PATCH /tasks/:id" do
        it "タスクが編集されること" do
          patch task_path(task),
            params: {
              task: {
                name: "New Name",
                description: "New Description"
              }
            }
          expect(task.reload.name).to eq("New Name")
          expect(task.description).to eq("New Description")
        end

        it "/tasks/:id にリダイレクトされること" do
          patch task_path(task),
            params: {
              task: {
                name: "New Name",
              }
            }
            expect(response).to redirect_to task_path(task)
        end
      end
    end

    context "無効なパラメータ" do
      let(:invalid_params) { FactoryBot.attributes_for(:task, :invalid) }

      describe "POST /tasks" do
        it "タスクが作成されないこと" do
          expect {
            post tasks_path,
              params: {
                task: {
                  name: invalid_params[:name],
                  description: invalid_params[:description],
                  due_on: invalid_params[:due_on],
                  completed: invalid_params[:completed],
                  user_id: task.user_id
                }
              }
            }.to_not change(Task, :count)
        end
        it "/tasks/new にリダイレクトされること" do
          post tasks_path,
          params: {
            task: {
              name: invalid_params[:name],
              description: invalid_params[:description],
              due_on: invalid_params[:due_on],
              completed: invalid_params[:completed],
              user_id: task.user_id
            }
          }
          expect(response).to redirect_to new_task_path
        end
      end

      describe "PATCH /tasks/:id" do
        it "タスクが編集されないこと" do
          patch task_path(task),
            params: {
              task: {
                name: ""
              }
            }
          expect(task.reload.name).to_not eq("")
        end
        it "/tasks/:id/edit にリダイレクトされること" do
          patch task_path(task),
            params: {
              task: {
                name: ""
              }
            }
            expect(response).to redirect_to edit_task_path
        end
      end
    end
  end

  context "非ログインユーザーとして" do
    describe "GET /tasks" do
      it "/users/sign_in にリダイレクトされること" do
        get tasks_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "GET /tasks/:id" do
      it "/users/sign_in にリダイレクトされること" do
        get task_path(task)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "GET /tasks/new" do
      it "/users/sign_in にリダイレクトされること" do
        get new_task_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "GET /tasks/:id/edit" do
      it "/users/sign_in にリダイレクトされること" do
        get edit_task_path(task)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "DELETE /tasks/:id" do
      it "/users/sign_in にリダイレクトされること" do
        delete task_path(task)
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "POST /tasks" do
      it "/users/sign_in にリダイレクトされること" do
        post tasks_path,
          params: {
            task: {
              name: valid_params[:name],
              description: valid_params[:description],
              due_on: valid_params[:due_on],
              completed: valid_params[:completed],
              user_id: task.user_id
            }
          }
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe "PATCH /tasks/:id" do
      it "/users/sign_in にリダイレクトされること" do
        patch task_path(task),
          params: {
            task: {
              name: "New Name"
            }
          }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
