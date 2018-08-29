class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.jefatura?
      can :manage, :all
      can :cotizar, :proveedor
      can :edit_status, OrdenDeCompra
      can :edit_status, Solicitud

    elsif user.supervisor?
      can :read, Usuario, :id => user.id
      can :manage, Solicitud
      can :manage, Bodega
      can :manage, OrdenDeCompra
      cannot :edit, OrdenDeCompra, :estado => ['Cotizando', 'Aceptado', 'Rechazado']
      cannot :edit_status, Solicitud
      cannot :edit_status, OrdenDeCompra
      can :read, Proveedor

    elsif user.bodeguero?
      can :read, Usuario, :id => user.id
      can :manage, Solicitud
      can :manage, Bodega
      can :manage, OrdenDeCompra
      cannot :edit, OrdenDeCompra, :estado => ['Cotizando', 'Aceptado', 'Rechazado']
      cannot :edit_status, Solicitud
      cannot :edit_status, OrdenDeCompra

    elsif user.usuario?
      can :read, Usuario, :id => user.id
      can :manage, Solicitud, :usuario_id => user.id
      cannot :edit, Solicitud, :estado => ['Rechazado', 'Aceptado', 'En espera', 'Atendido', 'Recibido']
      cannot :edit_status, Solicitud

    end

  end
end
