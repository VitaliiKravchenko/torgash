class UserPolicy < ApplicationPolicy

  def initialize(user, resource)
    @user = user
    @resource = resource
  end

  def create?
    true
  end

  def edit?
    ["admin"].include?(@user.role) || @user.id == @resource.id
  end

  def update?
    ["admin"].include?(@user.role) || @user.id == @resource.id
  end
  
  def destroy?
    ["admin"].include?(@user.role) || @user.id == @resource.id
  end
end
