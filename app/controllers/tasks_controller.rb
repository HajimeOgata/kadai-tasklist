class TasksController < ApplicationController
  before_action :set_tasks, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all.page(params[:page])
  end

  def show
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(tasks_params)

    if @tasks.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @tasks.update(tasks_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasks.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private
   
  def set_tasks
    @tasks = Task.find(params[:id])
  end

  # Strong Parameter
  def tasks_params
    params.require(:task).permit(:content, :status)
  end


end
