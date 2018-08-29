class OrdenDeCompra < ApplicationRecord
  has_one :material
  belongs_to :usuario
end
