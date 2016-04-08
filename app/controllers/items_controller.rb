class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC")
  end 

  def new
    #Responsible for the new item 
    @item = Item.new 
  end 

  def create
    #Responsible for saving
    @item = Item.new(item_params)
    if @item.save 
      redirect_to root_path
    else 
      render 'new'
    end 
  end 

  private 

    def item_params 
      params.require(:item).permit(:title, :description)
    end 
end
