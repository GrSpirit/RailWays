class WagonsController < ApplicationController
	def index
		@wagons = Wagon.all
	end

	def show
		@wagon = Wagon.find(params[:id])
	end

	def new
	end

	def create
		@wagon = Wagon.new(wagon_params)

		@wagon.save
		redirect_to @wagon
	end

private
	def wagon_params
		params.require(:wagon).permit(:label, :description, :created_at, :repared_at)
	end

end
