class Material < ApplicationRecord
  has_many :materials_solicituds
  has_many :solicituds, through: :materials_solicituds

  has_many :bodegas_materials
  has_many :bodegas, through: :bodegas_solicituds
end
