class Material < ApplicationRecord
  has_many :materials_solicituds
  has_many :solicituds, through: :materials_solicituds

  has_many :bodegas_materials
  has_many :bodegas, through: :bodegas_solicituds

  has_many :materials_proveedors
  has_many :proveedors, through: :materials_proveedors
end
