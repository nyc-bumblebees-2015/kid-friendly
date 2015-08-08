class LocationsController < ApplicationController
  def index
  end

  def show
    @location = Location.find_by(id: params[:id])
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def find_amenities
  end

  def report_amenities
    @location = Location.new
  end

  private

  def location_params
    params.require(:location).permit(:name, :lng, :lat, :place_id, :formatted_address, :formatted_phone_number, :cribs, :changing_stations, :high_chairs, :family_restrooms, :restrooms, :nursing_stations, :water_fountains)
  end
end
