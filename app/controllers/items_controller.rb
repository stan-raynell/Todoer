class ItemsController < ApplicationController

  
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
  private

  def item_params
    params.require(:item).permit(:title)
  end
end