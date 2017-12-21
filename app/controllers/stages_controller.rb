class StagesController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource

	def index
		@stages = Stage.all
		@stage = Stage.new
	end
	def new
		@stage = Stage.new
	end
	def create
		@stage = Stage.new(stage_params)
		if @stage.save
			redirect_to stages_path,notice:"successfully added stage"
		else
			 render action: "new"
		end
	end
	
	def edit
		@stage  = Stage.find(params[:id])
	end
	def update
		@stage = Stage.find(params[:id])
		if @stage.update_attributes(stage_params)
		redirect_to stages_path,notice:"successfully updated prospect"
		else
		render action: "new"
		end
	end
	def show
		@stage = Stage.find(params[:id])
	end
	private
	def stage_params
	 params[:stage].permit(:name,:description,:interest_level) 
	end
end

