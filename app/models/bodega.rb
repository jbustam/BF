class Bodega < ApplicationRecord
  has_many :bodegas_materials
  has_many :materials, through: :bodegas_materials


end
