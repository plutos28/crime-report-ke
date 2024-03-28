# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)
    cannot :read, Report if user.new_record?

    if user.is_a?(User)
      can :read, Report
      can :create, Report if user.persisted?
      
    end

  end
end
