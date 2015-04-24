class DetailClassesController < ApplicationController
  before_action :set_detail_class, only: [:show, :edit, :update, :destroy]

  def index
    @detail_classes = DetailClass.all
  end

  def show
  end

  def new
    @detail_class = DetailClass.new
  end

  def edit
  end

  def create
    @detail_class = DetailClass.new(detail_class_params)

    if @detail_class.save
      redirect_to @detail_class
    else
      render :new
    end
  end

  def update
    if @detail_class.update(detail_class_params)
      redirect_to @detail_class
    else
      render :edit
    end
  end

  def destroy
    @detail_class.destroy
    respond_to do |format|
      format.html { redirect_to detail_classes_url, notice: 'Detail class was successfully destroyed.' }
      format.json { head :no_content }
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
