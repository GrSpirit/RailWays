class WagonsController < ApplicationController
  http_basic_authenticate_with name: 'dhh', password: 'secret', except: [:index, :show]
  
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

  def destroy
    @wagon = Wagon.find(params[:id])
    @wagon.destroy

    redirect_to wagons_path
  end

private
  def wagon_params
    params.require(:wagon).permit(:label, :description, :manufactured_at, :repaired_at)
  end

end
