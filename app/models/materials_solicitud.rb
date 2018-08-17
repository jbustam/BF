class MaterialsSolicitud < ApplicationRecord
  belongs_to :material
  belongs_to :solicitud
end
