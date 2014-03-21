class Order < ActiveRecord::Base
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products, dependent: :destroy
  accepts_nested_attributes_for :products, allow_destroy: true, reject_if: lambda { |a| a[:name].blank? }
  
  def self.create_new
    @order = Order.new
    @order.save
  end
end
