class CategoriesController < ApplicationController
  before_action :require_login

  def index
    @category = current_user.select_category_users.includes(:user).order(created_at: :asc)
  end
end
