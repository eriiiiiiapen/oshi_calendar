class CategoriesController < ApplicationController
  before_action :require_login
  before_action :category_set, only: %i[destroy]
  def index
    @category_users = current_user.categories
    @q = Category.ransack(params[:q])
    @categories = @q.result(distinct: true).includes(%i[user category_users]).order(created_at: :desc)
  end

  def destroy
    redirect_to categories_path
  end

  private

  def category_set
    @category = current_user.categories.find(params[:id])
  end
end
