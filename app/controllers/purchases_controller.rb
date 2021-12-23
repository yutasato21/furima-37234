class PurchasesController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
    @purchase_address = PurchaseAddress.new
  end

  def create
    @product = Product.find(params[:product_id])
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post, :prefectures, :municipalities, :number, :building, :telephone).merge(user_id: current_user.id, product_id: params[:product_id], purchase_id: params[:purchase_id])
  end
end