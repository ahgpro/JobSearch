class ProjectJobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    record.project.user == user
  end

  def destroy?
    record.project.user == user
  end

end


