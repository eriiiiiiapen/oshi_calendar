class MerchandisesController < ApplicationController
  before_action :set_merchandise, only: %i[edit update destroy]
  before_action :set_bookmark, only: %i[update_amount]

  def index
    @merchandises = current_user.merchandises
    @bookmarks_merchandises = current_user.bookmark_merchandises.includes(:user).order(created_at: :asc)

    array_price = []
    array_bookmarks_merchandise = []

    @bookmarks_merchandises.each do |bookmarks_merchandise|
      if Date.today.month == bookmarks_merchandise.start_at.month
      array_bookmarks_merchandise << bookmarks_merchandise
      array_price << bookmarks_merchandise.price * bookmarks_merchandise.bookmarks.find_by(merchandise_id: bookmarks_merchandise.id).amount  
      end

      @month_bookmarks_merchandises = array_bookmarks_merchandise
      @total_price = array_price.sum
    end
      @category_users = current_user.categories    
  end

  def new
    @merchandise = Merchandise.new
  end

  def create
    @merchandise = current_user.merchandises.build(params_merchandise)
    if @merchandise.save
      redirect_to merchandises_path
    else
      render :new
    end
  end

  def update_amount
    if @bookmark.update(bookmark_params)
      redirect_to merchandises_path
    end
  end

  def edit;end

  def update
    if @merchandise.update(params_merchandise)
      redirect_to merchandises_path
    else
      render :edit
    end
  end

  def destroy;end

  private

  def set_bookmark
    @bookmark = current_user.bookmarks.find_by(merchandise_id: params[:merchandise_id])
  end
    
  def bookmark_params  
    params.permit(:amount, :merchandise_id, :user_id)
  end

  def set_merchandise
    @merchandise = current_user.merchandises.find(params[:id])
  end

  def params_merchandise
    params.require(:merchandise).permit(:name, :content, :price, :start_at, :end_at)
  end
end
