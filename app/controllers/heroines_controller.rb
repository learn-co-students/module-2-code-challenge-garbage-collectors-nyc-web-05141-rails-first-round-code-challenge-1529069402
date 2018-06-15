class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def edit
    @heroine = Heroine.find(params[:id])
  end

  def update
    @heroine = Heroine.find(params[:id])
    if @heroine.update_attributes(heroine_params)
      redirect_to @heroine
    else
      redirect_to action: :index
    end
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to @heroine
    else
      render :new
    end
  end
  # def search
  # @heroine =
  # @power =
  #
  # redirect_to power_path(@power)
  # # end

  def destroy
     @heroine = Heroine.find(params[:id])
     if @heroine.delete
       redirect_to action: 'index'
     else
       render :destroy
     end
  end


  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
