class HeroinesController < ApplicationController

  def index
    @heroines = Heroine.all
    @powers = Power.all
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def show
    find_heroine
  end

  def edit
    find_heroine
    @powers = Power.all
  end

  def create
    @heroine = Heroine.create(heroine_params)
    @powers = Power.all
    redirect_to @heroine

    #forgot to add validation in controller
    #commented out here because no time to test
    # @heroine = Heroine.new(heroine_params)
    # if @heroine.valid?
    #   @heroine.save
    #   redirect_to @heroine
    # else
    #   render :new
    # end
  end

  def update
    find_heroine.update(heroine_params)
    redirect_to @heroine
    #forgot to add validation in controller
    #commented out here because no time to test
    # @heroine = Heroine.find(params[:id])
    # if @heroine.valid?
    #   @heroine.update(heroine_params)
    #   redirect_to @heroine
    # else
    #   render :edit
    # end

  end

  def destroy
    find_heroine.destroy
  end

  private

  def find_heroine
      @heroine = Heroine.find(params[:id])
  end

  def heroine_params
      params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
