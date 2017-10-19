class TasksController < ApplicationController

  before_action :prepare_tasklist

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

  def edit
    @task = @task_list.tasks.find(params[:id])
  end

  def update
    if @task = @task_list.tasks.update(task_params)
      redirect_to task_list_tasks_path
    else
      render :edit
    end
  end

  def show
    @task = @task_list.tasks.find(params[:id])
  end

  def destroy
    @task_list.tasks.destroy(params[:id])
    redirect_to task_list_tasks_path
  end

  def completed
    @task = @task_list.tasks.find(params[:id])
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

end
