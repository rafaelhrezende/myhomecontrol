class PurchaseListsController < ApplicationController
  before_action :set_purchase_list, only: [:show, :edit, :update, :destroy]

  def index
    @purchase_lists = current_user.get_current_context.purchase_lists
  end

  def show
    authorize! :show, @purchase_list
  end

  def new
    @purchase_list = PurchaseList.new
  end

  def edit
  end

  def create
    @purchase_list = PurchaseList.new(purchase_list_params)
    @purchase_list.context = current_user.get_current_context

    save_result = @purchase_list.save
    if save_result
      redirect_to @purchase_list
    else
      render 'new'
    end
  end

  def update
    update_result = @purchase_list.update(purchase_list_params)
    if update_result
      redirect_to @purchase_list
    else
      render 'edit'
    end
  end

  def destroy
    @purchase_list.destroy
    redirect_to purchase_lists_path
  end

  private
    def purchase_list_params
      params.require(:purchase_list).permit(:name, :purchase_date, :totalprice, :company)
    end

    def set_purchase_list
      @purchase_list = find_purchase_list(params[:id])
    end

    def find_purchase_list id
      PurchaseList.find(id)
    end
end
