json.extract! note, :id, :notable_type, :notable_id, :user_id, :title, :body, :created_at, :updated_at
json.url note_url(note, format: :json)
