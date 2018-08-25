class Proveedor < ApplicationRecord
  has_many :materials_proveedors
  has_many :materials, through: :materials_proveedors

  accepts_nested_attributes_for :materials
  accepts_nested_attributes_for :materials_proveedors

  def materials_attributes=(material_attributes)
    material_attributes.values.each do |material_attribute|
      material = Material.find_or_create_by(descripcion: material_attribute[:descripcion])
      self.materials << material
    end
  end

end
