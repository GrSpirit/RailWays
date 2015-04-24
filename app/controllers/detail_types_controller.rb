class DetailTypesController < ApplicationController
  before_action :set_detail_type, only: [:show, :edit, :update, :destroy]
  def show
  end
  
  def edit
    @detail_class = @detail_type.detail_class
  end

  def create
    @detail_class = DetailClass.find(params[:detail_class_id])
    @detail_class.detail_types.create(detail_type_params)

    redirect_to @detail_class
  end

  def update
    if @detail_type.update(detail_type_params)
      redirect_to @detail_type.detail_class
    else
      render :edit
    end
  end

  def destroy
    @detail_type.destroy
    respond_to do |format|
      format.html { redirect_to @detail_type.detail_class, notice: "Detail type '#{@detail_type.name}' was successfully destroyed." }
      format.json { head :no_content }
    end
  end

private
  def set_detail_type
    @detail_type = DetailType.find(params[:id])
  end

  def detail_type_params
    params.require(:detail_type).permit(:name, :detail_class_id)
  end

end
