class TasksController < ApplicationController

  before_action :prepare_tasklist
  before_action :prepare_task, only: [:edit, :completed, :show]

  def index
    @tasks = @task_list.tasks.all
  end

  def new
    @task = @task_list.tasks.new
  end

  def create
    @task = @task_list.tasks.build(task_params)
    if @task.save
      redirect_to task_list_tasks_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task = @task_list.tasks.update(task_params)
      redirect_to task_list_tasks_path
    else
      render :edit
    end
  end

  def show; end

  def destroy
    @task_list.tasks.destroy(params[:id])
    redirect_to task_list_tasks_path
  end

  def completed
    @task.toggle(:completed).save
    redirect_to task_list_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:description, :due_date, :completed)
  end

  def prepare_tasklist
    @task_list = TaskList.find(params[:task_list_id])
  end

  def prepare_task
    @task = @task_list.tasks.find(params[:id])
  end

end
