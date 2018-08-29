class Solicitud < ApplicationRecord

  belongs_to :usuario
  belongs_to :bodega

  has_many :materials_solicituds, inverse_of: :solicitud
  has_many :materials, through: :materials_solicituds

  accepts_nested_attributes_for :materials_solicituds
  accepts_nested_attributes_for :materials

  before_save :default

  def default
    self.estado ||= 'Nuevo'
  end

  def materials_attributes=(material_attributes)
    material_attributes.values.each do |material_attribute|
      material = Material.find_or_create_by(descripcion: material_attribute[:descripcion])
      self.materials << material
    end
  end


  def edit_status

  end
end
