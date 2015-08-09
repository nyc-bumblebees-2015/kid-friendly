class LocationsController < ApplicationController
  def index
  end

  def new
    @location = Location.new
  end

  def show
    @location = Location.find_by(id: params[:id])
    @like = Like.new
  end

  def create
    @location = Location.find_by(name: location_params[:name])
    if @location
      @location.assign_attributes(location_params)
      if @location.save
        redirect_to root_path
      else
        render :new
      end
    else
      @location = Location.new(location_params)
        if @location.save
          redirect_to root_path
        else
          render :new
        end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def find_amenities
    @locations = Location.nearby_amenities(amenity: params[:amenity])
  end

  def report_amenities
    @location = Location.new
  end

  def search
    results = locations_search(params[:prox])

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

  def locations_search(proximity)
    if proximity == 'anywhere'
      Location.name_places(params[:name])
    else
      Location.nearby_places({name: params[:name], lat: params[:lat], lng: params[:lng], prox: params[:prox]})
    end
  end

end
