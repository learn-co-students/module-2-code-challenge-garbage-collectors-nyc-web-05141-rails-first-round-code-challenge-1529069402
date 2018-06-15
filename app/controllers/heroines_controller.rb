class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = find_heroine
  end

  def search
    @heroines = Heroine.all.select { |heroine|  heroine.power.name == params[:power_name]  }
    if @heroines.present?
      flash[:notice]="You got them!"
      render :index
    else
      flash[:notice]="Ain't Heroines with that SuperPowa!"
      @heroines = Heroine.all
      render :index
    end
  end

  def new
    @heroine = Heroine.new
    @all_powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to @heroine
    else
      @all_powers = Power.all
      flash[:notice]="New Heroine Creation Failed:"
      render :new
    end
  end

private

  def find_heroine
    Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :power_name)
  end

end
