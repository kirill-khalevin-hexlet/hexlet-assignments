# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  # BEGIN

  def index?
    true
  end

  def show?
    true
  end

  def create?
    authed?
  end

  def new?
    authed?
  end

  def update?
    admin? || author?
  end

  def edit?
    admin? || author?
  end

  def destroy?
    admin?
  end

  private

  def admin?
    user&.admin?
  end

  def author?
    user&.id == record.author_id
  end

  def authed?
    user.present?
  end
  # END
end
