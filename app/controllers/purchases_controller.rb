class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_purchase, only: [:index, :create]
  before_action :move_to_index, only: :index

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post, :prefectures_id, :municipalities, :number, :building, :telephone).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end

  def set_purchase
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    redirect_to root_path if current_user.id == @product.user.id || @product.purchase.present? == true
  end
end