json.extract! user, :id, :password, :authority, :nickname, :level_id, :created_at, :updated_at
json.url user_url(user, format: :json)
