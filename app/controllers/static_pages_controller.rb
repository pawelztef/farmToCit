class StaticPagesController < ApplicationController
	def home
		@categories = Shoppe::ProductCategory.all
		@products = Shoppe::Product.root.ordered.includes(:product_categories, :variants)
	end
	
	def show
		@products = Shoppe::Product.root.ordered.includes(:product_categories, :variants)
    end

	def help
	end

	def about
	end

	def paypal
	end
end
