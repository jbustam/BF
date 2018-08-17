class Solicitud < ApplicationRecord

  belongs_to :usuario

  has_many :materials_solicituds, inverse_of: :solicitud
  has_many :materials, through: :materials_solicituds

  accepts_nested_attributes_for :materials_solicituds
  accepts_nested_attributes_for :materials

  before_save :default

  def default
    self.estado ||= 'nuevo'
  end

  def materials_attributes=(material_attributes)
    material_attributes.values.each do |material_attribute|
      material = Material.find_or_create_by(descripcion: material_attribute[:descripcion])
      puts material_attribute
      self.materials << material
      mat_sol = MaterialsSolicitud.find_by(material_id: material.id, solicitud_id: self.id)
      MaterialsSolicitud.update(mat_sol.id, cantidad: material_attribute[:cantidad])
    end
  end


  def edit_status

  end
end
