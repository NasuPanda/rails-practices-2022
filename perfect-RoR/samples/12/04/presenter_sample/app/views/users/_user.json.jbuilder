json.extract! user, :id, :created_at
json.email user.masked_email
json.url user_url(user, format: :json)
