class MicropostPolicy < ApplicationPolicy
  
  def initialize(user, micropost)
    @user = user
    @micropost = micropost
  end

  def create?
    true
  end

  def edit?
    ["admin", "moderator"].include?(@user.role) || @user.id == @micropost.user_id
  end

  def update?
    ["admin", "moderator"].include?(@user.role) || @user.id == @micropost.user_id
  end
  
  def destroy?
    ["admin", "moderator"].include?(@user.role) || @user.id == @micropost.user_id
  end
end
