class PitchesController < ApplicationController

	before_action :make_sure_logged_in

	def new

		#add pitch to the right task
		@task = Task.find(params[:task_id])
		@pitch = @task.pitches.new

		# add current user as the "pitcher"
		@pitch.user = current_user

	end

	def create

		@task = Task.find(params[:task_id])
		@pitch = @task.pitches.new(pitch_params)
		@pitch.user = current_user

		if @pitch.save

			flash[:success] = "Thanks for pitching for this task"

			redirect_to root_path

		else

			render "new"

		end

	end

	def pitch_params
		params.require(:pitch).permit(:price,:body,:start_date)
	end


end
