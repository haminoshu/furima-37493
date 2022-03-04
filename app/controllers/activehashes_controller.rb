class ActivehashesController < ApplicationController
  def index
    @activehashes = Activehash.order("created_at DESC")
  end

  def new
    @activehash = Activehash.new
  end

  def create
    @activehash = Activehash.new(activehash_params)
    if @activehash.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def activehash_params
    params.require(:activehash).permit(:category, :status, :shipping_fee_burden, :prefecture, :delivery_day, :item_id)
  end

end
