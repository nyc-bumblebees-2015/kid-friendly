module LocationsHelper
  def image_for(location)
    if location.yelp_id
      location_url = Yelp.client.business(location.yelp_id).image_url
      image_tag(location_url, alt: location.name, class: "location_image")
    end
  end
end
