json.extract! usuario, :id, :nombre, :email, :rol, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
