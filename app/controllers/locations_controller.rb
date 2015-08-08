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
  end

  def search
    results = Location.near_places({name: params[:name], lat: '40.7048872', lng: '-74.0123737', prox: '.5'})

    if results
      render json: results
    else
      render nothing: true, status: 404
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :lng, :lat, :place_id, :formatted_address, :formatted_phone_number, :cribs, :changing_stations, :high_chairs, :family_restrooms, :restrooms, :nursing_stations, :water_fountains)
  end
end
