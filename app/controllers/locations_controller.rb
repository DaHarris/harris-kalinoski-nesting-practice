class LocationsController < ApplicationController

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @company = Company.find(params[:company_id])
    @location.company_id = params[:company_id]
    @location.save
    redirect_to company_path(@company)
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(location_parms)
    @company = Company.find(params[:company_id])
    redirect_to company_path(@company)
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    @company = Company.find(params[:company_id])
    redirect_to company_path(@company)
  end

  def location_params
    params.require(:location).permit(:city, :street_name, :state, :zip_code, :country)
  end

end
