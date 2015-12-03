class PostulantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def accepted?
    true
  end

  def rejected?
    true
  end
end
