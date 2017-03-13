class ProductsController < ApplicationController
	before_filter do
    if params[:category_id]
      @product_category = Shoppe::ProductCategory.where(:permalink => params[:category_id]).first!
    end
    if @product_category && params[:product_id]
      @product = @product_category.products.where(:permalink => params[:product_id]).active.first!      
    end
  end
  
  def filter
    @products = Shoppe::Product.active.with_attributes(params[:key].to_s, params[:value].to_s)
  end
  
	def index
		@products = Shoppe::Product.root.ordered.includes(:product_categories, :variants)
		@products = @products.group_by(&:product_category)
		@product = Shoppe::Product.root.find_by_permalink(params[:permalink])
	end

	def show
		@product = Shoppe::Product.root.find_by_permalink(params[:permalink])
		@attributes = @product.product_attributes.public.to_a
	end

def buy
  @product = Shoppe::Product.root.find_by_permalink!(params[:permalink])
  current_order.order_items.add_item(@product, 1)
  redirect_to product_path(@product.permalink), :notice => "Product has been added successfuly!"
end
	
end
