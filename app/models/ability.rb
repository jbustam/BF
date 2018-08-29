class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.jefatura?
      can :manage, :all
    elsif user.usuario?
      can :manage, Solicitud, :usuario_id => user.id
      cannot :edit_status, Solicitud
    elsif user.bodeguero? || user.supervisor?
      can :manage, Solicitud, :estado => "Aceptado"
    end

  end
end
