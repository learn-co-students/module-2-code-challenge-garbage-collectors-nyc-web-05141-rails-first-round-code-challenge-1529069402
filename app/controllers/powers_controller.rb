class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = find_power
  end

  private

  def find_power
    Power.find(params[:id])
  end

end
