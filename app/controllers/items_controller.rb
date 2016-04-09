class ItemsController < ApplicationController
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end 

  def show
    #Need to find by id to find that specific item. I use the find_item method below.
    #@item = Item.find(params[:id])
  end 

  def new
    #Responsible for the new item 
    #@item = Item.new
    @item = current_user.items.build 
  end 

  def create
    #Responsible for saving
    @item = current_user.items.build(item_params)
    if @item.save 
      redirect_to root_path
    else 
      render 'new'
    end 
  end

  def edit 
  end 

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else 
      render 'edit'
    end 
  end  

  def destroy
    @item.destroy
    redirect_to root_path
  end 

  private 

    def find_item
      @item = Item.find(params[:id])
    end 

    def item_params 
      params.require(:item).permit(:title, :description)
    end 
end
