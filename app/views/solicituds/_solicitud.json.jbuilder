json.extract! solicitud, :id, :usuario, :created_at, :updated_at
json.url solicitud_url(solicitud, format: :json)
