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
    task = Task.new(task_params)
    # completedを真偽値にキャストする
    task.completed = ActiveRecord::Type::Boolean.new.cast(task.completed)
    task.user_id = current_user.id
    if task.save
      redirect_to task
      flash[:notice] = "タスクの作成に成功しました"
    else
      render 'new'
      flash[:alert] = "タスクの作成に失敗しました"
    end
  end

  def update
    task = Task.find(params[:id])
    if task.update(task_params)
      flash[:success] = "タスクを編集しました"
      redirect_to task
    else
      render 'edit'
    end
  end

  private
    def task_params
      params.require(:task).permit(:name, :description, :due_on, :completed)
    end
end
