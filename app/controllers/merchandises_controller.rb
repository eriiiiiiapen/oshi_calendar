class MerchandisesController < ApplicationController
  before_action :set_merchandise, only: %i[edit update destroy]
  def index
    @merchandises = current_user.merchandises

    array_merchandise = []

    @merchandises.each do |merchandise|
      array_merchandise << merchandise if Time.zone.today.month == merchandise.start_at.month
    end
    @month_merchandises = array_merchandise
  end

  def new
    @merchandise = Merchandise.new
    @category = Category.new
    @category_merchandise = CategoryMerchandise.new

    @categories = Category.all.map(&:name)

    respond_to do |format|
      format.html
      format.json { render json: @categories.to_json }
    end
  end

  def create
    @merchandise = current_user.merchandises.build(params_merchandise)
    @category = Category.new(category_params)
    if @merchandise.save
      @category = Category.find_by(name: params[:category][:name]) unless @category.save
      @category_merchandise = CategoryMerchandise.create(category_id: @category.id, merchandise_id: @merchandise.id)
      redirect_to merchandises_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @merchandise.update(params_merchandise)
      @category.update(category_params)
      redirect_to merchandises_path
    else
      render :edit
    end
  end

  def destroy; end

  def autocomplete_category
    @categories = Category.select(:name).where("name like '%#{params[:term]}%'").order(:name).reject(&:blank?)
    @categories = @categories.map(&:name)
    render json: @categories.to_json
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def autocomplete_params
    params.permit(:category)
  end

  def set_merchandise
    @merchandise = current_user.merchandises.find(params[:id])
  end

  def params_merchandise
    params.require(:merchandise).permit(:name, :content, :price, :start_at, :end_at)
  end
end
