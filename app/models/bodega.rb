class Bodega < ApplicationRecord
  has_many :bodegas_materials
  has_many :materials, through: :bodegas_materials

  accepts_nested_attributes_for :bodegas_materials
  accepts_nested_attributes_for :materials

  def materials_attributes=(material_attributes)
    material_attributes.values.each do |material_attribute|
      material = Material.find_or_create_by(descripcion: material_attribute[:descripcion])
      self.materials << material
    end
  end


end
