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
        format.html { redirect_to lists_url, notice: "List created" }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to lists_url, notice: "List updated" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_url, notice: "List deleted."
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end
end
