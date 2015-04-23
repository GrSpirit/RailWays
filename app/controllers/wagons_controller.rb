class WagonsController < ApplicationController
	def index
		@wagons = Wagon.all
	end

	def show
		@wagon = Wagon.find(params[:id])
	end

	def new
		@wagon = Wagon.new
	end

	def edit
		@wagon = Wagon.find(params[:id])
	end

	def create
		@wagon = Wagon.new(wagon_params)

		if @wagon.save
			redirect_to @wagon
		else
			render 'new'
		end
	end

	def update
		@wagon = Wagon.find(params[:id])

		if @wagon.update(wagon_params)
			redirect_to @wagon
		else
			render 'edit'
		end
	end

private
	def wagon_params
		params.require(:wagon).permit(:label, :description, :created_at, :repared_at)
	end

end
