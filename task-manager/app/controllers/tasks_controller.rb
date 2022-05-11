class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    # completedを真偽値にキャストする
    @task.completed = ActiveRecord::Type::Boolean.new.cast(@task.completed)
    @task.user_id = current_user.id
    if @task.save
      flash[:notice] = "タスクの作成に成功しました"
      redirect_to @task
    else
      flash[:alert] = "タスクの作成に失敗しました"
      redirect_to new_task_path
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "タスクの編集に成功しました"
      redirect_to @task
    else
      flash[:alert] = "タスクの編集に失敗しました"
      redirect_to edit_task_path
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash[:notice] = "削除しました"
      redirect_to tasks_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to @task
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :description, :due_on, :completed)
    end
end
