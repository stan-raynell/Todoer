class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_url, notice: "List was successfully created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
