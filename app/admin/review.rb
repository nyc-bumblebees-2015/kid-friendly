ActiveAdmin.register Review do
  permit_params :location_id, :user_id, :overall_rating, :cleanliness_rating, :spaciousness_rating, :body
end
