class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.search(params[:search])

      if @heroines.present?
      @heroines
      else
        flash[:notice]="Ain't Heroines with that SuperPowa!"
        @heroines = Heroine.all
      end

  end

  def show
    @heroine = find_heroine
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

  def destroy
    find_heroine.destroy
    redirect_to heroines_path
  end

private

  def find_heroine
    Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

end
