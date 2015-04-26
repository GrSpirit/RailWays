class DetailClassesController < ApplicationController
  before_action :set_detail_class, only: [:show, :edit, :update, :destroy]

  def index
    @detail_classes = DetailClass.all.order(:name)
    @detail_class = DetailClass.new
  end

  def show
  end

  def new
    @detail_class = DetailClass.new
  end

  def edit
    respond_to do |format|
      @format = format
      format.html
      format.js { render partial: 'list_items/edit', object: @detail_class, as: 'item' }
      format.json { render json: @detail_class }
    end
  end

  def create
    @detail_class = DetailClass.new(detail_class_params)

    if @detail_class.save
      respond_to do |format|
        format.html { redirect_to @detail_class }
        format.js { render partial: 'list_items/create', object: @detail_class, as: 'item' }
        format.json { render json: @detail_class, status: :created, location: @detail_class }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @detail_class.errors, status: :unprocessable_entity }
        format.js { render partial: 'list_items/new', object: @detail_class, as: 'item' }
      end
    end
  end

  def update
    if @detail_class.update(detail_class_params)
      respond_to do |format|
        format.html { redirect_to @detail_class }
        format.js { render partial: 'list_items/update', object: @detail_class, as: 'item' }
      end
    else
      render :edit
    end
  end

  def destroy
    @detail_class.destroy
    respond_to do |format|
      format.html { redirect_to detail_classes_url, notice: 'Detail class was successfully destroyed.' }
      format.json { head :no_content }
      format.js { render partial: 'list_items/destroy', object: @detail_class, as: 'item' }
    end
  end

private
  def set_detail_class
    @detail_class = DetailClass.find(params[:id])
  end

  def detail_class_params
    params.require(:detail_class).permit(:name)
  end
end
