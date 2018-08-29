class OrdenDeCompra < ApplicationRecord
  has_one :material
  belongs_to :usuario

  before_save :default

  def default
    self.estado ||= 'Nuevo'
  end

  def edit_status
  end

end
