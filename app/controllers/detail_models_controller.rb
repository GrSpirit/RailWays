class DetailModelsController < ApplicationController
  before_action :set_detail_model, only: [:show, :edit, :update, :destroy]
  def show
  end
  
  def edit
    @detail_type = @detail_model.detail_type
  end

  def create
    @detail_type = DetailType.find(params[:detail_type_id])
    @detail_type.detail_models.create(detail_model_params)

    redirect_to @detail_type
  end

  def update
    if @detail_model.update(detail_model_params)
      redirect_to @detail_model.detail_type
    else
      render :edit
    end
  end

  def destroy
    @detail_model.destroy
    respond_to do |format|
      format.html { redirect_to @detail_model.detail_type, notice: "Detail type '#{@detail_model.name}' was successfully destroyed." }
      format.json { head :no_content }
    end
  end

private
  def set_detail_model
    @detail_model = DetailModel.find(params[:id])
  end

  def detail_model_params
    params.require(:detail_model).permit(:name, :detail_type_id)
  end
end
