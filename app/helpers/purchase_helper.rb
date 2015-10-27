# Helper methods defined here can be accessed in any controller or view in the application

module Darksidetwo
  class App
    module PurchaseHelper
	  def make_price_from_product_and_quantity(product, qty)
		return Money.new(product.skus.data.first.price * qty.to_i, product.skus.data.first.currency)
	  end
    end

    helpers PurchaseHelper
  end
end
