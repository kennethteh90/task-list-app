class TaskListsController < ApplicationController

  before_action :user_identity

  def index
    # byebug
    @task_lists = if params[:term]
      @user.task_lists.where('name LIKE ?', "%#{params[:term]}%")
    else
      @user.task_lists.all.order(name: :asc)
    end
  end

	def show
		@task_list = TaskList.find(params[:id])
	end

	def new
		@task_list = TaskList.new
	end

	def edit
		@task_list = TaskList.find(params[:id])
	end

	def create
		@task_list = @user.task_lists.new(task_list_params)
		@task_list.save
		redirect_to task_lists_path
	end

	def update
		@task_list = TaskList.find(params[:id])
		@task_list.update(task_list_params)
		redirect_to task_lists_path
	end

	def destroy
		TaskList.destroy(params[:id])
		redirect_to task_lists_path
	end

	private

	def task_list_params
		params.require(:task_list).permit(:name, :term)
	end

  def user_identity
    if logged_in?
      @user = User.find(current_user.id)
    else
      @user = nil
    end
  end

end
