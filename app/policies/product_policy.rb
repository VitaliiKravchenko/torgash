class ProductPolicy < ApplicationPolicy
  
  def initialize(user, product)
    @user = user
    @product = product
  end

  def create?
    true
  end

  def edit?
    ["admin", "moderator"].include?(@user.role) || @user.id == @product.user_id
  end

  def update?
    ["admin", "moderator"].include?(@user.role) || @user.id == @product.user_id
  end
  
  def destroy?
    ["admin", "moderator"].include?(@user.role) || @user.id == @product.user_id
  end
end
