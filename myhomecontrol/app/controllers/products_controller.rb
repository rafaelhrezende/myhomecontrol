class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:term] && params[:term] != ''
      @products = Product.search params[:term]
    else
      @products = current_user.get_current_context.products
    end
  end

  def show
      authorize! :show, @product
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.context = current_user.get_current_context

    save_result = @product.save
    if save_result
      redirect_to @product
    else
      render 'new'
    end
  end

  def update
    update_result = @product.update(product_params)
    if update_result
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name,:brand, :category, :description)
    end

    def set_product
      @product = find_product(params[:id])
    end

    def find_product id
      Product.find(id)
    end
end
