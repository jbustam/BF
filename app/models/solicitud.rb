class Solicitud < ApplicationRecord

  has_many :materials
  belongs_to :usuario
  accepts_nested_attributes_for :materials
end
