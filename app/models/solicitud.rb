class Solicitud < ApplicationRecord

  has_many :materials
  belongs_to :usuario
  accepts_nested_attributes_for :materials

  before_save :default

  def default
    self.estado ||= 'nuevo'
  end

  def edit_status

  end
end
