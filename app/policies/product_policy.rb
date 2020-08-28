class ProductPolicy < ApplicationPolicy
  attr_reader :user

  def index?
    @user.admin?
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    true
  end

  def destroy?
    @user.is_admin?
  end

  def new?
    create?
  end

  def create?
    true
  end

end
