class DetailTypesController < ApplicationController
  before_action :set_detail_type, only: [:show, :edit, :update, :destroy]
  def show
  end
  
  def edit
    respond_to do |format|
      format.html
      format.js { render partial: 'list_items/edit', object: @detail_type, as: 'item' }
      format.json { render json: @detail_type }
    end
  end

  def create
    @detail_class = DetailClass.find(params[:detail_class_id])
    @detail_type = @detail_class.detail_types.create(detail_type_params)

    if @detail_type.valid?
      respond_to do |format|
        format.html { redirect_to @detail_class }
        format.js { render partial: 'list_items/create', object: @detail_type, as: 'item' }
        format.json { render json: @detail_type, status: :created, location: @detail_type }
      end
    else
      respond_to do |format|
        format.html { render @detail_class }
        format.json { render json: @detail_type.errors, status: :unprocessable_entity }
        format.js { render partial: 'list_items/new', object: @detail_type, as: 'item' }
      end
    end
  end

  def update
    if @detail_type.update(detail_type_params)
      respond_to do |format|
        format.html { redirect_to @detail_type.detail_class }
        format.js { render partial: 'list_items/update', object: @detail_type, as: 'item' }
      end
    else
      render :edit
    end
  end

  def destroy
    @detail_type.destroy
    respond_to do |format|
      format.html { redirect_to @detail_type.detail_class, notice: "Detail type '#{@detail_type.name}' was successfully destroyed." }
      format.json { head :no_content }
      format.js { render partial: 'list_items/destroy', object: @detail_type, as: 'item' }
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
