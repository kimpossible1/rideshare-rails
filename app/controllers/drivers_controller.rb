class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    @driver.save
    redirect_to drivers_path
  end

  def update
    @driver = Driver.find(params[:id])
    @driver = Driver.update(driver_params)
    @driver.save

    redirect_to driver_path(@driver)
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end




end
