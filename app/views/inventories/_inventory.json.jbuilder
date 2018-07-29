json.extract! inventory, :id, :Designation, :Description, :Freshness, :image_url, :Karma_Rating, :Cost, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
