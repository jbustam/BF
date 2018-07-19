class Usuario < ApplicationRecord

  enum rol: [:usuario, :admin]
  has_many :solicituds
  
  before_save { self.email = email.downcase }
  validates :nombre,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
            uniqueness: { case_sensitive: false }


  has_secure_password
end
