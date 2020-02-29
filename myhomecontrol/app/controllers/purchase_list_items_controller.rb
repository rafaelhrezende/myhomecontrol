class PurchaseListItemsController < ApplicationController
  before_action :set_purchase_list, only: [:create, :new]
  before_action :set_purchase_list_and_item, only: [:edit, :update, :destroy]

  def new
    @purchase_list_item = @purchase_list.purchase_list_items.build
  end

  def edit
  end

  def create
    @purchase_list.purchase_list_items.create(purchase_list_item_params)
    redirect_to purchase_list_path(@purchase_list)
  end

  def update
    update_result = @purchase_list_item.update(purchase_list_item_params)
    if update_result
      redirect_to @purchase_list
    else
      render edit
    end
  end

  def destroy
    @purchase_list_item.destroy
    redirect_to @purchase_list
  end

  private
    def purchase_list_item_params
      params.require(:purchase_list_item).permit(:quantity, :unity, :category, :price, :product_id)
    end

    def set_purchase_list
      @purchase_list = find_purchase_list(params[:purchase_list_id])
    end

    def set_purchase_list_and_item
      set_purchase_list
      @purchase_list_item = @purchase_list.purchase_list_items.find(params[:id])
    end

    def find_purchase_list id
      PurchaseList.find(id)
    end
end
