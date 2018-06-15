class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end
  def show
    @heroine = Heroine.find(params[:id])
  end
  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  # def create
  #   @heroine = Heroine.new(heroine_params)
  #   @powers = Power.all
  #   @heroine.save
  #   redirect_to @heroine
  # end


  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroines_path
    else
      @heroine = Heroine.new(heroine_params)
      render :new
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name)
  end
end
