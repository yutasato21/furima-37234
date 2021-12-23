class PurchasesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
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
    Payjp.api_key = ""
      Payjp::Charge.create(
        amount: @product.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end