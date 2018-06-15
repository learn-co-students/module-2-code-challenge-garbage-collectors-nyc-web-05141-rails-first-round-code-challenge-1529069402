class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find_by(id: params[:id])
  end

  def new
    @heroine = Heroine.new()
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.save
      redirect_to heroine_path(@heroine)
    else
      @powers = Power.all
      render :new
    end
  end

  def search
    @heroines = Heroine.select do |heroine|
      heroine.power.name == params[:power][:name]
    end

    render :index
  end

  private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
