class Material < ApplicationRecord
  has_many :materials_solicituds
  has_many :solicituds, through: :materials_solicituds
end
