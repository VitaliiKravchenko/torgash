class MicropostPolicy < ApplicationPolicy
#  class Scope < Scope
#    def resolve
#      scope
#    end
#  end
 attr_reader :user, :micropost   

  def initialize(user, micropost)
    @user = user
    @micropost = micropost
  end

  def create?
    true
  end

  def update?
    ["admin", "moderator"].include?(@user.role) || @user.id == @micropost.user_id
  end
end
