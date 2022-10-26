json.extract! record, :id, :user_id, :recorded, :step, :rank, :created_at, :updated_at
json.url record_url(record, format: :json)
