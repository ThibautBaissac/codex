class MouvementPolicy < ApplicationPolicy
  def edit?
    user
  end

  def create?
    user
  end

  def update?
    user
  end

  def destroy?
    user
  end

  def add_selected_element?
    user
  end
end
