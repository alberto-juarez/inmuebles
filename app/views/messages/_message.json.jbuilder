json.extract! message, :id, :titulo, :mensaje, :account_id, :visible, :created_at, :updated_at
json.url message_url(message, format: :json)
