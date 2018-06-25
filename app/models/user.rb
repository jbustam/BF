class User < ApplicationRecord
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  def self.create_new_user(params)
    @user = User.create!(params)
  end

  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

end
