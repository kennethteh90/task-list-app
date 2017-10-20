class TaskListsController < ApplicationController
	def index
    @task_lists = if params[:term]
      TaskList.where('name LIKE ?', "%#{params[:term]}%")
    else
      TaskList.all
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
		@task_list = TaskList.new(task_list_params)
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
end
