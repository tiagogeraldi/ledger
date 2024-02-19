json.extract! person, :id, :name, :phone_number, :national_id, :active, :created_at, :updated_at
json.url person_url(person, format: :json)
