class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def new
    @power = Power.new
  end

  def show
    find_power
  end

  def edit
    find_power
  end

  def create
    @power = Power.create(power_params)
    #not creating powers in prompt

  end

  def update
    find_power
    #not updating powers in prompt
  end

  def destroy
    find_power.destroy
  end

  private

  def find_power
      @power = Power.find(params[:id])
  end

  def power_params
      params.require(:power).permit(:name, :description)
  end
end
