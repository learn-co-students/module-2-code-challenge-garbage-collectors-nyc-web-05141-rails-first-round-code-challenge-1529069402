class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
    if params[:search]
      @heroines = Heroine.all.select do |heroine|
        heroine.power.name == params[:search]
      end
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
    @power = @heroine.power
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      #passed validations, time to redirect
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
