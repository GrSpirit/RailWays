class DetailModelsController < ApplicationController
  before_action :set_detail_model, only: [:show, :edit, :update, :destroy]
  def show
  end
  
  def edit
    respond_to do |format|
      format.html
      format.js { render partial: 'list_items/edit', object: @detail_model, as: 'item' }
      format.json { render json: @detail_model }
    end
  end

  def create
    @detail_type = DetailType.find(params[:detail_type_id])
    @detail_model = @detail_type.detail_models.create(detail_model_params)

    if @detail_model.valid?
      respond_to do |format|
        format.html { redirect_to @detail_type }
        format.js { render partial: 'list_items/create', object: @detail_model, as: 'item' }
        format.json { render json: @detail_model, status: :created, location: @detail_model }
      end
    else
      respond_to do |format|
        format.html { render @detail_type }
        format.json { render json: @detail_model.errors, status: :unprocessable_entity }
        format.js { render partial: 'list_items/new', object: @detail_model, as: 'item' }
      end
    end
  end

  def update
    if @detail_model.update(detail_model_params)
      respond_to do |format|
        format.html { redirect_to @detail_model.detail_class }
        format.js { render partial: 'list_items/update', object: @detail_model, as: 'item' }
      end
    else
      render :edit
    end
  end

  def destroy
    @detail_model.destroy
    respond_to do |format|
      format.html { redirect_to @detail_model.detail_type, notice: "Detail type '#{@detail_model.name}' was successfully destroyed." }
      format.json { head :no_content }
      format.js { render partial: 'list_items/destroy', object: @detail_model, as: 'item' }
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
