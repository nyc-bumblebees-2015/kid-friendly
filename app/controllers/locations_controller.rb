class LocationsController < ApplicationController
  before_action :get_location, only: [:show, :edit, :update, :destroy]

  def index
    @home_page = true
  end

  def new
    @location = Location.new
  end

  def show
    @like = Like.new
  end

  def create
    @location = Location.find_by(name: location_params[:name])
    if @location
      @location.assign_attributes(location_params)
      if @location.save
        redirect_to submission_path(location: location_params)
      else
        render :new
      end
    else
      @location = Location.new(location_params)
        if @location.save
          redirect_to submission_path(location: location_params)
        else
          render :new
        end
    end
  end

  def submission
    @location = Location.new(location_params)
  end

  def edit
    render :show unless current_user && current_user.is_admin?
  end

  def update
    @location.update(location_params)
    if @location.save
      redirect_to @location
    else
      flash[:errors] = @location.errors.full_messages
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to root_path
  end

  def search_amenities
  end

  def find_amenities
    @locations = Location.nearby_amenities(amenity: params[:amenity], lat: params[:lat], lng: params[:lng])
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
    params.require(:location).permit(:name, :lng, :lat, :place_id, :formatted_address, :formatted_phone_number, :cribs, :changing_stations, :high_chairs, :family_restrooms, :restrooms, :nursing_stations, :water_fountains, :play_areas)
  end

  def locations_search(proximity)
    if proximity == 'anywhere'
      Location.name_places(params[:name])
    else
      Location.nearby_places({name: params[:name], lat: params[:lat], lng: params[:lng], prox: params[:prox]})
    end
  end

  def get_location
    @location = Location.find_by(id: params[:id])
  end

end
