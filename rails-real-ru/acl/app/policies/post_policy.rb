# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN
  def new?
    create?
  end

  def edit?
    @user.admin? || @record.author_id == @post.author_id
  end

  def destroy?
    @user.admin?
  end
  # END
end
