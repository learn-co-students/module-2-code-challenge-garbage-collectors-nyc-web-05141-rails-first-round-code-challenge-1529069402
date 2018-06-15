class HeroinesController < ApplicationController
  def index
     @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
    @power = @heroine.power
  end

  def new
    @heroine = Heroine.new
    @all_powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    @all_powers = Power.all
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else
      render :new
    end
  end


private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end


end
