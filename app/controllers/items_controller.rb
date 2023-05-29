class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
  end
  
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.new(item_params)
    if @item.save
      redirect_to @list
    else
      flash.alert = "Empty item!"
      redirect_to list_path(@list), status: :unprocessable_entity
    end
  end

  def toggle
    @item = Item.find(params[:id])
    @item.update(checked: params[:checked])  
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to @list, notice: "Item deleted."
  end
  private

  def item_params
    params.require(:item).permit(:title)
  end
end