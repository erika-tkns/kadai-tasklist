class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]
 
  def index
    @user = current_user
    @tasklists = current_user.tasks.all.page(params[:page])
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @tasklist = current_user.tasks.build(task_params)

    if @tasklist.save
      flash[:success] = 'Task を投稿しました。'
      redirect_to tasks_url
    else
      @tasklists = current_user.tasks.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'Task の投稿に失敗しました。'
      render 'tasks/index'
    end
  end
  
  def edit
  end


  def update

    if @tasklist.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to tasks_url
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasklist.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end

  private

  def set_task
    @tasklist = current_user.tasks.find_by(id: params[:id])
    unless @tasklist
      redirect_to root_path
    end
  end

  # Strong Parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
end