class WagonsController < ApplicationController
	def new
	end

	def create
		@wagon = Wagon.new(params[:wagon])

		@wagon.save
		redirect_to @wagon
	end
end
