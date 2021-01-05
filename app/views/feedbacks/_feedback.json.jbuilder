json.extract! feedback, :id, :observation, :feeling, :need, :request, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
