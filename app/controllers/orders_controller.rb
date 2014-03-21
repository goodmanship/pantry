class OrdersController < ApplicationController
  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if @order.update_attributes(params[:order].permit(:placed_by, :placed_at, :created_at, :updated_at, products_attributes: [:_destroy, :id, :name, :created_at, :updated_at]))
      redirect_to edit_order_path(params[:id])
    else
      flash.now.alert = "Save failed"
      render "edit"
    end
  end
end
