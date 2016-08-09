json.extract! user, :id, :login, :full_name, :birthday, :email, :country, :state, :city, :zip, :created_at, :updated_at
json.url user_url(user, format: :json)