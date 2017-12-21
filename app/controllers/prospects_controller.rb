class ProspectsController < ApplicationController
	before_action :authenticate_user!
	load_and_authorize_resource
	def index
		if current_user.role?("SalesManger")
		 @prospects = Prospect.all
		else
		@prospects = current_user.prospects
		end 
		@prospect = Prospect.new

	end
	def create
		@prospect = Prospect.new(prospect_params)
		@prospect.managed_by = current_user.id
		respond_to do |format|
		   if @prospect.save
			  format.html { redirect_to prospects_path,notice: "successfully  added prospect"}
			  format.js
	 	    else
			 format.html {render action: new }
			 format.js
		    end
		end
	end
	def new 
		@prospect = Prospect.new(prospect_params)
		#@prospect.managed_by = current_user.id
	end
	def edit
		 @prospect = Prospect.find(params[:id])
	end
	def show
		@prospect = Prospect.find(params[:id])
	end
	def update
		@prospect = Prospect.find(params[:id])
		 if @prospect.update_attributes(prospect_params)
		 	redirect_to prospects_path, notice: "successfully updated prospect"
		else
			render action: "edit"
		end
	end

	def destroy
		@prospect = Prospect.find(params[:id])
		@prospect.destroy
		redirect_to prospects_path, notice: "successfully deleted record"
	end

	private
	def prospect_params
		params[:prospect].permit(:full_name, :email, :phone, :location, :stage_id, :managed_by)
	end

end
