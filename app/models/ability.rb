# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)
    cannot :read, Report if user.new_record?

    if user.is_a?(User)
      can :manage, Report
    end

  end
end
