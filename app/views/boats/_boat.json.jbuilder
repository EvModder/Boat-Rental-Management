json.extract! boat, :id, :name, :description, :image, :created_at, :updated_at, :state, :city
json.url boat_url(boat, format: :json)
