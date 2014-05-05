class TasksController < ApplicationController

	def index
		@tasks = Task.all
	end

	def show
		@task = Task.find(params[:id])
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.new(task_params)

		if @task.save

			flash[:success] = "Thanks for adding a new task"

			redirect_to task_path(@task)

		else

			render "new"

		end

	end

	def edit
		@task = Task.find(params[:id])
	end

	def update 
		@task = Task.find(params[:id])

		if @task.update(task_params)

			flash[:success] = "Your task has been updated"

			redirect_to task_path(@task)

		else

			render "update"

		end

	end

	def destroy
		@task = Task.find(params[:id])

		@task.destroy

		flash[:success] = "You've removed your task"

		redirect_to root_path
	end

	def task_params
		params.require(:task).permit(:title, :task_type, :description, :address, :start_date, :budget)
	end

end
