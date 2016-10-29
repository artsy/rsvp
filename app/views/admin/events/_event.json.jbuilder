json.extract! event, :id, :name, :presented_by, :guests_allowed, :capacity, :lock_fields, :created_at, :updated_at
json.url event_url(event, format: :json)