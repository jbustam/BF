json.extract! proveedor, :id, :nombre, :email, :telefono, :created_at, :updated_at
json.url proveedor_url(proveedor, format: :json)
