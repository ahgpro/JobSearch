class ProjectJobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    raise
    record.project.user == user
  end
end
