class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.jefatura?
      can :manage, :all
      can :cotizar, :proveedor

    elsif user.bodeguero? || user.supervisor?
      can :read, Usuario, :id => user.id
      can :manage, Solicitud
      can :manage, Bodega
      can :read, OrdenDeCompra, :usuario_id => user.id
      cannot :edit_status, Solicitud

    elsif user.usuario?
      can :read, Usuario, :id => user.id
      can :manage, Solicitud, :usuario_id => user.id
      cannot :edit_status, Solicitud

    end

  end
end
