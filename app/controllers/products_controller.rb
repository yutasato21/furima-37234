class ProductsController < ApplicationController
  before_action :authenticate_user!, only: :new
  
  def index
    @products = Product.includes(:user)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :text, :image, :category_id, :situation_id, :delivery_charge_id, :prefectures_id,
                                    :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end
