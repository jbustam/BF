class BodegasMaterial < ApplicationRecord
  belongs_to :material
  belongs_to :bodega
end
